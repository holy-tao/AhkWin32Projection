#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostModule.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostModule2 extends IDebugHostModule{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostModule2
     * @type {Guid}
     */
    static IID => Guid("{b51887e8-bcd0-4e8f-a8c7-434398b78c37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindContainingSymbolByRVA"]

    /**
     * 
     * @param {Integer} rva 
     * @param {Pointer<IDebugHostSymbol>} symbol 
     * @param {Pointer<Integer>} offset 
     * @returns {HRESULT} 
     */
    FindContainingSymbolByRVA(rva, symbol, offset) {
        offsetMarshal := offset is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "uint", rva, "ptr*", symbol, offsetMarshal, offset, "HRESULT")
        return result
    }
}
