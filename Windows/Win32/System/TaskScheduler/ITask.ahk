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
     * 
     * @param {PWSTR} pwszApplicationName 
     * @returns {HRESULT} 
     */
    SetApplicationName(pwszApplicationName) {
        pwszApplicationName := pwszApplicationName is String ? StrPtr(pwszApplicationName) : pwszApplicationName

        result := ComCall(32, this, "ptr", pwszApplicationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszApplicationName 
     * @returns {HRESULT} 
     */
    GetApplicationName(ppwszApplicationName) {
        result := ComCall(33, this, "ptr", ppwszApplicationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszParameters 
     * @returns {HRESULT} 
     */
    SetParameters(pwszParameters) {
        pwszParameters := pwszParameters is String ? StrPtr(pwszParameters) : pwszParameters

        result := ComCall(34, this, "ptr", pwszParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszParameters 
     * @returns {HRESULT} 
     */
    GetParameters(ppwszParameters) {
        result := ComCall(35, this, "ptr", ppwszParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszWorkingDirectory 
     * @returns {HRESULT} 
     */
    SetWorkingDirectory(pwszWorkingDirectory) {
        pwszWorkingDirectory := pwszWorkingDirectory is String ? StrPtr(pwszWorkingDirectory) : pwszWorkingDirectory

        result := ComCall(36, this, "ptr", pwszWorkingDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszWorkingDirectory 
     * @returns {HRESULT} 
     */
    GetWorkingDirectory(ppwszWorkingDirectory) {
        result := ComCall(37, this, "ptr", ppwszWorkingDirectory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     */
    SetPriority(dwPriority) {
        result := ComCall(38, this, "uint", dwPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPriority 
     * @returns {HRESULT} 
     */
    GetPriority(pdwPriority) {
        result := ComCall(39, this, "uint*", pdwPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetTaskFlags(dwFlags) {
        result := ComCall(40, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetTaskFlags(pdwFlags) {
        result := ComCall(41, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxRunTimeMS 
     * @returns {HRESULT} 
     */
    SetMaxRunTime(dwMaxRunTimeMS) {
        result := ComCall(42, this, "uint", dwMaxRunTimeMS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxRunTimeMS 
     * @returns {HRESULT} 
     */
    GetMaxRunTime(pdwMaxRunTimeMS) {
        result := ComCall(43, this, "uint*", pdwMaxRunTimeMS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
