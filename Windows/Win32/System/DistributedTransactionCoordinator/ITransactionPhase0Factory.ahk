#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionPhase0Factory extends IUnknown{
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
     * 
     * @param {Pointer<ITransactionPhase0NotifyAsync>} pPhase0Notify 
     * @param {Pointer<ITransactionPhase0EnlistmentAsync>} ppPhase0Enlistment 
     * @returns {HRESULT} 
     */
    Create(pPhase0Notify, ppPhase0Enlistment) {
        result := ComCall(3, this, "ptr", pPhase0Notify, "ptr", ppPhase0Enlistment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
