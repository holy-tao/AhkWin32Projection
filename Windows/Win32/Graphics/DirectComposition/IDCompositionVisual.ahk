#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Microsoft DirectComposition visual.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisual
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisual extends IUnknown{
    /**
     * The interface identifier for IDCompositionVisual
     * @type {Guid}
     */
    static IID => Guid("{4d93059d-097b-4651-9a60-f0f25116e2f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offsetX 
     * @returns {HRESULT} 
     */
    SetOffsetX(offsetX) {
        result := ComCall(4, this, "float", offsetX, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionAnimation>} animation 
     * @returns {HRESULT} 
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} offsetY 
     * @returns {HRESULT} 
     */
    SetOffsetY(offsetY) {
        result := ComCall(6, this, "float", offsetY, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionTransform>} transform 
     * @returns {HRESULT} 
     */
    SetTransform(transform) {
        result := ComCall(7, this, "ptr", transform, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix 
     * @returns {HRESULT} 
     */
    SetTransform(matrix) {
        result := ComCall(8, this, "ptr", matrix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @returns {HRESULT} 
     */
    SetTransformParent(visual) {
        result := ComCall(9, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionEffect>} effect 
     * @returns {HRESULT} 
     */
    SetEffect(effect) {
        result := ComCall(10, this, "ptr", effect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {HRESULT} 
     */
    SetBitmapInterpolationMode(interpolationMode) {
        result := ComCall(11, this, "int", interpolationMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} borderMode 
     * @returns {HRESULT} 
     */
    SetBorderMode(borderMode) {
        result := ComCall(12, this, "int", borderMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionClip>} clip 
     * @returns {HRESULT} 
     */
    SetClip(clip) {
        result := ComCall(13, this, "ptr", clip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @returns {HRESULT} 
     */
    SetClip(rect) {
        result := ComCall(14, this, "ptr", rect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} content 
     * @returns {HRESULT} 
     */
    SetContent(content) {
        result := ComCall(15, this, "ptr", content, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @param {BOOL} insertAbove 
     * @param {Pointer<IDCompositionVisual>} referenceVisual 
     * @returns {HRESULT} 
     */
    AddVisual(visual, insertAbove, referenceVisual) {
        result := ComCall(16, this, "ptr", visual, "int", insertAbove, "ptr", referenceVisual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDCompositionVisual>} visual 
     * @returns {HRESULT} 
     */
    RemoveVisual(visual) {
        result := ComCall(17, this, "ptr", visual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllVisuals() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} compositeMode 
     * @returns {HRESULT} 
     */
    SetCompositeMode(compositeMode) {
        result := ComCall(19, this, "int", compositeMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
