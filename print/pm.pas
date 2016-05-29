unit pm;

interface
uses classes;
type
  NCell = class(TCollectionItem)
  private
    FName: string;
  public
  published
    property id : string read FName write FName;
  end;
  NCellList = class(TCollection)
  private
    FName: string;
  public
  published
    property id : string read FName write FName;
  end;
  NLine = class(TCollectionItem)
  private
    FName: string;
    FCellList: NCellList;
  public
    constructor Create(Collection: TCollection);override;
  published
    property id : string read FName write FName;
    property CellList:NCellList read FCellList write FCellList;
  end;
  NLineList = class(TCollection)
  private
    FName: string;
  public
  published
    property id : string read FName write FName;
  end;

  NPage = class(TPersistent)
  private
    FName: string;
    FLineList: NLineList;

  public
    constructor Create;

  published
    property id : string read FName write FName;
    property LineList: NLineList read FLineList write FLineList;
  end;


implementation

{ NPage }


constructor NPage.Create;
begin
 inherited;
 FLineList := NLineList.Create(NLine);
end;


{ NLine }

constructor NLine.Create(Collection: TCollection);
begin
  inherited;
  FCellList := NCellList.Create(NCell);
end;

initialization
  RegisterClass(NLine);
  RegisterClass(NCell);
end.