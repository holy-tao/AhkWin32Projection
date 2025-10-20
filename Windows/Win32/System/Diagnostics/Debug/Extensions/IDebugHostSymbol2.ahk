#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostSymbol2 extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostSymbol2
     * @type {Guid}
     */
    static IID => Guid("{21515b67-6720-4257-8a68-077dc944471c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLanguage"]

    /**
     * 
     * @param {Pointer<Integer>} pKind 
     * @returns {HRESULT} 
     */
    GetLanguage(pKind) {
        result := ComCall(10, this, "int*", pKind, "HRESULT")
        return result
    }
}
