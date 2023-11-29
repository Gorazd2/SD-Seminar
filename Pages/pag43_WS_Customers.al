page 50143 "WS Customers"
{
    PageType = List;
    SourceTable = Customer;
    
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