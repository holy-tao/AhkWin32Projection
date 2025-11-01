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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Strokes", "get_ExtendedProperties", "get_Dirty", "put_Dirty", "get_CustomStrokes", "GetBoundingBox", "DeleteStrokes", "DeleteStroke", "ExtractStrokes", "ExtractWithRectangle", "Clip", "Clone", "HitTestCircle", "HitTestWithRectangle", "HitTestWithLasso", "NearestPoint", "CreateStrokes", "AddStrokesAtRectangle", "Save", "Load", "CreateStroke", "ClipboardCopyWithRectangle", "ClipboardCopy", "CanPaste", "ClipboardPaste"]

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_strokes
     */
    get_Strokes(Strokes) {
        result := ComCall(7, this, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkExtendedProperties>} Properties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_extendedproperties
     */
    get_ExtendedProperties(Properties) {
        result := ComCall(8, this, "ptr*", Properties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} Dirty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_dirty
     */
    get_Dirty(Dirty) {
        result := ComCall(9, this, "ptr", Dirty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Dirty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-put_dirty
     */
    put_Dirty(Dirty) {
        result := ComCall(10, this, "short", Dirty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkCustomStrokes>} ppunkInkCustomStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_customstrokes
     */
    get_CustomStrokes(ppunkInkCustomStrokes) {
        result := ComCall(11, this, "ptr*", ppunkInkCustomStrokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode, Rectangle) {
        result := ComCall(12, this, "int", BoundingBoxMode, "ptr*", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-deletestrokes
     */
    DeleteStrokes(Strokes) {
        result := ComCall(13, this, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokeDisp} Stroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-deletestroke
     */
    DeleteStroke(Stroke) {
        result := ComCall(14, this, "ptr", Stroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @param {Integer} ExtractFlags 
     * @param {Pointer<IInkDisp>} ExtractedInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractstrokes
     */
    ExtractStrokes(Strokes, ExtractFlags, ExtractedInk) {
        result := ComCall(15, this, "ptr", Strokes, "int", ExtractFlags, "ptr*", ExtractedInk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @param {Integer} extractFlags 
     * @param {Pointer<IInkDisp>} ExtractedInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractwithrectangle
     */
    ExtractWithRectangle(Rectangle, extractFlags, ExtractedInk) {
        result := ComCall(16, this, "ptr", Rectangle, "int", extractFlags, "ptr*", ExtractedInk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clip
     */
    Clip(Rectangle) {
        result := ComCall(17, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IInkDisp>} NewInk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clone
     */
    Clone(NewInk) {
        result := ComCall(18, this, "ptr*", NewInk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Float} radius 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestcircle
     */
    HitTestCircle(X, Y, radius, Strokes) {
        result := ComCall(19, this, "int", X, "int", Y, "float", radius, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} SelectionRectangle 
     * @param {Float} IntersectPercent 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithrectangle
     */
    HitTestWithRectangle(SelectionRectangle, IntersectPercent, Strokes) {
        result := ComCall(20, this, "ptr", SelectionRectangle, "float", IntersectPercent, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Float} IntersectPercent 
     * @param {Pointer<VARIANT>} LassoPoints 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithlasso
     */
    HitTestWithLasso(Points, IntersectPercent, LassoPoints, Strokes) {
        result := ComCall(21, this, "ptr", Points, "float", IntersectPercent, "ptr", LassoPoints, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Float>} PointOnStroke 
     * @param {Pointer<Float>} DistanceFromPacket 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-nearestpoint
     */
    NearestPoint(X, Y, PointOnStroke, DistanceFromPacket, Stroke) {
        PointOnStrokeMarshal := PointOnStroke is VarRef ? "float*" : "ptr"
        DistanceFromPacketMarshal := DistanceFromPacket is VarRef ? "float*" : "ptr"

        result := ComCall(22, this, "int", X, "int", Y, PointOnStrokeMarshal, PointOnStroke, DistanceFromPacketMarshal, DistanceFromPacket, "ptr*", Stroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} StrokeIds 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstrokes
     */
    CreateStrokes(StrokeIds, Strokes) {
        result := ComCall(23, this, "ptr", StrokeIds, "ptr*", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} SourceStrokes 
     * @param {IInkRectangle} TargetRectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-addstrokesatrectangle
     */
    AddStrokesAtRectangle(SourceStrokes, TargetRectangle) {
        result := ComCall(24, this, "ptr", SourceStrokes, "ptr", TargetRectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PersistenceFormat 
     * @param {Integer} CompressionMode 
     * @param {Pointer<VARIANT>} Data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-save
     */
    Save(PersistenceFormat, CompressionMode, Data) {
        result := ComCall(25, this, "int", PersistenceFormat, "int", CompressionMode, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} Data 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-load
     */
    Load(Data) {
        result := ComCall(26, this, "ptr", Data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} PacketData 
     * @param {VARIANT} PacketDescription 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstroke
     */
    CreateStroke(PacketData, PacketDescription, Stroke) {
        result := ComCall(27, this, "ptr", PacketData, "ptr", PacketDescription, "ptr*", Stroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @param {Pointer<IDataObject>} DataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopywithrectangle
     */
    ClipboardCopyWithRectangle(Rectangle, ClipboardFormats, ClipboardModes, DataObject) {
        result := ComCall(28, this, "ptr", Rectangle, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", DataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} strokes 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @param {Pointer<IDataObject>} DataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopy
     */
    ClipboardCopy(strokes, ClipboardFormats, ClipboardModes, DataObject) {
        result := ComCall(29, this, "ptr", strokes, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", DataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDataObject} DataObject 
     * @param {Pointer<VARIANT_BOOL>} CanPaste 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-canpaste
     */
    CanPaste(DataObject, CanPaste) {
        result := ComCall(30, this, "ptr", DataObject, "ptr", CanPaste, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {IDataObject} DataObject 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardpaste
     */
    ClipboardPaste(x, y, DataObject, Strokes) {
        result := ComCall(31, this, "int", x, "int", y, "ptr", DataObject, "ptr*", Strokes, "HRESULT")
        return result
    }
}
