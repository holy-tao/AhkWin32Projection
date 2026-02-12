#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransactionPhase0EnlistmentAsync.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionPhase0Factory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionPhase0Factory
     * @type {Guid}
     */
    static IID => Guid("{82dc88e0-a954-11d1-8f88-00600895e7d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {ITransactionPhase0NotifyAsync} pPhase0Notify 
     * @returns {ITransactionPhase0EnlistmentAsync} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(pPhase0Notify) {
        result := ComCall(3, this, "ptr", pPhase0Notify, "ptr*", &ppPhase0Enlistment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITransactionPhase0EnlistmentAsync(ppPhase0Enlistment)
    }
}
