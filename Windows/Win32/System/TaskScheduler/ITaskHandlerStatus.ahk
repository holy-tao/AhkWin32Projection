#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods that are used by COM handlers to notify the Task Scheduler about the status of the handler.
 * @remarks
 * 
 * For information on specifying a COM handler action, see the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-icomhandleraction">IComHandlerAction</a> interface.
 * 
 * For information on the required interfaces that must be implemented by the handler, see the  <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskhandler">ITaskHandler</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskhandlerstatus
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskHandlerStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskHandlerStatus
     * @type {Guid}
     */
    static IID => Guid("{eaec7a8f-27a0-4ddc-8675-14726a01a38a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateStatus", "TaskCompleted"]

    /**
     * 
     * @param {Integer} percentComplete 
     * @param {BSTR} statusMessage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandlerstatus-updatestatus
     */
    UpdateStatus(percentComplete, statusMessage) {
        statusMessage := statusMessage is String ? BSTR.Alloc(statusMessage).Value : statusMessage

        result := ComCall(3, this, "short", percentComplete, "ptr", statusMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} taskErrCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskhandlerstatus-taskcompleted
     */
    TaskCompleted(taskErrCode) {
        result := ComCall(4, this, "int", taskErrCode, "HRESULT")
        return result
    }
}
