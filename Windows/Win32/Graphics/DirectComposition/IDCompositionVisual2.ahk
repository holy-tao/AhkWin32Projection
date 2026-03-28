#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisual.ahk

/**
 * Represents one DirectComposition visual in a visual tree. (IDCompositionVisual2)
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionvisual2
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionVisual2 extends IDCompositionVisual{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionVisual2
     * @type {Guid}
     */
    static IID => Guid("{e8de1639-4331-4b26-bc5f-6a321d347a85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOpacityMode", "SetBackFaceVisibility"]

    /**
     * Sets the opacity mode for this visual.
     * @remarks
     * The opacity mode affects how the Opacity property of an effect group object affects the composition of a visual sub-tree. DirectComposition supports two opacity modes: Layer and Multiply. In Layer mode, each visual sub-tree can be logically viewed as a bitmap that contains the opaque rasterization of that entire sub-tree, to which the opacity value is then applied. In this manner, overlapping opaque surfaces blend with the sub-tree’s background, but not with each other. In contrast, in Multiply mode the opacity is applied individually to each surface as it is composed, so surfaces blend with each other. Multiply mode is faster than Layer mode and always preferred if the visual tree contains entirely non-overlapping contents. However, Multiply mode may produce undesired visual results for overlapping elements.
     * 
     * 
     * 
     * By default, a visual inherits the opacity mode of its parent visual, which may inherit the opacity mode of its parent visual, and so on. A visual uses the DCOMPOSITION_OPACITY_MODE_LAYER mode if this method is never called for the visual, or if this method is called with DCOMPOSITION_OPACITY_MODE_INHERIT. If no visuals set the opacity mode, the default for the entire visual tree is DCOMPOSITION_OPACITY_MODE_LAYER. 
     * 
     * 
     * 
     * If the <i>opacityMode</i> parameter is anything other than DCOMPOSITION_OPACITY_MODE_INHERIT, this visual's surfaces are composed with the specified opacity mode. In addition, this opacity mode becomes the new default for the children of the current visual. That is, if the opacity mode of this visual's children is unchanged or explicitly set to DCOMPOSITION_OPACITY_MODE_INHERIT, the surfaces the child visuals are composed using the opacity mode of this visual.
     * @param {Integer} _mode 
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual2-setopacitymode
     */
    SetOpacityMode(_mode) {
        result := ComCall(20, this, "int", _mode, "HRESULT")
        return result
    }

    /**
     * Specifies whether or not surfaces that have 3D transformations applied to them should be displayed when facing away from the observer.
     * @remarks
     * The back face visibility property affects how surfaces that have 3D transformations applied are rendered.
     * 
     * By default, a visual inherits the back face visibility property of its parent visual, which may inherit the back face visibility property of its parent visual, and so on. A visual uses the DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE mode if this method is never called for the visual, or if this method is called with DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT. If no visuals set the back face visibility property, the default for the entire visual tree is DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE. 
     * 
     * If the <i>visibility</i> parameter is anything other than DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT, this visual's surfaces are composed with the specified visibility mode. In addition, this visibility mode becomes the new default for the children of the current visual. That is, if the visibility mode of this visual's children is unchanged or explicitly set to DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT, the surfaces the child visuals are composed using the visibility mode of this visual.
     * @param {Integer} visibility [in]
     * 
     * The back face visibility to use when composing surfaces in this visual’s sub-tree to the screen.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionvisual2-setbackfacevisibility
     */
    SetBackFaceVisibility(visibility) {
        result := ComCall(21, this, "int", visibility, "HRESULT")
        return result
    }
}
