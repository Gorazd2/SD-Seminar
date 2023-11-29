table 50115 ALIssue
{
    fields
    {
        field(1; id; Integer)
        {
            Caption = 'ID';
        }
        field(2; number; Integer) { Caption = 'Number'; }
        field(3; title; Text[250]) { Caption = 'Title'; }
        field(5; created_at; DateTime) { Caption = 'Created at'; }
        field(6; user; text[50]) { Caption = 'User'; }
        field(7; state; text[30]) { Caption = 'State'; }
        field(8; html_url; text[250]) { Caption = 'URL'; }
    }
    keys
    {
        key(PK; id) { Clustered = true; }
    }

    procedure RefreshIssues()
    var
        RefreshALIssues: Codeunit RefreshALIssueCode;
    begin
        RefreshALIssues.Refresh();
    end;
}