#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IScheduledWorkItem.ahk

/**
 * Provides the methods for running tasks, getting or setting task information, and terminating tasks. It is derived from the IScheduledWorkItem interface and inherits all the methods of that interface.
 * @remarks
 * 
  * <b>ITask</b> is the primary interface of the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/t">task trigger object</a>. To create a task object, call 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-activate">ITaskScheduler::Activate</a> for existing tasks or 
  * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-newworkitem">ITaskScheduler::NewWorkItem</a> for new tasks.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-itask
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITask extends IScheduledWorkItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITask
     * @type {Guid}
     */
    static IID => Guid("{148bd524-a2ab-11ce-b11f-00aa00530503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 32

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetApplicationName", "GetApplicationName", "SetParameters", "GetParameters", "SetWorkingDirectory", "GetWorkingDirectory", "SetPriority", "GetPriority", "SetTaskFlags", "GetTaskFlags", "SetMaxRunTime", "GetMaxRunTime"]

    /**
     * 
     * @param {PWSTR} pwszApplicationName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-setapplicationname
     */
    SetApplicationName(pwszApplicationName) {
        pwszApplicationName := pwszApplicationName is String ? StrPtr(pwszApplicationName) : pwszApplicationName

        result := ComCall(32, this, "ptr", pwszApplicationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszApplicationName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-getapplicationname
     */
    GetApplicationName(ppwszApplicationName) {
        result := ComCall(33, this, "ptr", ppwszApplicationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-setparameters
     */
    SetParameters(pwszParameters) {
        pwszParameters := pwszParameters is String ? StrPtr(pwszParameters) : pwszParameters

        result := ComCall(34, this, "ptr", pwszParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-getparameters
     */
    GetParameters(ppwszParameters) {
        result := ComCall(35, this, "ptr", ppwszParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszWorkingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-setworkingdirectory
     */
    SetWorkingDirectory(pwszWorkingDirectory) {
        pwszWorkingDirectory := pwszWorkingDirectory is String ? StrPtr(pwszWorkingDirectory) : pwszWorkingDirectory

        result := ComCall(36, this, "ptr", pwszWorkingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszWorkingDirectory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-getworkingdirectory
     */
    GetWorkingDirectory(ppwszWorkingDirectory) {
        result := ComCall(37, this, "ptr", ppwszWorkingDirectory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-setpriority
     */
    SetPriority(dwPriority) {
        result := ComCall(38, this, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPriority 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-getpriority
     */
    GetPriority(pdwPriority) {
        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, pdwPriorityMarshal, pdwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-settaskflags
     */
    SetTaskFlags(dwFlags) {
        result := ComCall(40, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-gettaskflags
     */
    GetTaskFlags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxRunTimeMS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-setmaxruntime
     */
    SetMaxRunTime(dwMaxRunTimeMS) {
        result := ComCall(42, this, "uint", dwMaxRunTimeMS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwMaxRunTimeMS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itask-getmaxruntime
     */
    GetMaxRunTime(pdwMaxRunTimeMS) {
        pdwMaxRunTimeMSMarshal := pdwMaxRunTimeMS is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, pdwMaxRunTimeMSMarshal, pdwMaxRunTimeMS, "HRESULT")
        return result
    }
}
