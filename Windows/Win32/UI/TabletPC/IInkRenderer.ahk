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
     * 
     * @param {Pointer<IInkTransform>} ViewTransform 
     * @returns {HRESULT} 
     */
    GetViewTransform(ViewTransform) {
        result := ComCall(7, this, "ptr", ViewTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTransform>} ViewTransform 
     * @returns {HRESULT} 
     */
    SetViewTransform(ViewTransform) {
        result := ComCall(8, this, "ptr", ViewTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTransform>} ObjectTransform 
     * @returns {HRESULT} 
     */
    GetObjectTransform(ObjectTransform) {
        result := ComCall(9, this, "ptr", ObjectTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkTransform>} ObjectTransform 
     * @returns {HRESULT} 
     */
    SetObjectTransform(ObjectTransform) {
        result := ComCall(10, this, "ptr", ObjectTransform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @returns {HRESULT} 
     */
    Draw(hDC, Strokes) {
        result := ComCall(11, this, "ptr", hDC, "ptr", Strokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @param {Pointer<IInkDrawingAttributes>} DrawingAttributes 
     * @returns {HRESULT} 
     */
    DrawStroke(hDC, Stroke, DrawingAttributes) {
        result := ComCall(12, this, "ptr", hDC, "ptr", Stroke, "ptr", DrawingAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<Int32>} x 
     * @param {Pointer<Int32>} y 
     * @returns {HRESULT} 
     */
    PixelToInkSpace(hDC, x, y) {
        result := ComCall(13, this, "ptr", hDC, "int*", x, "int*", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hdcDisplay 
     * @param {Pointer<Int32>} x 
     * @param {Pointer<Int32>} y 
     * @returns {HRESULT} 
     */
    InkSpaceToPixel(hdcDisplay, x, y) {
        result := ComCall(14, this, "ptr", hdcDisplay, "int*", x, "int*", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     */
    PixelToInkSpaceFromPoints(hDC, Points) {
        result := ComCall(15, this, "ptr", hDC, "ptr", Points, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hDC 
     * @param {Pointer<VARIANT>} Points 
     * @returns {HRESULT} 
     */
    InkSpaceToPixelFromPoints(hDC, Points) {
        result := ComCall(16, this, "ptr", hDC, "ptr", Points, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} Strokes 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    Measure(Strokes, Rectangle) {
        result := ComCall(17, this, "ptr", Strokes, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @param {Pointer<IInkDrawingAttributes>} DrawingAttributes 
     * @param {Pointer<IInkRectangle>} Rectangle 
     * @returns {HRESULT} 
     */
    MeasureStroke(Stroke, DrawingAttributes, Rectangle) {
        result := ComCall(18, this, "ptr", Stroke, "ptr", DrawingAttributes, "ptr", Rectangle, "int")
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
        result := ComCall(19, this, "float", HorizontalComponent, "float", VerticalComponent, "int")
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
        result := ComCall(20, this, "float", Degrees, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} HorizontalMultiplier 
     * @param {Float} VerticalMultiplier 
     * @param {VARIANT_BOOL} ApplyOnPenWidth 
     * @returns {HRESULT} 
     */
    ScaleTransform(HorizontalMultiplier, VerticalMultiplier, ApplyOnPenWidth) {
        result := ComCall(21, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "short", ApplyOnPenWidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
