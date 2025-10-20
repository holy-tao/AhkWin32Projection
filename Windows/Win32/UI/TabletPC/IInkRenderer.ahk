#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @remarks
 * 
  * Printing is also done through the InkRenderer object.
  * 
  * This object can be instantiated by calling the [CoCreateInstance](../combaseapi/nf-combaseapi-cocreateinstance.md) method in C++.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkrenderer
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkRenderer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkRenderer
     * @type {Guid}
     */
    static IID => Guid("{e6257a9c-b511-4f4c-a8b0-a7dbc9506b83}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetViewTransform", "SetViewTransform", "GetObjectTransform", "SetObjectTransform", "Draw", "DrawStroke", "PixelToInkSpace", "InkSpaceToPixel", "PixelToInkSpaceFromPoints", "InkSpaceToPixelFromPoints", "Measure", "MeasureStroke", "Move", "Rotate", "ScaleTransform"]

    /**
     * 
     * @param {IInkTransform} ViewTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-getviewtransform
     */
    GetViewTransform(ViewTransform) {
        result := ComCall(7, this, "ptr", ViewTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTransform} ViewTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-setviewtransform
     */
    SetViewTransform(ViewTransform) {
        result := ComCall(8, this, "ptr", ViewTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTransform} ObjectTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-getobjecttransform
     */
    GetObjectTransform(ObjectTransform) {
        result := ComCall(9, this, "ptr", ObjectTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkTransform} ObjectTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-setobjecttransform
     */
    SetObjectTransform(ObjectTransform) {
        result := ComCall(10, this, "ptr", ObjectTransform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {IInkStrokes} Strokes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-draw
     */
    Draw(hDC, Strokes) {
        result := ComCall(11, this, "ptr", hDC, "ptr", Strokes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {IInkStrokeDisp} Stroke 
     * @param {IInkDrawingAttributes} DrawingAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-drawstroke
     */
    DrawStroke(hDC, Stroke, DrawingAttributes) {
        result := ComCall(12, this, "ptr", hDC, "ptr", Stroke, "ptr", DrawingAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<Integer>} x 
     * @param {Pointer<Integer>} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-pixeltoinkspace
     */
    PixelToInkSpace(hDC, x, y) {
        result := ComCall(13, this, "ptr", hDC, "int*", x, "int*", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hdcDisplay 
     * @param {Pointer<Integer>} x 
     * @param {Pointer<Integer>} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-inkspacetopixel
     */
    InkSpaceToPixel(hdcDisplay, x, y) {
        result := ComCall(14, this, "ptr", hdcDisplay, "int*", x, "int*", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-pixeltoinkspacefrompoints
     */
    PixelToInkSpaceFromPoints(hDC, Points) {
        result := ComCall(15, this, "ptr", hDC, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-inkspacetopixelfrompoints
     */
    InkSpaceToPixelFromPoints(hDC, Points) {
        result := ComCall(16, this, "ptr", hDC, "ptr", Points, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokes} Strokes 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-measure
     */
    Measure(Strokes, Rectangle) {
        result := ComCall(17, this, "ptr", Strokes, "ptr*", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IInkStrokeDisp} Stroke 
     * @param {IInkDrawingAttributes} DrawingAttributes 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-measurestroke
     */
    MeasureStroke(Stroke, DrawingAttributes, Rectangle) {
        result := ComCall(18, this, "ptr", Stroke, "ptr", DrawingAttributes, "ptr*", Rectangle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalComponent 
     * @param {Float} VerticalComponent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-move
     */
    Move(HorizontalComponent, VerticalComponent) {
        result := ComCall(19, this, "float", HorizontalComponent, "float", VerticalComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Degrees 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-rotate
     */
    Rotate(Degrees, x, y) {
        result := ComCall(20, this, "float", Degrees, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @param {VARIANT_BOOL} ApplyOnPenWidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinkrenderer-scaletransform
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier, ApplyOnPenWidth) {
        result := ComCall(21, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "short", ApplyOnPenWidth, "HRESULT")
        return result
    }
}
