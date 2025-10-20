#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a filter effect.
 * @see https://docs.microsoft.com/windows/win32/api//dcomp/nn-dcomp-idcompositionfiltereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionFilterEffect extends IDCompositionEffect{
    /**
     * The interface identifier for IDCompositionFilterEffect
     * @type {Guid}
     */
    static IID => Guid("{30c421d5-8cb2-4e9f-b133-37be270d4ac2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IUnknown>} input 
     * @param {Integer} flags 
     * @returns {HRESULT} 
     */
    SetInput(index, input, flags) {
        result := ComCall(3, this, "uint", index, "ptr", input, "uint", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
