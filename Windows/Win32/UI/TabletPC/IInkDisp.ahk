#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkdisp
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkDisp extends IDispatch{
    /**
     * The interface identifier for IInkDisp
     * @type {Guid}
     */
    static IID => Guid("{9d398fa0-c4e2-4fcd-9973-975caaf47ea6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    get_Strokes(Strokes) {
        result := ComCall(7, this, "ptr", Strokes, "int")
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
        result := ComCall(8, this, "ptr", Properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Dirty 
     * @returns {HRESULT} 
     */
    get_Dirty(Dirty) {
        result := ComCall(9, this, "ptr", Dirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Dirty 
     * @returns {HRESULT} 
     */
    put_Dirty(Dirty) {
        result := ComCall(10, this, "short", Dirty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkCustomStrokes>} ppunkInkCustomStrokes 
     * @returns {HRESULT} 
     */
    get_CustomStrokes(ppunkInkCustomStrokes) {
        result := ComCall(11, this, "ptr", ppunkInkCustomStrokes, "int")
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
        result := ComCall(12, this, "int", BoundingBoxMode, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    DeleteStrokes(Strokes) {
        result := ComCall(13, this, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     */
    DeleteStroke(Stroke) {
        result := ComCall(14, this, "ptr", Stroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @param {Integer} ExtractFlags 
     * @param {Pointer<IInkDisp>} ExtractedInk 
     * @returns {HRESULT} 
     */
    ExtractStrokes(Strokes, ExtractFlags, ExtractedInk) {
        result := ComCall(15, this, "ptr", Strokes, "int", ExtractFlags, "ptr", ExtractedInk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @param {Integer} extractFlags 
     * @param {Pointer<IInkDisp>} ExtractedInk 
     * @returns {HRESULT} 
     */
    ExtractWithRectangle(Rectangle, extractFlags, ExtractedInk) {
        result := ComCall(16, this, "ptr", Rectangle, "int", extractFlags, "ptr", ExtractedInk, "int")
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
        result := ComCall(17, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} NewInk 
     * @returns {HRESULT} 
     */
    Clone(NewInk) {
        result := ComCall(18, this, "ptr", NewInk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Float} radius 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    HitTestCircle(X, Y, radius, Strokes) {
        result := ComCall(19, this, "int", X, "int", Y, "float", radius, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} SelectionRectangle 
     * @param {Float} IntersectPercent 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    HitTestWithRectangle(SelectionRectangle, IntersectPercent, Strokes) {
        result := ComCall(20, this, "ptr", SelectionRectangle, "float", IntersectPercent, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Float} IntersectPercent 
     * @param {Pointer<VARIANT>} LassoPoints 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    HitTestWithLasso(Points, IntersectPercent, LassoPoints, Strokes) {
        result := ComCall(21, this, "ptr", Points, "float", IntersectPercent, "ptr", LassoPoints, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Single>} PointOnStroke 
     * @param {Pointer<Single>} DistanceFromPacket 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     */
    NearestPoint(X, Y, PointOnStroke, DistanceFromPacket, Stroke) {
        result := ComCall(22, this, "int", X, "int", Y, "float*", PointOnStroke, "float*", DistanceFromPacket, "ptr", Stroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} StrokeIds 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    CreateStrokes(StrokeIds, Strokes) {
        result := ComCall(23, this, "ptr", StrokeIds, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} SourceStrokes 
     * @param {Pointer<IInkRectangle>} TargetRectangle 
     * @returns {HRESULT} 
     */
    AddStrokesAtRectangle(SourceStrokes, TargetRectangle) {
        result := ComCall(24, this, "ptr", SourceStrokes, "ptr", TargetRectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PersistenceFormat 
     * @param {Integer} CompressionMode 
     * @param {Pointer<VARIANT>} Data 
     * @returns {HRESULT} 
     */
    Save(PersistenceFormat, CompressionMode, Data) {
        result := ComCall(25, this, "int", PersistenceFormat, "int", CompressionMode, "ptr", Data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     */
    Load(Data) {
        result := ComCall(26, this, "ptr", Data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} PacketData 
     * @param {VARIANT} PacketDescription 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     */
    CreateStroke(PacketData, PacketDescription, Stroke) {
        result := ComCall(27, this, "ptr", PacketData, "ptr", PacketDescription, "ptr", Stroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @param {Pointer<IDataObject>} DataObject 
     * @returns {HRESULT} 
     */
    ClipboardCopyWithRectangle(Rectangle, ClipboardFormats, ClipboardModes, DataObject) {
        result := ComCall(28, this, "ptr", Rectangle, "int", ClipboardFormats, "int", ClipboardModes, "ptr", DataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} strokes 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @param {Pointer<IDataObject>} DataObject 
     * @returns {HRESULT} 
     */
    ClipboardCopy(strokes, ClipboardFormats, ClipboardModes, DataObject) {
        result := ComCall(29, this, "ptr", strokes, "int", ClipboardFormats, "int", ClipboardModes, "ptr", DataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDataObject>} DataObject 
     * @param {Pointer<VARIANT_BOOL>} CanPaste 
     * @returns {HRESULT} 
     */
    CanPaste(DataObject, CanPaste) {
        result := ComCall(30, this, "ptr", DataObject, "ptr", CanPaste, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Pointer<IDataObject>} DataObject 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    ClipboardPaste(x, y, DataObject, Strokes) {
        result := ComCall(31, this, "int", x, "int", y, "ptr", DataObject, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
