#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInkStrokes.ahk
#Include .\IInkExtendedProperties.ahk
#Include .\IInkCustomStrokes.ahk
#Include .\IInkRectangle.ahk
#Include .\IInkDisp.ahk
#Include .\IInkStrokeDisp.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDataObject.ahk
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
     * @type {IInkStrokes} 
     */
    Strokes {
        get => this.get_Strokes()
    }

    /**
     * @type {IInkExtendedProperties} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Dirty {
        get => this.get_Dirty()
        set => this.put_Dirty(value)
    }

    /**
     * @type {IInkCustomStrokes} 
     */
    CustomStrokes {
        get => this.get_CustomStrokes()
    }

    /**
     * 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_strokes
     */
    get_Strokes() {
        result := ComCall(7, this, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @returns {IInkExtendedProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_extendedproperties
     */
    get_ExtendedProperties() {
        result := ComCall(8, this, "ptr*", &Properties := 0, "HRESULT")
        return IInkExtendedProperties(Properties)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_dirty
     */
    get_Dirty() {
        result := ComCall(9, this, "short*", &Dirty := 0, "HRESULT")
        return Dirty
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
     * @returns {IInkCustomStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-get_customstrokes
     */
    get_CustomStrokes() {
        result := ComCall(11, this, "ptr*", &ppunkInkCustomStrokes := 0, "HRESULT")
        return IInkCustomStrokes(ppunkInkCustomStrokes)
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(12, this, "int", BoundingBoxMode, "ptr*", &Rectangle := 0, "HRESULT")
        return IInkRectangle(Rectangle)
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
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractstrokes
     */
    ExtractStrokes(Strokes, ExtractFlags) {
        result := ComCall(15, this, "ptr", Strokes, "int", ExtractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @param {Integer} extractFlags 
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-extractwithrectangle
     */
    ExtractWithRectangle(Rectangle, extractFlags) {
        result := ComCall(16, this, "ptr", Rectangle, "int", extractFlags, "ptr*", &ExtractedInk := 0, "HRESULT")
        return IInkDisp(ExtractedInk)
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
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clone
     */
    Clone() {
        result := ComCall(18, this, "ptr*", &NewInk := 0, "HRESULT")
        return IInkDisp(NewInk)
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Float} radius 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestcircle
     */
    HitTestCircle(X, Y, radius) {
        result := ComCall(19, this, "int", X, "int", Y, "float", radius, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {IInkRectangle} SelectionRectangle 
     * @param {Float} IntersectPercent 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithrectangle
     */
    HitTestWithRectangle(SelectionRectangle, IntersectPercent) {
        result := ComCall(20, this, "ptr", SelectionRectangle, "float", IntersectPercent, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {VARIANT} Points 
     * @param {Float} IntersectPercent 
     * @param {Pointer<VARIANT>} LassoPoints 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-hittestwithlasso
     */
    HitTestWithLasso(Points, IntersectPercent, LassoPoints) {
        result := ComCall(21, this, "ptr", Points, "float", IntersectPercent, "ptr", LassoPoints, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }

    /**
     * 
     * @param {Integer} X 
     * @param {Integer} Y 
     * @param {Pointer<Float>} PointOnStroke 
     * @param {Pointer<Float>} DistanceFromPacket 
     * @returns {IInkStrokeDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-nearestpoint
     */
    NearestPoint(X, Y, PointOnStroke, DistanceFromPacket) {
        PointOnStrokeMarshal := PointOnStroke is VarRef ? "float*" : "ptr"
        DistanceFromPacketMarshal := DistanceFromPacket is VarRef ? "float*" : "ptr"

        result := ComCall(22, this, "int", X, "int", Y, PointOnStrokeMarshal, PointOnStroke, DistanceFromPacketMarshal, DistanceFromPacket, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * 
     * @param {VARIANT} StrokeIds 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstrokes
     */
    CreateStrokes(StrokeIds) {
        result := ComCall(23, this, "ptr", StrokeIds, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-save
     */
    Save(PersistenceFormat, CompressionMode) {
        Data := VARIANT()
        result := ComCall(25, this, "int", PersistenceFormat, "int", CompressionMode, "ptr", Data, "HRESULT")
        return Data
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
     * @returns {IInkStrokeDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-createstroke
     */
    CreateStroke(PacketData, PacketDescription) {
        result := ComCall(27, this, "ptr", PacketData, "ptr", PacketDescription, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopywithrectangle
     */
    ClipboardCopyWithRectangle(Rectangle, ClipboardFormats, ClipboardModes) {
        result := ComCall(28, this, "ptr", Rectangle, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * 
     * @param {IInkStrokes} strokes 
     * @param {Integer} ClipboardFormats 
     * @param {Integer} ClipboardModes 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardcopy
     */
    ClipboardCopy(strokes, ClipboardFormats, ClipboardModes) {
        result := ComCall(29, this, "ptr", strokes, "int", ClipboardFormats, "int", ClipboardModes, "ptr*", &DataObject := 0, "HRESULT")
        return IDataObject(DataObject)
    }

    /**
     * 
     * @param {IDataObject} DataObject 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-canpaste
     */
    CanPaste(DataObject) {
        result := ComCall(30, this, "ptr", DataObject, "short*", &CanPaste := 0, "HRESULT")
        return CanPaste
    }

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {IDataObject} DataObject 
     * @returns {IInkStrokes} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkdisp-clipboardpaste
     */
    ClipboardPaste(x, y, DataObject) {
        result := ComCall(31, this, "int", x, "int", y, "ptr", DataObject, "ptr*", &Strokes := 0, "HRESULT")
        return IInkStrokes(Strokes)
    }
}
