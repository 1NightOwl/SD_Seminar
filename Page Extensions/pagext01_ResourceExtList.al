pageextension 50101 "CSD ResourceListExt" extends "Resource List"
// CSD1.00 - 2018-01-01 - D. E. Veloper
{
    layout
    {
        modify(Type)
        {
            Visible = ShowType;
        }
        addafter("Type")
        {
            field("CSD Resource Type"; rec."CSD Resource Type")
            {
                ApplicationArea = All;
            }
            field("CSD Maximum Participants"; Rec."CSD Maximum Participants")
            {
                Visible = ShowMaxField;
                ApplicationArea = All;
            }
        }
    }


    trigger OnOpenPage()
    begin
        ShowType := (Rec.Getfilter(Rec.Type) = '');

        ShowMaxField := (Rec.GetFilter(Rec.Type)) = Format(Rec.Type::machine);
    end;


    var
        [InDataSet]

        ShowMaxField: Boolean;

        [InDataSet]

        Showtype: Boolean;

}