#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IInkDisp.ahk
#Include .\IInkRecognitionResult.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IInkStrokeDisp.ahk
#Include .\IInkRectangle.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkstrokes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkStrokes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkStrokes
     * @type {Guid}
     */
    static IID => Guid("{f1f4c9d8-590a-4963-b3ae-1935671bb6f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Ink", "get_RecognitionResult", "ToString", "Item", "Add", "AddStrokes", "Remove", "RemoveStrokes", "ModifyDrawingAttributes", "GetBoundingBox", "Transform", "ScaleToRectangle", "Move", "Rotate", "Shear", "ScaleTransform", "Clip", "RemoveRecognitionResult"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &_NewEnum := 0, "HRESULT")
        return IUnknown(_NewEnum)
    }

    /**
     * 
     * @returns {IInkDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-get_ink
     */
    get_Ink() {
        result := ComCall(9, this, "ptr*", &Ink := 0, "HRESULT")
        return IInkDisp(Ink)
    }

    /**
     * 
     * @returns {IInkRecognitionResult} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-get_recognitionresult
     */
    get_RecognitionResult() {
        result := ComCall(10, this, "ptr*", &RecognitionResult := 0, "HRESULT")
        return IInkRecognitionResult(RecognitionResult)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-tostring
     */
    ToString() {
        ToString := BSTR()
        result := ComCall(11, this, "ptr", ToString, "HRESULT")
        return ToString
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IInkStrokeDisp} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-item
     */
    Item(Index) {
        result := ComCall(12, this, "int", Index, "ptr*", &Stroke := 0, "HRESULT")
        return IInkStrokeDisp(Stroke)
    }

    /**
     * 
     * @param {IInkStrokeDisp} InkStroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-add
     */
    Add(InkStroke) {
        result := ComCall(13, this, "ptr", InkStroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} InkStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-addstrokes
     */
    AddStrokes(InkStrokes) {
        result := ComCall(14, this, "ptr", InkStrokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokeDisp} InkStroke 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-remove
     */
    Remove(InkStroke) {
        result := ComCall(15, this, "ptr", InkStroke, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} InkStrokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-removestrokes
     */
    RemoveStrokes(InkStrokes) {
        result := ComCall(16, this, "ptr", InkStrokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkDrawingAttributes} DrawAttrs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-modifydrawingattributes
     */
    ModifyDrawingAttributes(DrawAttrs) {
        result := ComCall(17, this, "ptr", DrawAttrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @returns {IInkRectangle} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-getboundingbox
     */
    GetBoundingBox(BoundingBoxMode) {
        result := ComCall(18, this, "int", BoundingBoxMode, "ptr*", &BoundingBox := 0, "HRESULT")
        return IInkRectangle(BoundingBox)
    }

    /**
     * 
     * @param {IInkTransform} Transform 
     * @param {VARIANT_BOOL} ApplyOnPenWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-transform
     */
    Transform(Transform, ApplyOnPenWidth) {
        result := ComCall(19, this, "ptr", Transform, "short", ApplyOnPenWidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-scaletorectangle
     */
    ScaleToRectangle(Rectangle) {
        result := ComCall(20, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(21, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(22, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-shear
     */
    Shear(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(23, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier) {
        result := ComCall(24, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkRectangle} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-clip
     */
    Clip(Rectangle) {
        result := ComCall(25, this, "ptr", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkstrokes-removerecognitionresult
     */
    RemoveRecognitionResult() {
        result := ComCall(26, this, "HRESULT")
        return result
    }
}
