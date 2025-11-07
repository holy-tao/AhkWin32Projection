#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionExport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionExport
     * @type {Guid}
     */
    static IID => Guid("{0141fda5-8fc0-11ce-bd18-204c4f4f5020}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Export", "GetTransactionCookie"]

    /**
     * 
     * @param {IUnknown} punkTransaction 
     * @returns {Integer} 
     */
    Export(punkTransaction) {
        result := ComCall(3, this, "ptr", punkTransaction, "uint*", &pcbTransactionCookie := 0, "HRESULT")
        return pcbTransactionCookie
    }

    /**
     * 
     * @param {IUnknown} punkTransaction 
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Integer>} rgbTransactionCookie 
     * @param {Pointer<Integer>} pcbUsed 
     * @returns {HRESULT} 
     */
    GetTransactionCookie(punkTransaction, cbTransactionCookie, rgbTransactionCookie, pcbUsed) {
        rgbTransactionCookieMarshal := rgbTransactionCookie is VarRef ? "char*" : "ptr"
        pcbUsedMarshal := pcbUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", punkTransaction, "uint", cbTransactionCookie, rgbTransactionCookieMarshal, rgbTransactionCookie, pcbUsedMarshal, pcbUsed, "HRESULT")
        return result
    }
}
