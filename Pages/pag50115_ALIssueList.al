page 50115 ALIssueList
{
    PageType = List;
    SourceTable = ALIssue;
    Caption = 'AL Issues';
    Editable = false;
    SourceTableView = order(descending);
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Number; rec.number) { }
                field(Title; rec.title) { }
                field(CreatedAt; rec.created_at) { }
                field(User; rec.user) { }
                field(State; rec.state) { }
                field(URL; rec.html_url) { ExtendedDatatype = URL; }
            }
        }
    }
    actions
    {
        area(processing)
        {
            action(RefreshALIssueList)
            {
                Caption = 'Refresh Issues';
                Promoted = true;
                PromotedCategory = Process;
                Image = RefreshLines;
                trigger OnAction();
                begin
                    Rec.RefreshIssues();
                    CurrPage.Update;
                    if Rec.FindFirst then;
                end;
            }
        }
    }
}