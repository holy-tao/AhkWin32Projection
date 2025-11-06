#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\BSTR.ahk
#Include .\IDebugHostSymbols.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbols2 extends IDebugHostSymbols{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbols2
     * @type {Guid}
     */
    static IID => Guid("{6baf1f48-65ee-4ff2-b3af-10c7f21d38b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DemangleSymbolName"]

    /**
     * 
     * @param {IDebugHostSymbol} pSymbol 
     * @param {Integer} flags 
     * @returns {BSTR} 
     */
    DemangleSymbolName(pSymbol, flags) {
        pDemangledSymbolName := BSTR()
        result := ComCall(10, this, "ptr", pSymbol, "uint", flags, "ptr", pDemangledSymbolName, "HRESULT")
        return pDemangledSymbolName
    }
}
