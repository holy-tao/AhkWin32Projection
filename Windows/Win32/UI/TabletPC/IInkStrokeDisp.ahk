#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<Integer>} ID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_id
     */
    get_ID(ID) {
        result := ComCall(7, this, "int*", ID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_bezierpoints
     */
    get_BezierPoints(Points) {
        result := ComCall(8, this, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} DrawAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_drawingattributes
     */
    get_DrawingAttributes(DrawAttrs) {
        result := ComCall(9, this, "ptr*", DrawAttrs, "HRESULT")
        return result
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
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_ink
     */
    get_Ink(Ink) {
        result := ComCall(11, this, "ptr*", Ink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkExtendedProperties>} Properties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_extendedproperties
     */
    get_ExtendedProperties(Properties) {
        result := ComCall(12, this, "ptr*", Properties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Cusps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_polylinecusps
     */
    get_PolylineCusps(Cusps) {
        result := ComCall(13, this, "ptr", Cusps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Cusps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_beziercusps
     */
    get_BezierCusps(Cusps) {
        result := ComCall(14, this, "ptr", Cusps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_selfintersections
     */
    get_SelfIntersections(Intersections) {
        result := ComCall(15, this, "ptr", Intersections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetcount
     */
    get_PacketCount(plCount) {
        result := ComCall(16, this, "int*", plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetsize
     */
    get_PacketSize(plSize) {
        result := ComCall(17, this, "int*", plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PacketDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_packetdescription
     */
    get_PacketDescription(PacketDescription) {
        result := ComCall(18, this, "ptr", PacketDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Deleted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-get_deleted
     */
    get_Deleted(Deleted) {
        result := ComCall(19, this, "ptr", Deleted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode, Rectangle) {
        result := ComCall(20, this, "int", BoundingBoxMode, "ptr*", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-findintersections
     */
    FindIntersections(Strokes, Intersections) {
        result := ComCall(21, this, "ptr", Strokes, "ptr", Intersections, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getrectangleintersections
     */
    GetRectangleIntersections(Rectangle, Intersections) {
        result := ComCall(22, this, "ptr", Rectangle, "ptr", Intersections, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} Intersects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-hittestcircle
     */
    HitTestCircle(X, Y, Radius, Intersects) {
        result := ComCall(24, this, "int", X, "int", Y, "float", Radius, "ptr", Intersects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Float>} Distance 
     * @param {Pointer<Float>} Point 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-nearestpoint
     */
    NearestPoint(X, Y, Distance, Point) {
        result := ComCall(25, this, "int", X, "int", Y, "float*", Distance, "float*", Point, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} SplitAt 
     * @param {Pointer<IInkStrokeDisp>} NewStroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-split
     */
    Split(SplitAt, NewStroke) {
        result := ComCall(26, this, "float", SplitAt, "ptr*", NewStroke, "HRESULT")
        return result
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

        result := ComCall(27, this, "ptr", PropertyName, "int*", Minimum, "int*", Maximum, "int*", Units, "float*", Resolution, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpoints
     */
    GetPoints(Index, Count, Points) {
        result := ComCall(28, this, "int", Index, "int", Count, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} NumberOfPointsSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-setpoints
     */
    SetPoints(Points, Index, Count, NumberOfPointsSet) {
        result := ComCall(29, this, "ptr", Points, "int", Index, "int", Count, "int*", NumberOfPointsSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} PacketData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketdata
     */
    GetPacketData(Index, Count, PacketData) {
        result := ComCall(30, this, "int", Index, "int", Count, "ptr", PacketData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} PacketValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getpacketvaluesbyproperty
     */
    GetPacketValuesByProperty(PropertyName, Index, Count, PacketValues) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(31, this, "ptr", PropertyName, "int", Index, "int", Count, "ptr", PacketValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {VARIANT} PacketValues 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} NumberOfPacketsSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-setpacketvaluesbyproperty
     */
    SetPacketValuesByProperty(bstrPropertyName, PacketValues, Index, Count, NumberOfPacketsSet) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", PacketValues, "int", Index, "int", Count, "int*", NumberOfPacketsSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FittingError 
     * @param {Pointer<VARIANT>} FlattenedBezierPoints 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokedisp-getflattenedbezierpoints
     */
    GetFlattenedBezierPoints(FittingError, FlattenedBezierPoints) {
        result := ComCall(33, this, "int", FittingError, "ptr", FlattenedBezierPoints, "HRESULT")
        return result
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
