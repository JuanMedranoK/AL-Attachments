pageextension 50130 JK_PurchTest extends "Posted Purchase Receipt"
{
    AboutText = 'Extensión de prueba para copiar adjuntos de un registro a otro.';

    actions
    {
        addlast(Processing)
        {
            action(TestAttachments)
            {
                ApplicationArea = All;
                Caption = 'Probar Attachments';
                Image = TestFile;
                ToolTip = 'Ejecuta la prueba de RecordRef y Attachments.';

                trigger OnAction()
                var
                    PurchAttachmentCopy: Codeunit JK_PurchAttachmentsCopy;
                    RecRef: RecordRef;
                begin
                    // PurchAttachmentCopy.Test();
                    RecRef.GetTable(Rec);

                    Message(
                     'Tabla: %1\Record ID: %2',
                      RecRef.Number(),
                      RecRef.RecordId());
                end;
            }
        }
    }
}
