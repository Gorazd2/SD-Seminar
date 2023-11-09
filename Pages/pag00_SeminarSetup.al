page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; Rec."Seminar Nos.")
                {
                    ApplicationArea = All;

                }
                field("Seminar Registration Nos."; Rec."Seminar Registration Nos.")
                {
                    ApplicationArea = All;

                }
                field("Posted Seminar Reg. Nos."; Rec."Posted Seminar Reg. Nos.")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
    trigger OnOpenPage();
    begin
        if not Rec.Get() then begin
            Rec.Init;
            Rec.Insert;
        end;
    end;
}