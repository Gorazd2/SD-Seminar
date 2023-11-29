page 50105 "DIR WS Customer API"
{
    PageType = API;
    Caption = 'WS Customer API';
    APIPublisher = 'DirectionsEMEA';
    APIGroup = 'APIs';
    APIVersion = 'v1.0';
    EntityName = 'entityName';
    EntitySetName = 'entitySetName';
    SourceTable = Customer;
    DelayedInsert = true;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No_"; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = All;

                }
                field("DateFilter"; Rec."Date Filter")
                {
                    ApplicationArea = All;

                }
                field("SalesLCY"; Rec."Sales (LCY)")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}