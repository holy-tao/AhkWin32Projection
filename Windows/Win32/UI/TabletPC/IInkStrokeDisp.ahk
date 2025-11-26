#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IInkDrawingAttributes.ahk
#Include .\IInkDisp.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkRectangle.ahk
#Include .\IInkStrokeDisp.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Represents a single ink stroke.A stroke is a set of properties and point data that the digitizer captures that represent the coordinates and properties of a known ink mark.
 * @remarks
 * 
 * If you define a class that implements this interface, the new class will not interact correctly with the Tablet PC application programming interfaces (APIs).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkstrokedisp
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkStrokeDisp extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokeDisp
     * @type {Guid}
     */
    static IID => Guid("{43242fea-91d1-4a72-963e-fbb91829cfa2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ID", "get_BezierPoints", "get_DrawingAttributes", "putref_DrawingAttributes", "get_Ink", "get_ExtendedProperties", "get_PolylineCusps", "get_BezierCusps", "get_SelfIntersections", "get_PacketCount", "get_PacketSize", "get_PacketDescription", "get_Deleted", "GetBoundingBox", "FindIntersections", "GetRectangleIntersections", "Clip", "HitTestCircle", "NearestPoint", "Split", "GetPacketDescriptionPropertyMetrics", "GetPoints", "SetPoints", "GetPacketData", "GetPacketValuesByProperty", "SetPacketValuesByProperty", "GetFlattenedBezierPoints", "Transform", "ScaleToRectangle", "Move", "Rotate", "Shear", "ScaleTransform"]

    /**
     * @type {Integer} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {VARIANT} 
     */
    BezierPoints {
        get => this.get_BezierPoints()
    }

    /**
     * @type {IInkDrawingAttributes} 
     */
    DrawingAttributes {
        get => this.get_DrawingAttributes()
    }

    /**
     * @type {IInkDisp} 
     */
    Ink {
        get => this.get_Ink()
    }

    /**
     * @type {IInkExtendedProperties} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {VARIANT} 
     */
    PolylineCusps {
        get => this.get_PolylineCusps()
    }

    /**
     * @type {VARIANT} 
     */
    BezierCusps {
        get => this.get_BezierCusps()
    }

    /**
     * @type {VARIANT} 
     */
    SelfIntersections {
        get => this.get_SelfIntersections()
    }

    /**
     * @type {Integer} 
     */
    PacketCount {
        get => this.get_PacketCount()
    }

    /**
     * @type {Integer} 
     */
    PacketSize {
        get => this.get_PacketSize()
    }

    /**
     * @type {VARIANT} 
     */
    PacketDescription {
        get => this.get_PacketDescription()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Deleted {
        get => this.get_Deleted()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_id
     */
    get_ID() {
        result := ComCall(7, this, "int*", &ID := 0, "HRESULT")
        return ID
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_bezierpoints
     */
    get_BezierPoints() {
        Points := VARIANT()
        result := ComCall(8, this, "ptr", Points, "HRESULT")
        return Points
    }

    /**
     * 
     * @returns {IInkDrawingAttributes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_drawingattributes
     */
    get_DrawingAttributes() {
        result := ComCall(9, this, "ptr*", &DrawAttrs := 0, "HRESULT")
        return IInkDrawingAttributes(DrawAttrs)
    }

    /**
     * 
     * @param {IInkDrawingAttributes} DrawAttrs 
     * @returns {HRESULT} 
     */
    putref_DrawingAttributes(DrawAttrs) {
        result := ComCall(10, this, "ptr", DrawAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_ink
     */
    get_Ink() {
        result := ComCall(11, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(12, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_polylinecusps
     */
    get_PolylineCusps() {
        Cusps := VARIANT()
        result := ComCall(13, this, "ptr", Cusps, "HRESULT")
        return Cusps
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_beziercusps
     */
    get_BezierCusps() {
        Cusps := VARIANT()
        result := ComCall(14, this, "ptr", Cusps, "HRESULT")
        return Cusps
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_selfintersections
     */
    get_SelfIntersections() {
        Intersections := VARIANT()
        result := ComCall(15, this, "ptr", Intersections, "HRESULT")
        return Intersections
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetcount
     */
    get_PacketCount() {
        result := ComCall(16, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetsize
     */
    get_PacketSize() {
        result := ComCall(17, this, "int*", &plSize := 0, "HRESULT")
        return plSize
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetdescription
     */
    get_PacketDescription() {
        PacketDescription := VARIANT()
        result := ComCall(18, this, "ptr", PacketDescription, "HRESULT")
        return PacketDescription
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_deleted
     */
    get_Deleted() {
        result := ComCall(19, this, "short*", &Deleted := 0, "HRESULT")
        return Deleted
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(20, this, "int", BoundingBoxMode, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-findintersections
     */
    FindIntersections(Strokes) {
        Intersections := VARIANT()
        result := ComCall(21, this, "ptr", Strokes, "ptr", Intersections, "HRESULT")
        return Intersections
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getrectangleintersections
     */
    GetRectangleIntersections(Rectangle) {
        Intersections := VARIANT()
        result := ComCall(22, this, "ptr", Rectangle, "ptr", Intersections, "HRESULT")
        return Intersections
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-clip
     */
    Clip(Rectangle) {
        result := ComCall(23, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Float} Radius 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-hittestcircle
     */
    HitTestCircle(X, Y, Radius) {
        result := ComCall(24, this, "int", X, "int", Y, "float", Radius, "short*", &Intersects := 0, "HRESULT")
        return Intersects
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Float>} Distance 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-nearestpoint
     */
    NearestPoint(X, Y, Distance) {
        DistanceMarshal := Distance is VarRef ? "float*" : "ptr"

        result := ComCall(25, this, "int", X, "int", Y, DistanceMarshal, Distance, "float*", &Point := 0, "HRESULT")
        return Point
    }

    /**
     * 
     * @param {Float} SplitAt 
     * @returns {IInkStrokeDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-split
     */
    Split(SplitAt) {
        result := ComCall(26, this, "float", SplitAt, "ptr*", &NewStroke := 0, "HRESULT")
        return IInkStrokeDisp(NewStroke)
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Pointer<Integer>} Minimum 
     * @param {Pointer<Integer>} Maximum 
     * @param {Pointer<Integer>} Units 
     * @param {Pointer<Float>} Resolution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdescriptionpropertymetrics
     */
    GetPacketDescriptionPropertyMetrics(PropertyName, Minimum, Maximum, Units, Resolution) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        MinimumMarshal := Minimum is VarRef ? "int*" : "ptr"
        MaximumMarshal := Maximum is VarRef ? "int*" : "ptr"
        UnitsMarshal := Units is VarRef ? "int*" : "ptr"
        ResolutionMarshal := Resolution is VarRef ? "float*" : "ptr"

        result := ComCall(27, this, "ptr", PropertyName, MinimumMarshal, Minimum, MaximumMarshal, Maximum, UnitsMarshal, Units, ResolutionMarshal, Resolution, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpoints
     */
    GetPoints(Index, Count) {
        Points := VARIANT()
        result := ComCall(28, this, "int", Index, "int", Count, "ptr", Points, "HRESULT")
        return Points
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-setpoints
     */
    SetPoints(Points, Index, Count) {
        result := ComCall(29, this, "ptr", Points, "int", Index, "int", Count, "int*", &NumberOfPointsSet := 0, "HRESULT")
        return NumberOfPointsSet
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdata
     */
    GetPacketData(Index, Count) {
        PacketData := VARIANT()
        result := ComCall(30, this, "int", Index, "int", Count, "ptr", PacketData, "HRESULT")
        return PacketData
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketvaluesbyproperty
     */
    GetPacketValuesByProperty(PropertyName, Index, Count) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        PacketValues := VARIANT()
        result := ComCall(31, this, "ptr", PropertyName, "int", Index, "int", Count, "ptr", PacketValues, "HRESULT")
        return PacketValues
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {VARIANT} PacketValues 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-setpacketvaluesbyproperty
     */
    SetPacketValuesByProperty(bstrPropertyName, PacketValues, Index, Count) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", PacketValues, "int", Index, "int", Count, "int*", &NumberOfPacketsSet := 0, "HRESULT")
        return NumberOfPacketsSet
    }

    /**
     * 
     * @param {Integer} FittingError 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getflattenedbezierpoints
     */
    GetFlattenedBezierPoints(FittingError) {
        FlattenedBezierPoints := VARIANT()
        result := ComCall(33, this, "int", FittingError, "ptr", FlattenedBezierPoints, "HRESULT")
        return FlattenedBezierPoints
    }

    /**
     * 
     * @param {IInkTransform} Transform 
     * @param {VARIANT_BOOL} ApplyOnPenWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-transform
     */
    Transform(Transform, ApplyOnPenWidth) {
        result := ComCall(34, this, "ptr", Transform, "short", ApplyOnPenWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-scaletorectangle
     */
    ScaleToRectangle(Rectangle) {
        result := ComCall(35, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(36, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(37, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-shear
     */
    Shear(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(38, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(39, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }
}
