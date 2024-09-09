unit GeometryPhantomization;

interface

uses
  CERS.GeometryCalc, Types3D, Math, CERS.RoomEquipmentGeometry, superobject,
  System.Generics.Collections, System.Generics.Defaults, DDLogs, System.SysUtils,
  System.Variants;

type
  TProc_param = procedure(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>) of object;

  TPhantomizationFuncSet = class
  published
    procedure _del_cones_by_radius(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_by_relate_radius(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_by_height(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_by_relate_height(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_by_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_by_relate_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_cones_one_in_other(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_boxes_by_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_boxes_by_edge_size(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_boxes_by_relate_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure _del_boxes_one_in_other(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
    procedure InitGetLinkedPhantomsThread(aHandle: HWND; aOnTerminateHandler: TNotifyEvent; aMessage: Cardinal);
  public
    procedure CallProc(aMethodName: string; var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>); overload;
    function PrepareParams(aMethodName: string; aParams: ISuperObject; var l: TList<Variant>): Boolean;
    [MessageBus(mbpLoadModelWkspace)] procedure nsExportToPolynom10(Sender: TObject; const fileName: TNsP3dbExportToPolynomNotify);
  end;

var
  pfs: TPhantomizationFuncSet;
  ElementsGeometryJSON: ISuperObject;

implementation

function ToVector3DFromDigits(const a, b, c: Float): TVector3D;
begin
  result[0] := a;
  result[1] := b;
  result[2] := c;
end;

{$REGION 'Import from python'}
procedure del_cones_by_radius(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_r: Double = 50);
begin
  // код из Python
end;

procedure del_cones_by_relate_radius(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_r_percent: Double = 50);
begin
  // код из Python
end;

procedure del_cones_by_height(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_h: Double = 50);
begin
  // код из Python
end;

procedure del_cones_by_relate_height(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_h_percent: Double = 50);
begin
  // код из Python
end;

procedure del_cones_by_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_v: Double = 0.0001);
begin
  // код из Python
end;

procedure del_cones_by_relate_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_v_percent: Double = 10);
begin
  // код из Python
end;

function is_point_in_cone(point, cone_start, cone_end: TVector3D; start_radius, end_radius: Double): Boolean;
begin
  // код из Python
end;

procedure del_cones_one_in_other(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; noSendParam: Double = 0);
begin
  // код из Python
end;

procedure del_boxes_by_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_v: Double = 0.0001);
begin
  // код из Python
end;

procedure del_boxes_by_edge_size(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_size: Double = 50);
begin
  // код из Python
end;

procedure del_boxes_by_relate_volume(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr; min_v_percent: Double = 5);
begin
  // код из Python
end;

function is_point_over_vector_with_delta(point, v_start, v_end: TVector3D; delta: Float = 0): Boolean;
begin
  // код из Python
end;

function is_point_in_parallelepiped3d(point, point_0, point_x, point_y, point_z: TVector3D; delta: Float = 0): Boolean;
begin
  // код из Python
end;

procedure del_boxes_one_in_other(var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr);
begin
  // код из Python
end;
{$ENDREGION}

{$REGION 'TPhantomizationFuncSet'}

procedure TPhantomizationFuncSet.CallProc(aMethodName: string;
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  m: TMethod;
begin
  m.Code := Self.MethodAddress('_' + aMethodName);
  if m.Code <> nil then
    begin
      m.Data := Pointer(Self);
      TProc_param(m)(c, b, t, p);
    end;
end;

function TPhantomizationFuncSet.PrepareParams(aMethodName: string; aParams: ISuperObject; var l: TList<Variant>): Boolean;
var
  p: ISuperObject;
  pName: string;
  v: Variant;
  procedure AddParamToListFromJSON(aParamName: string; aParamType: TSuperType);
  begin
    try
      if aParamType = stString then
        v := aParams.S[aParamName]
      else
        v := aParams.D[aParamName];
      l.Add(v);
    except
      on e: Exception do
        begin
          DDLogs.Log.Error('TPhantomizationFuncSet.PrepareParams', 'method: ' + aMethodName + ', parameter: ' + aParamName + ', error: ' + e.Message);
          Result := False;
        end;
    end;
  end;
begin
  Result := True;
  if (aMethodName = '') or (aParams = nil) or (l = nil) then
    Exit(False);

  if aParams.AsObject.count = 0 then
    l.Clear;

  if aMethodName = 'del_cones_by_radius' then
    begin
      pName := 'min_r';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_by_height' then
    begin
      pName := 'min_h';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_by_volume' then
    begin
      pName := 'min_v';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_by_relate_radius' then
    begin
      pName := 'min_r_percent';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_by_relate_height' then
    begin
      pName := 'min_h_percent';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_by_relate_volume' then
    begin
      pName := 'min_v_percent';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_cones_one_in_other' then
    begin
      // метод без дополнительных параметров
    end
  else if aMethodName = 'corrects_coaxial_cones' then
    begin

    end
  else if aMethodName = 'merge_coaxial_cones' then
    begin

    end
  else if aMethodName = 'corrects_90degrees_cones' then
    begin

    end
  else if aMethodName = 'divide_cones' then
    begin

    end
  else if aMethodName = 'del_boxes_by_edge_size' then
    begin
      pName := 'min_size';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_boxes_by_volume' then
    begin
      pName := 'min_v';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_boxes_by_relate_volume' then
    begin
      pName := 'min_v_percent';
      if aParams.AsObject.Find(pName, p) then
        AddParamToListFromJSON(pName, stDouble)
      else
        l.Add(Null);
    end
  else if aMethodName = 'del_boxes_one_in_other' then
    begin
      // метод без дополнительных параметров
    end
  else if aMethodName = 'merge_boxes' then
    begin

    end
  else if aMethodName = 'corrects_boxes' then
    begin

    end
  else if aMethodName = 'create_bounding_box' then
    begin

    end
  else if aMethodName = 'merge_coaxial_boxes_in_cones' then
    begin

    end;
end;

procedure TPhantomizationFuncSet._del_boxes_by_edge_size(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  min_size: Double;
begin
  if p[0] = Null then
    del_boxes_by_edge_size(c, b, t)
  else
    begin
      min_size := p[0];
      del_boxes_by_edge_size(c, b, t, min_size);
    end;
end;

procedure TPhantomizationFuncSet._del_boxes_by_relate_volume(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  min_v_percent: Double;
begin
  if p[0] = Null then
    del_boxes_by_relate_volume(c, b, t)
  else
    begin
      min_v_percent := p[0];
      del_boxes_by_relate_volume(c, b, t, min_v_percent);
    end;
end;

procedure TPhantomizationFuncSet._del_boxes_by_volume(var c: TConeGeometryAr;
  var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
var
  min_v: Double;
begin
  if p[0] = Null then
    del_boxes_by_volume(c, b, t)
  else
    begin
      min_v := p[0];
      del_boxes_by_volume(c, b, t, min_v);
    end;
end;

procedure TPhantomizationFuncSet._del_boxes_one_in_other(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
begin
  del_boxes_by_volume(c, b, t);
end;

procedure TPhantomizationFuncSet._del_cones_by_height(var c: TConeGeometryAr;
  var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
var
  min_h: Double;
begin
  if p[0] = Null then
    del_cones_by_height(c, b, t)
  else
    begin
      min_h := p[0];
      del_cones_by_height(c, b, t, min_h);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_by_radius(var c: TConeGeometryAr;
  var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
var
  min_r: Double;
begin
  if p[0] = Null then
    del_cones_by_radius(c, b, t)
  else
    begin
      min_r := p[0];
      del_cones_by_radius(c, b, t, min_r);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_by_relate_height(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  min_h_percent: Double;
begin
  if p[0] = Null then
    del_cones_by_relate_height(c, b, t)
  else
    begin
      min_h_percent := p[0];
      del_cones_by_relate_height(c, b, t, min_h_percent);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_by_relate_radius(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  min_r_percent: Double;
begin
  if p[0] = Null then
    del_cones_by_relate_radius(c, b, t)
  else
    begin
      min_r_percent := p[0];
      del_cones_by_relate_radius(c, b, t, min_r_percent);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_by_relate_volume(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
var
  min_v_percent: Double;
begin
  if p[0] = Null then
    del_cones_by_relate_volume(c, b, t)
  else
    begin
      min_v_percent := p[0];
      del_cones_by_relate_volume(c, b, t, min_v_percent);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_by_volume(var c: TConeGeometryAr;
  var b: TBoxGeometryAr; var t: TTorGeometryAr; p: TList<Variant>);
var
  min_v: Double;
begin
  if p[0] = Null then
    del_cones_by_volume(c, b, t)
  else
    begin
      min_v := p[0];
      del_cones_by_volume(c, b, t, min_v);
    end;
end;

procedure TPhantomizationFuncSet._del_cones_one_in_other(
  var c: TConeGeometryAr; var b: TBoxGeometryAr; var t: TTorGeometryAr;
  p: TList<Variant>);
begin
  del_cones_one_in_other(c, b, t);
end;

procedure TPhantomizationFuncSet.nsExportToPolynom10(Sender: TObject; const fileName: TNsP3dbExportToPolynomNotify);
begin
  DDLogs.Log.TraceMethod('TPhantomizationFuncSet.nsExportToPolynom10');
  InitGetLinkedPhantomsThread(Self.Handle, ThreadOnTerminateHandler, UM_LOADLINKEDPHANTOMS);
  FLoadingLinkedPhantomsFinished := False;
  PanelProgressBar.Visible := True;
end;

procedure TPhantomizationFuncSet.InitGetLinkedPhantomsThread(aHandle: HWND; aOnTerminateHandler: TNotifyEvent; aMessage: Cardinal);
begin
  DDLogs.Log.TraceMethod('TPhantomizationFuncSet.InitGetLinkedPhantomsThread');
  FGetLinkedPhantomsThread := TGetLinkedPhantomsThread.Create;
  FGetLinkedPhantomsThread.OnTerminate := aOnTerminateHandler;
  FGetLinkedPhantomsThread.FreeOnTerminate := False;
  FGetLinkedPhantomsThread.FHandle := aHandle;
  FGetLinkedPhantomsThread.FMessage := aMessage;
end;

procedure TPhantomizationFuncSet.ThreadOnTerminateHandler(Sender: TObject);
begin
  DDLogs.Log.TraceMethod('TPhantomizationFuncSet.ThreadOnTerminateHandler');
  FLoadingLinkedPhantomsFinished := True;
  PanelAllForm.Enabled := FLoadingLinkedPhantomsFinished;
  PanelProgressBar.Visible := False;
end;
{$ENDREGION}

initialization
  pfs := TPhantomizationFuncSet.Create;

finalization
  pfs.Free;

end.