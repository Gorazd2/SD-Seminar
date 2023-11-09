pageextension 50101 "CSD ResourceListExt" extends "Resource List"
// CSD1.00 - 2018-01-01 - D. E. Veloper
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }

        addafter(Type)
        {
            field("CSD Resource Type"; Rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Maximum Participants";
            rec."CSD Resource Type")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }

        }


    }
    trigger OnOpenPage();
    begin
        Showtype := (Rec.GetFilter(Type) = '');
        ShowMaxField := (Rec.GetFilter(Type) = format(rec.Type::machine));
    end;


    var

        ShowMaxField: Boolean;
        Showtype: Boolean;
}
