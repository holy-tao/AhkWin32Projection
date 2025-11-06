#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransaction.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionCloner extends ITransaction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionCloner
     * @type {Guid}
     */
    static IID => Guid("{02656950-2152-11d0-944c-00a0c905416e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloneWithCommitDisabled"]

    /**
     * 
     * @returns {ITransaction} 
     */
    CloneWithCommitDisabled() {
        result := ComCall(6, this, "ptr*", &ppITransaction := 0, "HRESULT")
        return ITransaction(ppITransaction)
    }
}
