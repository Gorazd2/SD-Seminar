page 50106 "DIR WS Customer OData"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    Caption = 'WS Customer OData';
    InsertAllowed = false;
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;

                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = All;

                }
                field("Sales (LCY)"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}