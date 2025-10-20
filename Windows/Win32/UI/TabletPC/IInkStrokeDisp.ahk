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
     * 
     * @param {Pointer<Int32>} ID 
     * @returns {HRESULT} 
     */
    get_ID(ID) {
        result := ComCall(7, this, "int*", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     */
    get_BezierPoints(Points) {
        result := ComCall(8, this, "ptr", Points, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} DrawAttrs 
     * @returns {HRESULT} 
     */
    get_DrawingAttributes(DrawAttrs) {
        result := ComCall(9, this, "ptr", DrawAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} DrawAttrs 
     * @returns {HRESULT} 
     */
    putref_DrawingAttributes(DrawAttrs) {
        result := ComCall(10, this, "ptr", DrawAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} Ink 
     * @returns {HRESULT} 
     */
    get_Ink(Ink) {
        result := ComCall(11, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkExtendedProperties>} Properties 
     * @returns {HRESULT} 
     */
    get_ExtendedProperties(Properties) {
        result := ComCall(12, this, "ptr", Properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Cusps 
     * @returns {HRESULT} 
     */
    get_PolylineCusps(Cusps) {
        result := ComCall(13, this, "ptr", Cusps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Cusps 
     * @returns {HRESULT} 
     */
    get_BezierCusps(Cusps) {
        result := ComCall(14, this, "ptr", Cusps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     */
    get_SelfIntersections(Intersections) {
        result := ComCall(15, this, "ptr", Intersections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_PacketCount(plCount) {
        result := ComCall(16, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSize 
     * @returns {HRESULT} 
     */
    get_PacketSize(plSize) {
        result := ComCall(17, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} PacketDescription 
     * @returns {HRESULT} 
     */
    get_PacketDescription(PacketDescription) {
        result := ComCall(18, this, "ptr", PacketDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Deleted 
     * @returns {HRESULT} 
     */
    get_Deleted(Deleted) {
        result := ComCall(19, this, "ptr", Deleted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    GetBoundingBox(BoundingBoxMode, Rectangle) {
        result := ComCall(20, this, "int", BoundingBoxMode, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     */
    FindIntersections(Strokes, Intersections) {
        result := ComCall(21, this, "ptr", Strokes, "ptr", Intersections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @param {Pointer<VARIANT>} Intersections 
     * @returns {HRESULT} 
     */
    GetRectangleIntersections(Rectangle, Intersections) {
        result := ComCall(22, this, "ptr", Rectangle, "ptr", Intersections, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    Clip(Rectangle) {
        result := ComCall(23, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Float} Radius 
     * @param {Pointer<VARIANT_BOOL>} Intersects 
     * @returns {HRESULT} 
     */
    HitTestCircle(X, Y, Radius, Intersects) {
        result := ComCall(24, this, "int", X, "int", Y, "float", Radius, "ptr", Intersects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Single>} Distance 
     * @param {Pointer<Single>} Point 
     * @returns {HRESULT} 
     */
    NearestPoint(X, Y, Distance, Point) {
        result := ComCall(25, this, "int", X, "int", Y, "float*", Distance, "float*", Point, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} SplitAt 
     * @param {Pointer<IInkStrokeDisp>} NewStroke 
     * @returns {HRESULT} 
     */
    Split(SplitAt, NewStroke) {
        result := ComCall(26, this, "float", SplitAt, "ptr", NewStroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Pointer<Int32>} Minimum 
     * @param {Pointer<Int32>} Maximum 
     * @param {Pointer<Int32>} Units 
     * @param {Pointer<Single>} Resolution 
     * @returns {HRESULT} 
     */
    GetPacketDescriptionPropertyMetrics(PropertyName, Minimum, Maximum, Units, Resolution) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(27, this, "ptr", PropertyName, "int*", Minimum, "int*", Maximum, "int*", Units, "float*", Resolution, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     */
    GetPoints(Index, Count, Points) {
        result := ComCall(28, this, "int", Index, "int", Count, "ptr", Points, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<Int32>} NumberOfPointsSet 
     * @returns {HRESULT} 
     */
    SetPoints(Points, Index, Count, NumberOfPointsSet) {
        result := ComCall(29, this, "ptr", Points, "int", Index, "int", Count, "int*", NumberOfPointsSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} PacketData 
     * @returns {HRESULT} 
     */
    GetPacketData(Index, Count, PacketData) {
        result := ComCall(30, this, "int", Index, "int", Count, "ptr", PacketData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<VARIANT>} PacketValues 
     * @returns {HRESULT} 
     */
    GetPacketValuesByProperty(PropertyName, Index, Count, PacketValues) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(31, this, "ptr", PropertyName, "int", Index, "int", Count, "ptr", PacketValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {VARIANT} PacketValues 
     * @param {Integer} Index 
     * @param {Integer} Count 
     * @param {Pointer<Int32>} NumberOfPacketsSet 
     * @returns {HRESULT} 
     */
    SetPacketValuesByProperty(bstrPropertyName, PacketValues, Index, Count, NumberOfPacketsSet) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", PacketValues, "int", Index, "int", Count, "int*", NumberOfPacketsSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FittingError 
     * @param {Pointer<VARIANT>} FlattenedBezierPoints 
     * @returns {HRESULT} 
     */
    GetFlattenedBezierPoints(FittingError, FlattenedBezierPoints) {
        result := ComCall(33, this, "int", FittingError, "ptr", FlattenedBezierPoints, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTransform>} Transform 
     * @param {VARIANT_BOOL} ApplyOnPenWidth 
     * @returns {HRESULT} 
     */
    Transform(Transform, ApplyOnPenWidth) {
        result := ComCall(34, this, "ptr", Transform, "short", ApplyOnPenWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    ScaleToRectangle(Rectangle) {
        result := ComCall(35, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(36, this, "float", HorizontalComponent, "float", VerticalComponent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    Rotate(Degrees, x, y) {
        result := ComCall(37, this, "float", Degrees, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     */
    Shear(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(38, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(39, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
