page 50144 "Api Customer"
{
    PageType = API;
    Caption = 'apiPageNameCustomers';
    APIPublisher = 'publisherName';
    APIGroup = 'groupName';
    EntityName = 'customer';
    EntitySetName = 'customers';
    SourceTable = Customer;
    DelayedInsert = true;


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No_"; Rec."No.")
                {
                    ApplicationArea = All;

                }
                field("Name"; Rec."NAme")
                {
                    ApplicationArea = All;

                }
                field("City"; Rec."City")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}