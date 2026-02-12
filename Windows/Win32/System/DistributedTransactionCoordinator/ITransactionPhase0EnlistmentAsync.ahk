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
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/sr/enable-systemrestore
     */
    Enable() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    WaitForEnlistment() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Phase0Done() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unenlist() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the identifier (ID) for the specified transaction.
     * @returns {ITransaction} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ktmw32/nf-ktmw32-gettransactionid
     */
    GetTransaction() {
        result := ComCall(7, this, "ptr*", &ppITransaction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITransaction(ppITransaction)
    }
}
