#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/nn-msinkaut-iinkstrokes
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class IInkStrokes extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(7, this, "int*", Count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} _NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(_NewEnum) {
        result := ComCall(8, this, "ptr", _NewEnum, "int")
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
        result := ComCall(9, this, "ptr", Ink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkRecognitionResult>} RecognitionResult 
     * @returns {HRESULT} 
     */
    get_RecognitionResult(RecognitionResult) {
        result := ComCall(10, this, "ptr", RecognitionResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ToString 
     * @returns {HRESULT} 
     */
    ToString(ToString) {
        result := ComCall(11, this, "ptr", ToString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IInkStrokeDisp>} Stroke 
     * @returns {HRESULT} 
     */
    Item(Index, Stroke) {
        result := ComCall(12, this, "int", Index, "ptr", Stroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokeDisp>} InkStroke 
     * @returns {HRESULT} 
     */
    Add(InkStroke) {
        result := ComCall(13, this, "ptr", InkStroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} InkStrokes 
     * @returns {HRESULT} 
     */
    AddStrokes(InkStrokes) {
        result := ComCall(14, this, "ptr", InkStrokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokeDisp>} InkStroke 
     * @returns {HRESULT} 
     */
    Remove(InkStroke) {
        result := ComCall(15, this, "ptr", InkStroke, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkStrokes>} InkStrokes 
     * @returns {HRESULT} 
     */
    RemoveStrokes(InkStrokes) {
        result := ComCall(16, this, "ptr", InkStrokes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInkDrawingAttributes>} DrawAttrs 
     * @returns {HRESULT} 
     */
    ModifyDrawingAttributes(DrawAttrs) {
        result := ComCall(17, this, "ptr", DrawAttrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BoundingBoxMode 
     * @param {Pointer<IInkRectangle>} BoundingBox 
     * @returns {HRESULT} 
     */
    GetBoundingBox(BoundingBoxMode, BoundingBox) {
        result := ComCall(18, this, "int", BoundingBoxMode, "ptr", BoundingBox, "int")
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
        result := ComCall(19, this, "ptr", Transform, "short", ApplyOnPenWidth, "int")
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
        result := ComCall(20, this, "ptr", Rectangle, "int")
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
        result := ComCall(21, this, "float", HorizontalComponent, "float", VerticalComponent, "int")
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
        result := ComCall(22, this, "float", Degrees, "float", x, "float", y, "int")
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
        result := ComCall(23, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "int")
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
        result := ComCall(24, this, "float", HorizontalMultiplier, "float", VerticalMultiplier, "int")
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
        result := ComCall(25, this, "ptr", Rectangle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveRecognitionResult() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
