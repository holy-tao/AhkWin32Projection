#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionFilterEffect.ahk

/**
 * The composite effect is used to combine 2 or more images.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositioncompositeeffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionCompositeEffect extends IDCompositionFilterEffect{
    /**
     * The interface identifier for IDCompositionCompositeEffect
     * @type {Guid}
     */
    static IID => Guid("{576616c0-a231-494d-a38d-00fd5ec4db46}")

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
