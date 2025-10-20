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
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetMode(mode) {
        result := ComCall(4, this, "int", mode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
