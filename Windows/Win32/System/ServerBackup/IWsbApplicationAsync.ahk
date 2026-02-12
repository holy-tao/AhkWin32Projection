#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Defines methods to monitor and control the progress of an asynchronous operation.
 * @see https://learn.microsoft.com/windows/win32/api//content/wsbapp/nn-wsbapp-iwsbapplicationasync
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class IWsbApplicationAsync extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWsbApplicationAsync
     * @type {Guid}
     */
    static IID => Guid("{0843f6f7-895c-44a6-b0c2-05a5022aa3a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryStatus", "Abort"]

    /**
     * Queries the status of an asynchronous operation.
     * @remarks
     * Windows Server Backup calls this  method periodically to query the status of a pending asynchronous operation.
     * @returns {HRESULT} The address of an <b>HRESULT</b> value that receives the status of the current asynchronous operation. If the asynchronous operation fails, this parameter receives the failure status code. Possible values include the following.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsbapp/nf-wsbapp-iwsbapplicationasync-querystatus
     */
    QueryStatus() {
        result := ComCall(3, this, "int*", &phrResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phrResult
    }

    /**
     * Cancels an incomplete asynchronous operation.
     * @remarks
     * Windows Server Backup calls this method to cancel an asynchronous operation. For example, if the overall backup operation is canceled while an asynchronous consistency-check operation is in progress, this method will be called to cancel the consistency-check operation.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/wsbapp/nf-wsbapp-iwsbapplicationasync-abort
     */
    Abort() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
