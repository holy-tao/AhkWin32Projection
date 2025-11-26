#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The Blend Effect is used to combine 2 images.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionblendeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionBlendEffect extends IDCompositionFilterEffect{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCompositionBlendEffect
     * @type {Guid}
     */
    static IID => Guid("{33ecdc0a-578a-4a11-9c14-0cb90517f9c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMode"]

    /**
     * Sets the blend mode to use when the blend effect combines the two images.
     * @param {Integer} mode Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/blend">D2D1_BLEND_MODE</a></b>
     * 
     * The blend mode to use when the blend effect combines the two images.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//dcomp/nf-dcomp-idcompositionblendeffect-setmode
     */
    SetMode(mode) {
        result := ComCall(4, this, "int", mode, "HRESULT")
        return result
    }
}
