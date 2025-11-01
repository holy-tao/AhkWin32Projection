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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOffsetX", "SetOffsetX1", "SetOffsetY", "SetOffsetY1", "SetTransform", "SetTransform1", "SetTransformParent", "SetEffect", "SetBitmapInterpolationMode", "SetBorderMode", "SetClip", "SetClip1", "SetContent", "AddVisual", "RemoveVisual", "RemoveAllVisuals", "SetCompositeMode"]

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(idcompositionanimation)
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetX 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(idcompositionanimation)
     */
    SetOffsetX1(offsetX) {
        result := ComCall(4, this, "float", offsetX, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} offsetY 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)
     */
    SetOffsetY1(offsetY) {
        result := ComCall(6, this, "float", offsetY, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionTransform} transform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransform(constd2d_matrix_3x2_f_)
     */
    SetTransform(transform) {
        result := ComCall(7, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_MATRIX_3X2_F>} matrix 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransform(constd2d_matrix_3x2_f_)
     */
    SetTransform1(matrix) {
        result := ComCall(8, this, "ptr", matrix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionVisual} visual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransformparent
     */
    SetTransformParent(visual) {
        result := ComCall(9, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionEffect} effect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-seteffect
     */
    SetEffect(effect) {
        result := ComCall(10, this, "ptr", effect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} interpolationMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setbitmapinterpolationmode
     */
    SetBitmapInterpolationMode(interpolationMode) {
        result := ComCall(11, this, "int", interpolationMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} borderMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setbordermode
     */
    SetBorderMode(borderMode) {
        result := ComCall(12, this, "int", borderMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionClip} clip 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setclip(constd2d_rect_f_)
     */
    SetClip(clip) {
        result := ComCall(13, this, "ptr", clip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D2D_RECT_F>} rect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setclip(constd2d_rect_f_)
     */
    SetClip1(rect) {
        result := ComCall(14, this, "ptr", rect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} content 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setcontent
     */
    SetContent(content) {
        result := ComCall(15, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionVisual} visual 
     * @param {BOOL} insertAbove 
     * @param {IDCompositionVisual} referenceVisual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-addvisual
     */
    AddVisual(visual, insertAbove, referenceVisual) {
        result := ComCall(16, this, "ptr", visual, "int", insertAbove, "ptr", referenceVisual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDCompositionVisual} visual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-removevisual
     */
    RemoveVisual(visual) {
        result := ComCall(17, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-removeallvisuals
     */
    RemoveAllVisuals() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} compositeMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setcompositemode
     */
    SetCompositeMode(compositeMode) {
        result := ComCall(19, this, "int", compositeMode, "HRESULT")
        return result
    }
}
