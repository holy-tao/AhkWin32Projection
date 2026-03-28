#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDCompositionEffect.ahk

/**
 * Represents a filter effect.
 * @see https://learn.microsoft.com/windows/win32/api/dcomp/nn-dcomp-idcompositionfiltereffect
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionFilterEffect extends IDCompositionEffect{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInput"]

    /**
     * Sets the the input at an index to the specified filter effect.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * Specifies the index the to apply the filter effect at.
     * @param {IUnknown} _input 
     * @param {Integer} flags Type: <b>UINT</b>
     * 
     * Flags to apply to the filter effect.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/dcomp/nf-dcomp-idcompositionfiltereffect-setinput
     */
    SetInput(index, _input, flags) {
        result := ComCall(3, this, "uint", index, "ptr", _input, "uint", flags, "HRESULT")
        return result
    }
}
