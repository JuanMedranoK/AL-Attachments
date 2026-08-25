codeunit 50130 JK_PurchAttachmentsCopy
{
    trigger OnRun()
    begin

    end;

    procedure CopyAttachmentsToReceipt(var SourceRecord: RecordRef; var TargetRecord: RecordRef)
    var
        DocumentAttachment: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        DocumentAttachment2: Record "Document Attachment";
        NewDocumentAttachment: Record "Document Attachment";
        PurchReceiptRecordRef: RecordRef;
        Instream: InStream;
        OutStream: OutStream;
    begin
        if TargetRecord.Number <> Database::"Purch. Rcpt. Header" then
            Error('El RecordRef de destino debe apuntar a Purch. Rcpt. Header (tabla 120).');

        PurchReceiptRecordRef.Open(120);
        PurchReceiptRecordRef.Get(TargetRecord.RecordId);

        Clear(DocumentAttachment);
        DocumentAttachment.SetCurrentKey("Table ID", "No.", "Document Type");
        DocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
        DocumentAttachment.SetRange("No.", SourceRecord.Field(3).Value);
        DocumentAttachment.SetRange("Document Type", DocumentAttachment."Document Type"::Order);
        if not DocumentAttachment.FindSet() then
            exit;
        repeat
            if DocumentAttachment."Document Reference ID".HasValue then begin
                NewDocumentAttachment.Init();
                NewDocumentAttachment."Table ID" := PurchReceiptRecordRef.Number;
                NewDocumentAttachment."No." := PurchReceiptRecordRef.Field(3).Value;
                NewDocumentAttachment."Line No." := 0;
                NewDocumentAttachment.Validate("File Name", DocumentAttachment."File Name");
                NewDocumentAttachment."File Extension" := DocumentAttachment."File Extension";
                NewDocumentAttachment."File Type" := DocumentAttachment."File Type";
                NewDocumentAttachment.Insert();
                Clear(TempBlob);
                Clear(Instream);
                Clear(OutStream);
                TempBlob.CreateOutStream(OutStream);
                DocumentAttachment."Document Reference ID".ExportStream(OutStream);
                TempBlob.CreateInStream(Instream);
                NewDocumentAttachment."Document Reference ID".ImportStream(Instream, NewDocumentAttachment."File Name");
                CopyStream(OutStream, Instream);
                NewDocumentAttachment.Modify();
            end;
        until DocumentAttachment.Next() = 0;

        PurchReceiptRecordRef.Close();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure CopyAttachments_OnAfterPostPurchaseDoc(
        var PurchaseHeader: Record "Purchase Header";
        var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PurchRcpHdrNo: Code[20];
        RetShptHdrNo: Code[20];
        PurchInvHdrNo: Code[20];
        PurchCrMemoHdrNo: Code[20];
        CommitIsSupressed: Boolean)
    var
        SourceRecord: RecordRef;
        TargetRecord: RecordRef;
        PurchRcpHeader: Record "Purch. Rcpt. Header";
    begin

        If PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
            exit;

        if PurchRcpHdrNo = '' then
            exit;

        SourceRecord.GetTable(PurchaseHeader);

        if PurchRcpHeader.Get(PurchRcpHdrNo) then begin
            TargetRecord.GetTable(PurchRcpHeader);
            CopyAttachmentsToReceipt(SourceRecord, TargetRecord);
        end;
    end;


    // procedure Test()
    // var
    //     RecRef: RecordRef;
    // begin
    //     RecRef.Open(Database::"Purchase Header");

    //     if RecRef.FindFirst() then
    //         Message('Tabla: %1\Registro: %2\Campos: %3', RecRef.Number, Format(RecRef.RecordId), RecRef.FieldCount())
    //     else
    //         Message('No hay registros en %1.', RecRef.Number);

    //     RecRef.Close();
    // end;

}
