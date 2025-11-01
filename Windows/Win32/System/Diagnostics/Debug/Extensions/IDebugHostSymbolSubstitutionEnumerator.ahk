#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbolEnumerator.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbolSubstitutionEnumerator extends IDebugHostSymbolEnumerator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbolSubstitutionEnumerator
     * @type {Guid}
     */
    static IID => Guid("{d49eece8-8d12-4ce1-ab73-e5b63df4f9d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextWithSubstitutionText"]

    /**
     * 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @param {Pointer<BSTR>} symbolText 
     * @returns {HRESULT} 
     */
    GetNextWithSubstitutionText(symbol, symbolText) {
        result := ComCall(5, this, "ptr*", symbol, "ptr", symbolText, "HRESULT")
        return result
    }
}
