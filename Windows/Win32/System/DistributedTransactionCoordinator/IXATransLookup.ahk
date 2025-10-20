#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class IXATransLookup extends IUnknown{
    /**
     * The interface identifier for IXATransLookup
     * @type {Guid}
     */
    static IID => Guid("{f3b1f131-eeda-11ce-aed4-00aa0051e2c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITransaction>} ppTransaction 
     * @returns {HRESULT} 
     */
    Lookup(ppTransaction) {
        result := ComCall(3, this, "ptr", ppTransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
