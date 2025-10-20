#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IXATransLookup2 extends IUnknown{
    /**
     * The interface identifier for IXATransLookup2
     * @type {Guid}
     */
    static IID => Guid("{bf193c85-0d1a-4290-b88f-d2cb8873d1e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<XID>} pXID 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @returns {HRESULT} 
     */
    Lookup(pXID, ppTransaction) {
        result := ComCall(3, this, "ptr", pXID, "ptr", ppTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
