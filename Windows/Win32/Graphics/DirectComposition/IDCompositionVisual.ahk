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
     * Sets the TransformParent property of this visual. The TransformParent property establishes the coordinate system relative to which this visual is composed.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The new visual that establishes the base coordinate system for this visual. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-settransformparent
     */
    SetTransformParent(visual) {
        result := ComCall(9, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * Sets the Effect property of this visual.
     * @param {IDCompositionEffect} effect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositioneffect">IDCompositionEffect</a>*</b>
     * 
     * A pointer to an effect object. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-seteffect
     */
    SetEffect(effect) {
        result := ComCall(10, this, "ptr", effect, "HRESULT")
        return result
    }

    /**
     * Sets the BitmapInterpolationMode property, which specifies the mode for Microsoft DirectComposition to use when interpolating pixels from bitmaps that are not axis-aligned or drawn exactly at scale.
     * @param {Integer} interpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode">DCOMPOSITION_BITMAP_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-setbitmapinterpolationmode
     */
    SetBitmapInterpolationMode(interpolationMode) {
        result := ComCall(11, this, "int", interpolationMode, "HRESULT")
        return result
    }

    /**
     * Sets the BorderMode property, which specifies how to compose the edges of bitmaps and clips associated with this visual, or with visuals in the subtree rooted at this visual.
     * @param {Integer} borderMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE</a></b>
     * 
     * The border mode to use.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-setbordermode
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
     * Sets the Content property of this visual to the specified bitmap or window wrapper.
     * @param {IUnknown} content Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The object that is the new content of this visual. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-setcontent
     */
    SetContent(content) {
        result := ComCall(15, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Adds a new child visual to the children list of this visual.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The child visual to add. This parameter must not be NULL.
     * @param {BOOL} insertAbove Type: <b>BOOL</b>
     * 
     * TRUE to place the new child visual in front of the visual specified by the <i>referenceVisual</i> parameter, or FALSE to place it behind <i>referenceVisual</i>.
     * @param {IDCompositionVisual} referenceVisual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The existing child visual next to which the new visual should be added.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-addvisual
     */
    AddVisual(visual, insertAbove, referenceVisual) {
        result := ComCall(16, this, "ptr", visual, "int", insertAbove, "ptr", referenceVisual, "HRESULT")
        return result
    }

    /**
     * Removes a child visual from the children list of this visual.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The child visual to remove from the children list. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-removevisual
     */
    RemoveVisual(visual) {
        result := ComCall(17, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * Removes all visuals from the children list of this visual.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-removeallvisuals
     */
    RemoveAllVisuals() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Sets the blending mode for this visual.
     * @param {Integer} compositeMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_composite_mode">DCOMPOSITION_COMPOSITE_MODE</a></b>
     * 
     * The blending mode to use when composing the visual to the screen.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual-setcompositemode
     */
    SetCompositeMode(compositeMode) {
        result := ComCall(19, this, "int", compositeMode, "HRESULT")
        return result
    }
}
