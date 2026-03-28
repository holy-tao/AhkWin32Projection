#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Microsoft DirectComposition visual.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisual
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
     * Changes the value of the OffsetX property of this visual. (overload 2/2)
     * @remarks
     * This method makes a copy of the specified animation. If the animation object referenced by the <i>animation</i> parameter is changed after this call, the change does not affect the OffsetX property unless this method is called again. If the OffsetX property was previously animated, this method replaces that animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the OffsetX property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(idcompositionanimation)
     */
    SetOffsetX(animation) {
        result := ComCall(3, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Changes the value of the OffsetX property of this visual. (overload 2/2)
     * @remarks
     * This method makes a copy of the specified animation. If the animation object referenced by the <i>animation</i> parameter is changed after this call, the change does not affect the OffsetX property unless this method is called again. If the OffsetX property was previously animated, this method replaces that animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} offsetX 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsetx(idcompositionanimation)
     */
    SetOffsetX1(offsetX) {
        result := ComCall(4, this, "float", offsetX, "HRESULT")
        return result
    }

    /**
     * Animates the value of the OffsetY property of this visual.
     * @remarks
     * This method makes a copy of the specified animation. If the animation object referenced by the <i>animation</i> parameter is changed after this call, the change does not affect the OffsetY property unless this method is called again. If the OffsetY property was previously animated, this method replaces that animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionAnimation} animation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nn-dcompanimation-idcompositionanimation">IDCompositionAnimation</a>*</b>
     * 
     * An animation object that determines how the value of the OffsetY property changes over time. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)
     */
    SetOffsetY(animation) {
        result := ComCall(5, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Animates the value of the OffsetY property of this visual.
     * @remarks
     * This method makes a copy of the specified animation. If the animation object referenced by the <i>animation</i> parameter is changed after this call, the change does not affect the OffsetY property unless this method is called again. If the OffsetY property was previously animated, this method replaces that animation with the new animation.
     * 
     * This method fails if <i>animation</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {Float} offsetY 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setoffsety(idcompositionanimation)
     */
    SetOffsetY1(offsetY) {
        result := ComCall(6, this, "float", offsetY, "HRESULT")
        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 3-by-2 transform matrix.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform object, the newly specified transform matrix replaces the transform object.
     * @param {IDCompositionTransform} transform 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransform(constd2d_matrix_3x2_f_)
     */
    SetTransform(transform) {
        result := ComCall(7, this, "ptr", transform, "HRESULT")
        return result
    }

    /**
     * Sets the Transform property of this visual to the specified 3-by-2 transform matrix.
     * @remarks
     * Setting the Transform property transforms the coordinate system of the entire visual subtree that is rooted at this visual. If the Clip property of this visual is specified, the clip rectangle is also transformed.
     * 
     * 
     * 
     * If the Transform property previously specified a transform object, the newly specified transform matrix replaces the transform object.
     * @param {Pointer<D2D_MATRIX_3X2_F>} _matrix 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransform(constd2d_matrix_3x2_f_)
     */
    SetTransform1(_matrix) {
        result := ComCall(8, this, "ptr", _matrix, "HRESULT")
        return result
    }

    /**
     * Sets the TransformParent property of this visual. The TransformParent property establishes the coordinate system relative to which this visual is composed.
     * @remarks
     * The coordinate system of a visual is modified by the OffsetX, OffsetY, and Transform properties. Normally, these properties define the coordinate system of a visual relative to its immediate parent. This method specifies the  visual relative to which the coordinate system for this visual is based. The specified visual must be an ancestor of the current visual. If it is not an ancestor, the coordinate system is based on this visual's immediate parent, just as if the TransformParent property were set to NULL. Because visuals can be reparented, this property can take effect again if the specified visual becomes an ancestor of the target visual through a reparenting operation.
     * 
     * 
     * 
     * If the <i>visual</i> parameter is NULL, the coordinate system is always transformed relative to the visual's immediate parent. This is the default behavior if this method is not used. 
     * 
     * 
     * 
     * This method fails if the <i>visual</i> parameter is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The new visual that establishes the base coordinate system for this visual. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-settransformparent
     */
    SetTransformParent(visual) {
        result := ComCall(9, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * Sets the Effect property of this visual.
     * @remarks
     * This method creates an implicit off-screen surface to which the subtree that is rooted at this visual is composed. The surface is used as one of the inputs to the specified effect. The output of the effect is composed directly to the composition target. Some effects also use the composition target as another implicit input. This is typically the case for compositional or blend effects such as opacity, where the composition target is considered to be the "background." In that case, any visuals that are "behind" the current visual are included in the composition target when the current visual is rendered and are considered to be the "background" that this visual composes to.
     * 
     * 
     * 
     * If this visual is not the root of a visual tree and one of its ancestors also has an effect applied to it, the off-screen surface created by the closest ancestor is the composition target to which this visual's effect is composed. Otherwise, the composition target is the root composition target. As a consequence, the background for compositional and blend effects includes only the visuals up to the closest ancestor that itself has an effect. Conversely, any effects applied to visuals under the current visual use the newly created off-screen surface as the background, which may affect how those visuals ultimately compose on top of what the end user perceives as being "behind" those visuals.
     * 
     * 
     * 
     * If the <i>effect</i> parameter is NULL,  no bitmap effect is applied to this visual. Any previous effects that were associated with this visual are removed. The off-screen surface is also removed and the visual subtree is composed directly to the parent composition target, which may also affect how compositional or blend effects under this visual are rendered.
     * 
     * 
     * 
     * This method fails if <i>effect</i> is an invalid pointer or if it was not created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface that created this visual. The interface cannot be a custom implementation; only interfaces created by Microsoft DirectComposition can be used with this method.
     * @param {IDCompositionEffect} _effect 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-seteffect
     */
    SetEffect(_effect) {
        result := ComCall(10, this, "ptr", _effect, "HRESULT")
        return result
    }

    /**
     * Sets the BitmapInterpolationMode property, which specifies the mode for Microsoft DirectComposition to use when interpolating pixels from bitmaps that are not axis-aligned or drawn exactly at scale.
     * @remarks
     * The interpolation mode affects how a bitmap is composed when it is transformed such that there is no one-to-one correspondence between pixels in the bitmap and pixels on the screen.
     * 
     * 
     * 
     * By default, a visual inherits the interpolation mode of the parent visual, which may inherit the interpolation mode of its parent visual, and so on. A visual uses the default interpolation mode if this method is never called for the visual, or if this method is called with <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode">DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT</a>. If no visuals set the interpolation mode, the default for the entire visual tree is nearest neighbor interpolation, which offers the lowest visual quality but the highest performance.
     * 
     * 
     * 
     * If the <i>interpolationMode</i> parameter is anything other than <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_bitmap_interpolation_mode">DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT</a>, this visual's bitmap is composed with the specified interpolation mode, and this mode becomes the new default mode for the children of this visual. That is, if the interpolation mode of this visual's children is unchanged or explicitly set to <b>DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT</b>, the bitmaps of the child visuals are composed using the interpolation mode of this visual.
     * @param {Integer} _interpolationMode 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setbitmapinterpolationmode
     */
    SetBitmapInterpolationMode(_interpolationMode) {
        result := ComCall(11, this, "int", _interpolationMode, "HRESULT")
        return result
    }

    /**
     * Sets the BorderMode property, which specifies how to compose the edges of bitmaps and clips associated with this visual, or with visuals in the subtree rooted at this visual.
     * @remarks
     * The border mode affects how the edges of a bitmap are composed when the bitmap is transformed such that the edges are not exactly axis-aligned and at precise pixel boundaries. It also affects how content is clipped at the corners of a clip that has rounded corners, and at the edge of a clip that is transformed such that the edges are not exactly axis-aligned and at precise pixel boundaries.
     * 
     * 
     * 
     * By default, a visual inherits the border mode of  its parent visual, which may inherit the border mode of its parent visual, and so on. A visual uses the default border mode if this method is never called for the visual, or if this method is called with <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE_INHERIT</a>. If no visuals set the border mode, the default for the entire visual tree is aliased rendering, which offers the lowest visual quality but the highest performance.
     * 
     * 
     * 
     * If the <i>borderMode</i> parameter is anything other than <a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE_INHERIT</a>, this visual's bitmap and clip are composed with the specified border mode. In addition, this border mode becomes the new default for the children of the current visual. That is, if the border mode of this visual's children is unchanged or explicitly set to <b>DCOMPOSITION_BORDER_MODE_INHERIT</b>, the bitmaps and clips of the child visuals are composed using the border mode of this visual.
     * @param {Integer} borderMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_border_mode">DCOMPOSITION_BORDER_MODE</a></b>
     * 
     * The border mode to use.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setbordermode
     */
    SetBorderMode(borderMode) {
        result := ComCall(12, this, "int", borderMode, "HRESULT")
        return result
    }

    /**
     * Sets the Clip property of this visual to the specified rectangle.
     * @remarks
     * Setting the Clip property clips this visual along with all visuals in the subtree that is rooted at this visual. The clip is transformed by the OffsetX, OffsetY, and Transform properties. 
     * 
     * If the Clip property previously specified a clip object, the newly specified clip rectangle replaces the clip object.
     * 
     * This method fails if any members of the <i>rect</i> structure are NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the clip rectangle is empty, the visual is fully clipped; that is, the visual is included in the visual tree, but it does not render anything. 
     *       To exclude a particular visual from a composition, remove the visual from the visual tree instead of setting an empty clip rectangle. 
     *       Removing the visual results in better performance.
     * @param {IDCompositionClip} clip 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *               See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setclip(constd2d_rect_f_)
     */
    SetClip(clip) {
        result := ComCall(13, this, "ptr", clip, "HRESULT")
        return result
    }

    /**
     * Sets the Clip property of this visual to the specified rectangle.
     * @remarks
     * Setting the Clip property clips this visual along with all visuals in the subtree that is rooted at this visual. The clip is transformed by the OffsetX, OffsetY, and Transform properties. 
     * 
     * If the Clip property previously specified a clip object, the newly specified clip rectangle replaces the clip object.
     * 
     * This method fails if any members of the <i>rect</i> structure are NaN, positive infinity, or negative infinity.
     * 
     *       
     * 
     * If the clip rectangle is empty, the visual is fully clipped; that is, the visual is included in the visual tree, but it does not render anything. 
     *       To exclude a particular visual from a composition, remove the visual from the visual tree instead of setting an empty clip rectangle. 
     *       Removing the visual results in better performance.
     * @param {Pointer<D2D_RECT_F>} _rect 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. 
     *               See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setclip(constd2d_rect_f_)
     */
    SetClip1(_rect) {
        result := ComCall(14, this, "ptr", _rect, "HRESULT")
        return result
    }

    /**
     * Sets the Content property of this visual to the specified bitmap or window wrapper.
     * @remarks
     * The <i>content</i> parameter must point to one of the following:
     * 
     * <ul>
     * <li>An object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionsurface">IDCompositionSurface</a> interface.</li>
     * <li>An object that implements the <b>IDXGISwapChain1</b> interface.</li>
     * <li>A wrapper object that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhandle">CreateSurfaceFromHandle</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhwnd">CreateSurfaceFromHwnd</a> method.
     * </li>
     * </ul>
     * The new content replaces any content that was previously associated with the visual. If the <i>content</i> parameter is NULL, the visual has no associated content.
     * 
     * A visual can be associated with a bitmap object or a window wrapper. A bitmap is either a Microsoft DirectX swap chain or a Microsoft DirectComposition surface.
     * 
     * A window wrapper is created with the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhwnd">CreateSurfaceFromHwnd</a> method and is a stand-in for the rasterization of another window, which must be a top-level window or a layered child window. A window wrapper is conceptually equivalent to a bitmap that is the size of the target window on which the contents of the window are drawn. The contents include the target window's child windows (layered or otherwise), and any DirectComposition content that is drawn in the child windows. 
     * 
     * A DirectComposition surface wrapper is created with the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-createsurfacefromhandle">CreateSurfaceFromHandle</a> method and is a reference to a swap chain. An application might use a surface wrapper in a cross-process scenario where one process creates the swap chain and another process associates the bitmap with a visual.
     * 
     * The bitmap is always drawn at position (0,0) relative to the visual's coordinate system, although the coordinate system is directly affected by the OffsetX, OffsetY, and Transform properties, as well as indirectly by the transformations on ancestor visuals. The bitmap of a visual is always drawn behind the children of that visual.
     * @param {IUnknown} content Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The object that is the new content of this visual. This parameter can be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setcontent
     */
    SetContent(content) {
        result := ComCall(15, this, "ptr", content, "HRESULT")
        return result
    }

    /**
     * Adds a new child visual to the children list of this visual.
     * @remarks
     * Child visuals are arranged in an ordered list. The contents of a child visual are drawn in front of (or above) the contents of its parent visual,  but behind (or below) the contents of its children.
     * 
     * The <i>referenceVisual</i> parameter must be an existing child of the parent visual, or it must be NULL. The <i>insertAbove</i> parameter indicates whether the new child should be rendered immediately above the reference visual in the Z order, or immediately below it.
     * 
     * If the <i>referenceVisual</i> parameter is NULL, the specified visual is rendered above or below all children of the parent visual, depending on the value of the <i>insertAbove</i> parameter. If <i>insertAbove</i> is TRUE, the new child visual is above no sibling, therefore it is rendered  below all of its siblings. Conversely, if <i>insertAbove</i> is FALSE, the visual is below no sibling, therefore it is rendered above all of its siblings.
     * 
     * The visual specified by the <i>visual</i> parameter cannot be either a child of a single other visual, or the root of a visual tree that is associated with a composition target. If <i>visual</i> is already a child of another visual, <b>AddVisual</b> fails. The child visual must be removed from the children list of its previous parent before adding it to the children list of the new parent. If <i>visual</i> is the root of a visual tree, the visual must be dissociated from that visual tree before adding it to the children list of the new parent. To dissociate the visual from a visual tree, call the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiontarget-setroot">IDCompositionTarget::SetRoot</a> method and specify either a different visual or NULL as the <i>visual</i> parameter.
     * 
     * A child visual need not have been created by the same <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositiondevice">IDCompositionDevice</a> interface as its parent. When visuals from different devices are combined in the same visual tree,  Microsoft DirectComposition composes the  tree as it normally would, except that changes to a particular visual take effect only when <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-commit">IDCompositionDevice::Commit</a> is called on the device object that created the visual. The ability to combine visuals from different devices  enables multiple threads to create and manipulate a single visual tree while maintaining independent devices that can be used to commit changes asynchronously
     * 
     * This method fails if <i>visual</i> or <i>referenceVisual</i> is an invalid pointer, or if the visual referenced by the <i>referenceVisual</i> parameter is not a child of the parent visual. These  interfaces cannot be custom implementations; only interfaces created by DirectComposition can be used with this method.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The child visual to add. This parameter must not be NULL.
     * @param {BOOL} insertAbove Type: <b>BOOL</b>
     * 
     * TRUE to place the new child visual in front of the visual specified by the <i>referenceVisual</i> parameter, or FALSE to place it behind <i>referenceVisual</i>.
     * @param {IDCompositionVisual} referenceVisual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The existing child visual next to which the new visual should be added.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-addvisual
     */
    AddVisual(visual, insertAbove, referenceVisual) {
        result := ComCall(16, this, "ptr", visual, "int", insertAbove, "ptr", referenceVisual, "HRESULT")
        return result
    }

    /**
     * Removes a child visual from the children list of this visual.
     * @remarks
     * The child visual is removed from the list of children. The order of the remaining child visuals is not changed.
     * 
     * This method fails if <i>visual</i> is not a child of the parent visual.
     * @param {IDCompositionVisual} visual Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nn-dcomp-idcompositionvisual">IDCompositionVisual</a>*</b>
     * 
     * The child visual to remove from the children list. This parameter must not be NULL.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-removevisual
     */
    RemoveVisual(visual) {
        result := ComCall(17, this, "ptr", visual, "HRESULT")
        return result
    }

    /**
     * Removes all visuals from the children list of this visual.
     * @remarks
     * This method can be called even if this visual has no children.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-removeallvisuals
     */
    RemoveAllVisuals() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * Sets the blending mode for this visual.
     * @remarks
     * The composite mode determines how visual's bitmap is blended with the screen. By default, the visual is blended with "source over" semantics; that is, the colors are blended with per-pixel transparency.
     * @param {Integer} compositeMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcomptypes/ne-dcomptypes-dcomposition_composite_mode">DCOMPOSITION_COMPOSITE_MODE</a></b>
     * 
     * The blending mode to use when composing the visual to the screen.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual-setcompositemode
     */
    SetCompositeMode(compositeMode) {
        result := ComCall(19, this, "int", compositeMode, "HRESULT")
        return result
    }
}
