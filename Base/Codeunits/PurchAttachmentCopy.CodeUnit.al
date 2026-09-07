codeunit 50130 JK_PurchAttachmentsCopy
{
    trigger OnRun()
    begin

    end;

    // procedure CopyAttachmentsToReceipt(var SourceRecord: RecordRef; var TargetRecord: RecordRef)
    // var
    //     DocumentAttachment: Record "Document Attachment";
    //     TempBlob: Codeunit "Temp Blob";
    //     DocumentAttachment2: Record "Document Attachment";
    //     NewDocumentAttachment: Record "Document Attachment";
    //     PurchReceiptRecordRef: RecordRef;
    //     Instream: InStream;
    //     OutStream: OutStream;
    // begin
    //     if SourceRecord.Number <> Database::"Purchase Header" then
    //         Error('El RecordRef de origen debe apuntar a Purchase Header (tabla 38).');

    //     if TargetRecord.Number <> Database::"Purch. Rcpt. Header" then
    //         Error('El RecordRef de destino debe apuntar a Purch. Rcpt. Header (tabla 120).');

    //     if Format(SourceRecord.Field(3).Value) = '' then
    //         Error('El RecordRef de origen no contiene un número de documento.');

    //     PurchReceiptRecordRef.Open(120);
    //     PurchReceiptRecordRef.Get(TargetRecord.RecordId);

    //     Clear(DocumentAttachment);
    //     DocumentAttachment.SetCurrentKey("Table ID", "No.", "Document Type");
    //     DocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
    //     DocumentAttachment.SetRange("No.", SourceRecord.Field(3).Value);
    //     DocumentAttachment.SetRange("Document Type", DocumentAttachment."Document Type"::Order);

    //     if not DocumentAttachment.FindSet() then
    //         exit;
    //     repeat
    //         if DocumentAttachment."Document Reference ID".HasValue then begin
    //             NewDocumentAttachment.Init();
    //             NewDocumentAttachment."Table ID" := PurchReceiptRecordRef.Number;
    //             NewDocumentAttachment."No." := PurchReceiptRecordRef.Field(3).Value;
    //             NewDocumentAttachment."Line No." := 0;
    //             NewDocumentAttachment.Validate("File Name", DocumentAttachment."File Name");
    //             NewDocumentAttachment."File Extension" := DocumentAttachment."File Extension";
    //             NewDocumentAttachment."File Type" := DocumentAttachment."File Type";
    //             NewDocumentAttachment.Insert();
    //             Clear(TempBlob);
    //             Clear(Instream);
    //             Clear(OutStream);
    //             TempBlob.CreateOutStream(OutStream);
    //             DocumentAttachment."Document Reference ID".ExportStream(OutStream);
    //             TempBlob.CreateInStream(Instream);
    //             NewDocumentAttachment."Document Reference ID".ImportStream(Instream, NewDocumentAttachment."File Name");
    //             // CopyStream(OutStream, Instream);
    //             NewDocumentAttachment.Modify();
    //         end;
    //     until DocumentAttachment.Next() = 0;

    //     PurchReceiptRecordRef.Close();
    // end;

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    // local procedure CopyAttachments_OnAfterPostPurchaseDoc(
    //     var PurchaseHeader: Record "Purchase Header";
    //     var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
    //     PurchRcpHdrNo: Code[20];
    //     RetShptHdrNo: Code[20];
    //     PurchInvHdrNo: Code[20];
    //     PurchCrMemoHdrNo: Code[20];
    //     CommitIsSupressed: Boolean)
    // var
    //     SourceRecord: RecordRef;
    //     TargetRecord: RecordRef;
    //     PurchRcpHeader: Record "Purch. Rcpt. Header";
    // begin

    //     If PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
    //         exit;

    //     if PurchRcpHdrNo = '' then
    //         exit;

    //     SourceRecord.GetTable(PurchaseHeader);

    //     if PurchRcpHeader.Get(PurchRcpHdrNo) then begin
    //         TargetRecord.GetTable(PurchRcpHeader);
    //         CopyAttachmentsToReceipt(SourceRecord, TargetRecord);
    //     end;
    // end;


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

    // procedure CopyAttachmentsToReceipt2(var PurchaseHeader: Record "Purchase Header"; var PurchRcpHeader: Record "Purch. Rcpt. Header")
    // var
    //     DocumentAttachment: Record "Document Attachment";
    //     TempBlob: Codeunit "Temp Blob";
    //     DocumentAttachment2: Record "Document Attachment";
    //     NewDocumentAttachment: Record "Document Attachment";
    //     PurchReceiptRecordRef: RecordRef;
    //     Instream: InStream;
    //     OutStream: OutStream;
    // begin
    //     PurchReceiptRecordRef.GetTable(PurchRcpHeader);

    //     Message(
    //     'Origen:\Table %1\No. %2\Attachments: %3\Destino:\Table %4\Record ID %5',
    //     Database::"Purchase Header",
    //     PurchaseHeader."No.",
    //     DocumentAttachment.Count(),
    //     PurchReceiptRecordRef.Number(),
    //     PurchReceiptRecordRef.RecordId());

    //     Clear(DocumentAttachment);
    //     DocumentAttachment.SetCurrentKey("Table ID", "No.", "Document Type");
    //     DocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
    //     DocumentAttachment.SetRange("No.", PurchaseHeader."No.");
    //     DocumentAttachment.SetRange("Document Type", DocumentAttachment."Document Type"::Order);

    //     if not DocumentAttachment.FindSet() then
    //         exit;
    //     repeat
    //         if DocumentAttachment."Document Reference ID".HasValue then begin
    //             NewDocumentAttachment.Init();
    //             NewDocumentAttachment."Table ID" := PurchReceiptRecordRef.Number;
    //             NewDocumentAttachment."No." := PurchReceiptRecordRef.Field(3).Value;
    //             NewDocumentAttachment."Line No." := 0;
    //             NewDocumentAttachment.Validate("File Name", DocumentAttachment."File Name");
    //             NewDocumentAttachment."File Extension" := DocumentAttachment."File Extension";
    //             NewDocumentAttachment."File Type" := DocumentAttachment."File Type";
    //             NewDocumentAttachment.Insert();
    //             Clear(TempBlob);
    //             Clear(Instream);
    //             Clear(OutStream);
    //             TempBlob.CreateOutStream(OutStream);
    //             DocumentAttachment."Document Reference ID".ExportStream(OutStream);
    //             TempBlob.CreateInStream(Instream);
    //             NewDocumentAttachment."Document Reference ID".ImportStream(Instream, NewDocumentAttachment."File Name");
    //             // CopyStream(OutStream, Instream);
    //             NewDocumentAttachment.Modify();
    //         end;
    //     until DocumentAttachment.Next() = 0;

    //     // PurchReceiptRecordRef.Close();
    // end;

    procedure CopyAttachmentsToReceipt2(var PurchaseHeader: Record "Purchase Header"; var PurchRcpHeader: Record "Purch. Rcpt. Header")
    var
        DocumentAttachment: Record "Document Attachment";
        TempBlob: Codeunit "Temp Blob";
        NewDocumentAttachment: Record "Document Attachment";
        PurchReceiptRecordRef: RecordRef;
        Instream: InStream;
        OutStream: OutStream;
    begin
        PurchReceiptRecordRef.GetTable(PurchRcpHeader);

        Clear(DocumentAttachment);

        DocumentAttachment.SetCurrentKey("Table ID", "No.", "Document Type");
        DocumentAttachment.SetRange("Table ID", Database::"Purchase Header");
        DocumentAttachment.SetRange("No.", PurchaseHeader."No.");
        DocumentAttachment.SetRange(
            "Document Type",
            DocumentAttachment."Document Type"::Order);

        Message(
            'Purchase Order: %1\Attachments encontrados: %2\Destino: %3',
            PurchaseHeader."No.",
            DocumentAttachment.Count(),
            PurchReceiptRecordRef.RecordId());

        if not DocumentAttachment.FindFirst() then
            exit;

        if DocumentAttachment."Document Reference ID".HasValue then begin

            Message(
                'Copiando attachment:\Archivo: %1\Extensión: %2',
                DocumentAttachment."File Name",
                DocumentAttachment."File Extension");

            NewDocumentAttachment.Init();
            NewDocumentAttachment."Table ID" := PurchReceiptRecordRef.Number;
            NewDocumentAttachment."No." := PurchReceiptRecordRef.Field(3).Value;
            NewDocumentAttachment."Line No." := 0;

            NewDocumentAttachment.Validate(
                "File Name",
                DocumentAttachment."File Name");

            NewDocumentAttachment."File Extension" :=
                DocumentAttachment."File Extension";

            NewDocumentAttachment."File Type" :=
                DocumentAttachment."File Type";

            NewDocumentAttachment.Insert();

            Clear(TempBlob);
            Clear(Instream);
            Clear(OutStream);

            TempBlob.CreateOutStream(OutStream);

            DocumentAttachment."Document Reference ID".ExportStream(OutStream);

            TempBlob.CreateInStream(Instream);

            NewDocumentAttachment."Document Reference ID".ImportStream(
                Instream,
                NewDocumentAttachment."File Name");

            NewDocumentAttachment.Modify();

            Message('Attachment copiado correctamente.');
        end;
    end;

    // procedure CopyAttachmentsToReceipt2(
    // var PurchaseHeader: Record "Purchase Header";
    // var PurchRcpHeader: Record "Purch. Rcpt. Header")
    // var
    //     DocumentAttachment: Record "Document Attachment";
    // begin
    //     Clear(DocumentAttachment);

    //     DocumentAttachment.SetRange(
    //         "Table ID",
    //         Database::"Purchase Header");

    //     DocumentAttachment.SetRange(
    //         "No.",
    //         PurchaseHeader."No.");

    //     DocumentAttachment.SetRange(
    //         "Document Type",
    //         DocumentAttachment."Document Type"::Order);

    //     Message(
    //         'Purchase Order: %1\Table ID: %2\Attachments encontrados: %3',
    //         PurchaseHeader."No.",
    //         Database::"Purchase Header",
    //         DocumentAttachment.Count());

    //     if not DocumentAttachment.FindSet() then
    //         exit;

    //     repeat
    //         Message(
    //             'Attachment encontrado:\File: %1\Extensión: %2\Table ID: %3\No.: %4',
    //             DocumentAttachment."File Name",
    //             DocumentAttachment."File Extension",
    //             DocumentAttachment."Table ID",
    //             DocumentAttachment."No.");
    //     until DocumentAttachment.Next() = 0;
    // end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", 'OnAfterPostPurchaseDoc', '', false, false)]
    local procedure CopyAttachments_OnAfterPostPurchaseDoc2(
        var PurchaseHeader: Record "Purchase Header";
        var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line";
        PurchRcpHdrNo: Code[20];
        RetShptHdrNo: Code[20];
        PurchInvHdrNo: Code[20];
        PurchCrMemoHdrNo: Code[20];
        CommitIsSupressed: Boolean)
    var
        PurchRcpHeader: Record "Purch. Rcpt. Header";
    begin

        If PurchaseHeader."Document Type" <> PurchaseHeader."Document Type"::Order then
            exit;

        if PurchRcpHdrNo = '' then
            exit;

        if PurchRcpHeader.Get(PurchRcpHdrNo) then begin
            CopyAttachmentsToReceipt2(PurchaseHeader, PurchRcpHeader);
        end;
    end;

}
