#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransaction.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionPhase0EnlistmentAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionPhase0EnlistmentAsync
     * @type {Guid}
     */
    static IID => Guid("{82dc88e1-a954-11d1-8f88-00600895e7d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Enable", "WaitForEnlistment", "Phase0Done", "Unenlist", "GetTransaction"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Enable() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForEnlistment() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Phase0Done() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unenlist() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITransaction} 
     */
    GetTransaction() {
        result := ComCall(7, this, "ptr*", &ppITransaction := 0, "HRESULT")
        return ITransaction(ppITransaction)
    }
}
