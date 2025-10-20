#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionExport extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} punkTransaction 
     * @param {Pointer<UInt32>} pcbTransactionCookie 
     * @returns {HRESULT} 
     */
    Export(punkTransaction, pcbTransactionCookie) {
        result := ComCall(3, this, "ptr", punkTransaction, "uint*", pcbTransactionCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkTransaction 
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Byte>} rgbTransactionCookie 
     * @param {Pointer<UInt32>} pcbUsed 
     * @returns {HRESULT} 
     */
    GetTransactionCookie(punkTransaction, cbTransactionCookie, rgbTransactionCookie, pcbUsed) {
        result := ComCall(4, this, "ptr", punkTransaction, "uint", cbTransactionCookie, "char*", rgbTransactionCookie, "uint*", pcbUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
