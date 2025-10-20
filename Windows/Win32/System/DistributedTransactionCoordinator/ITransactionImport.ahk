#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionImport extends IUnknown{
    /**
     * The interface identifier for ITransactionImport
     * @type {Guid}
     */
    static IID => Guid("{e1cf9b5a-8745-11ce-a9ba-00aa006c3706}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Byte>} rgbTransactionCookie 
     * @param {Pointer<Guid>} piid 
     * @param {Pointer<Void>} ppvTransaction 
     * @returns {HRESULT} 
     */
    Import(cbTransactionCookie, rgbTransactionCookie, piid, ppvTransaction) {
        result := ComCall(3, this, "uint", cbTransactionCookie, "char*", rgbTransactionCookie, "ptr", piid, "ptr", ppvTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
