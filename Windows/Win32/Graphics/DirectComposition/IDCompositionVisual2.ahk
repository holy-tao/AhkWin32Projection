#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionVisual.ahk

/**
 * Represents one DirectComposition visual in a visual tree.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionvisual2
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
     * @param {Integer} mode The opacity mode to use when composing the visual to the screen.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual2-setopacitymode
     */
    SetOpacityMode(mode) {
        result := ComCall(20, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Specifies whether or not surfaces that have 3D transformations applied to them should be displayed when facing away from the observer.
     * @param {Integer} visibility [in]
     * 
     * The back face visibility to use when composing surfaces in this visual’s sub-tree to the screen.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionvisual2-setbackfacevisibility
     */
    SetBackFaceVisibility(visibility) {
        result := ComCall(21, this, "int", visibility, "HRESULT")
        return result
    }
}
