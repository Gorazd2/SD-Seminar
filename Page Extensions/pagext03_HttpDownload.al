pageextension 50140 ItemCardExt extends "Item Card"
{
    actions
    {
        addLast(Functions)
        {
            action(DownloadPicture)
            {
                Caption = 'Download Picture';
                Image = Picture;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Client: HttpClient;
                    instr: InStream;
                    response: HttpResponseMessage;
                    Url: Label 'https://ba-consult.dk/downloads/bicycle.jpg';
                //DownloadMgt: Codeunit HttpDownloadMgt;
                //TempBlob: Record TempBlob temporary;
                //InStr: InStream;
                begin
                    Client.Get(Url, response);
                    response.content.ReadAs(InStr);
                    rec.Picture.ImportStream(InStr, 'Default image');
                    CurrPage.Update(true);
                end;
            }
        }
    }
}