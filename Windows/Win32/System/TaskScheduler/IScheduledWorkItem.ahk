#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskTrigger.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for managing specific work items.
 * @remarks
 * 
 * The <b>IScheduledWorkItem</b> interface is the base interface for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a> interface. All methods provided by 
 * <b>IScheduledWorkItem</b> are inherited by the 
 * <b>ITask</b> interface and are typically called through that interface.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-ischeduledworkitem
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IScheduledWorkItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScheduledWorkItem
     * @type {Guid}
     */
    static IID => Guid("{a6b952f0-a4b1-11d0-997d-00aa006887ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTrigger", "DeleteTrigger", "GetTriggerCount", "GetTrigger", "GetTriggerString", "GetRunTimes", "GetNextRunTime", "SetIdleWait", "GetIdleWait", "Run", "Terminate", "EditWorkItem", "GetMostRecentRunTime", "GetStatus", "GetExitCode", "SetComment", "GetComment", "SetCreator", "GetCreator", "SetWorkItemData", "GetWorkItemData", "SetErrorRetryCount", "GetErrorRetryCount", "SetErrorRetryInterval", "GetErrorRetryInterval", "SetFlags", "GetFlags", "SetAccountInformation", "GetAccountInformation"]

    /**
     * Creates a trigger for the work item.
     * @param {Pointer<Integer>} piNewTrigger A pointer to the returned trigger index value of the new trigger. The trigger index for the first trigger associated with a work item is "0". See Remarks for other uses of the trigger index.
     * @param {Pointer<ITaskTrigger>} ppTrigger A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itasktrigger">ITaskTrigger</a> interface. Currently, the only supported work items are <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/t">tasks</a>.
     * @returns {HRESULT} The 
     * <b>CreateTrigger</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-createtrigger
     */
    CreateTrigger(piNewTrigger, ppTrigger) {
        piNewTriggerMarshal := piNewTrigger is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, piNewTriggerMarshal, piNewTrigger, "ptr*", ppTrigger, "HRESULT")
        return result
    }

    /**
     * Deletes a trigger from a work item.
     * @param {Integer} iTrigger A trigger index value that specifies the trigger to be deleted. For more information, see Remarks.
     * @returns {HRESULT} The 
     * <b>DeleteTrigger</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-deletetrigger
     */
    DeleteTrigger(iTrigger) {
        result := ComCall(4, this, "ushort", iTrigger, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of triggers for the current work item.
     * @returns {Integer} A pointer to a <b>WORD</b> that will contain the number of triggers associated with the work item.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-gettriggercount
     */
    GetTriggerCount() {
        result := ComCall(5, this, "ushort*", &pwCount := 0, "HRESULT")
        return pwCount
    }

    /**
     * Retrieves a task trigger.
     * @param {Integer} iTrigger The index of the trigger to retrieve.
     * @returns {ITaskTrigger} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itasktrigger">ITaskTrigger</a> interface for the retrieved trigger.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-gettrigger
     */
    GetTrigger(iTrigger) {
        result := ComCall(6, this, "ushort", iTrigger, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITaskTrigger(ppTrigger)
    }

    /**
     * Retrieves a string that describes the work item trigger.
     * @param {Integer} iTrigger The index of the trigger to be retrieved. The first trigger is always referenced by 0. For more information, see Remarks.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the retrieved trigger description. Note that this string must be release by a call to <b>CoTaskMemFree</b> after the string is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-gettriggerstring
     */
    GetTriggerString(iTrigger) {
        result := ComCall(7, this, "ushort", iTrigger, "ptr*", &ppwszTrigger := 0, "HRESULT")
        return ppwszTrigger
    }

    /**
     * Retrieves the work item run times for a specified time period.
     * @param {Pointer<SYSTEMTIME>} pstBegin A pointer to a <b>SYSTEMTIME</b> structure that contains the starting time of the time period to check. This value is inclusive.
     * @param {Pointer<SYSTEMTIME>} pstEnd A pointer to a <b>SYSTEMTIME</b> structure that contains the ending time of the time period to check. This value is exclusive. If <b>NULL</b> is passed for this value, the end time is infinite.
     * @param {Pointer<Integer>} pCount A pointer to a <b>WORD</b> value that specifies the number of run times to retrieve. 
     * 
     * 
     * 
     * 
     * On input, this parameter contains the number of run times being requested. This can be a number of between 1 and TASK_MAX_RUN_TIMES.
     * 
     * On output, this parameter contains the number of run times retrieved.
     * @returns {Pointer<SYSTEMTIME>} A pointer to an array of <b>SYSTEMTIME</b> structures. A <b>NULL</b> LPSYSTEMTIME object should be passed into this parameter. On return, this array contains <i>pCount</i> run times. You must free this array by a calling the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getruntimes
     */
    GetRunTimes(pstBegin, pstEnd, pCount) {
        pCountMarshal := pCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pstBegin, "ptr", pstEnd, pCountMarshal, pCount, "ptr*", &rgstTaskTimes := 0, "HRESULT")
        return rgstTaskTimes
    }

    /**
     * Retrieves the next time the work item will run.
     * @param {Pointer<SYSTEMTIME>} pstNextRun A pointer to a <b>SYSTEMTIME</b> structure that contains the next time the work item will run.
     * @returns {HRESULT} The 
     * <b>GetNextRunTime</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_S_TASK_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The task will not run at the scheduled times because it has been disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getnextruntime
     */
    GetNextRunTime(pstNextRun) {
        result := ComCall(9, this, "ptr", pstNextRun, "HRESULT")
        return result
    }

    /**
     * Sets the minutes that the system must be idle before the work item can run.
     * @param {Integer} wIdleMinutes A value that specifies how long, in minutes, the system must remain idle before the work item can run.
     * @param {Integer} wDeadlineMinutes A value that specifies the maximum number of minutes that the Task Scheduler will wait for the idle-time period returned in <i>pwIdleMinutes</i>.
     * @returns {HRESULT} The 
     * <b>SetIdleWait</b> method returns S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setidlewait
     */
    SetIdleWait(wIdleMinutes, wDeadlineMinutes) {
        result := ComCall(10, this, "ushort", wIdleMinutes, "ushort", wDeadlineMinutes, "HRESULT")
        return result
    }

    /**
     * Retrieves the idle wait time for the work item.
     * @param {Pointer<Integer>} pwIdleMinutes A pointer to a <b>WORD</b> that contains the idle wait time for the current work item, in minutes.
     * @param {Pointer<Integer>} pwDeadlineMinutes A pointer to a <b>WORD</b> that specifies the maximum number of minutes that the Task Scheduler will wait for the idle-time period returned in <i>pwIdleMinutes</i>.
     * @returns {HRESULT} The 
     * <b>GetIdleWait</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getidlewait
     */
    GetIdleWait(pwIdleMinutes, pwDeadlineMinutes) {
        pwIdleMinutesMarshal := pwIdleMinutes is VarRef ? "ushort*" : "ptr"
        pwDeadlineMinutesMarshal := pwDeadlineMinutes is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pwIdleMinutesMarshal, pwIdleMinutes, pwDeadlineMinutesMarshal, pwDeadlineMinutes, "HRESULT")
        return result
    }

    /**
     * Sends a request to the Task Scheduler service to run the work item.
     * @returns {HRESULT} The 
     * <b>Run</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. The request was sent. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-run
     */
    Run() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * This method ends the execution of the work item.
     * @returns {HRESULT} The 
     * <b>Terminate</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-terminate
     */
    Terminate() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * Displays the Task, Schedule, and settings property pages for the work item, allowing a user set the properties on those pages.
     * @param {HWND} hParent Reserved for future use. Set this parameter to <b>NULL</b>.
     * @param {Integer} dwReserved Reserved for internal use; this parameter must be set to zero.
     * @returns {HRESULT} The 
     * <b>EditWorkItem</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_NOTFILEBASEDSTORAGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The work item object is not persistent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-editworkitem
     */
    EditWorkItem(hParent, dwReserved) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(14, this, "ptr", hParent, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * Retrieves the most recent time the work item began running.
     * @returns {SYSTEMTIME} A pointer to a <b>SYSTEMTIME</b> structure that contains the most recent time the current work item ran.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getmostrecentruntime
     */
    GetMostRecentRunTime() {
        pstLastRun := SYSTEMTIME()
        result := ComCall(15, this, "ptr", pstLastRun, "HRESULT")
        return pstLastRun
    }

    /**
     * Retrieves the status of the work item.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getstatus
     */
    GetStatus() {
        result := ComCall(16, this, "int*", &phrStatus := 0, "HRESULT")
        return phrStatus
    }

    /**
     * Retrieves the last exit code returned by the executable associated with the work item on its last run. The method also returns the exit code returned to Task Scheduler when it last attempted to run the work item.
     * @returns {Integer} A pointer to a <b>DWORD</b> value that is set to the last exit code for the work item. This is the exit code that the work item returned when it last stopped running. If the work item has never been started, 0 is returned.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getexitcode
     */
    GetExitCode() {
        result := ComCall(17, this, "uint*", &pdwExitCode := 0, "HRESULT")
        return pdwExitCode
    }

    /**
     * Sets the comment for the work item.
     * @param {PWSTR} pwszComment A null-terminated string that specifies the comment for the current work item.
     * @returns {HRESULT} The 
     * <b>SetComment</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setcomment
     */
    SetComment(pwszComment) {
        pwszComment := pwszComment is String ? StrPtr(pwszComment) : pwszComment

        result := ComCall(18, this, "ptr", pwszComment, "HRESULT")
        return result
    }

    /**
     * Retrieves the comment for the work item.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the retrieved comment for the current work item.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getcomment
     */
    GetComment() {
        result := ComCall(19, this, "ptr*", &ppwszComment := 0, "HRESULT")
        return ppwszComment
    }

    /**
     * Sets the name of the work item's creator.
     * @param {PWSTR} pwszCreator A null-terminated string that contains the name of the work item's creator.
     * @returns {HRESULT} The 
     * <b>SetCreator</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setcreator
     */
    SetCreator(pwszCreator) {
        pwszCreator := pwszCreator is String ? StrPtr(pwszCreator) : pwszCreator

        result := ComCall(20, this, "ptr", pwszCreator, "HRESULT")
        return result
    }

    /**
     * Retrieves the name of the creator of the work item.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the name of the creator of the current work item. The application that invokes 
     * <b>GetCreator</b> is responsible for freeing this string using the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getcreator
     */
    GetCreator() {
        result := ComCall(21, this, "ptr*", &ppwszCreator := 0, "HRESULT")
        return ppwszCreator
    }

    /**
     * This method stores application-defined data associated with the work item.
     * @param {Integer} cbData The number of bytes in the data buffer. The caller allocates and frees this memory.
     * @param {Pointer<Integer>} rgbData The data to copy.
     * @returns {HRESULT} The 
     * <b>SetWorkItemData</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setworkitemdata
     */
    SetWorkItemData(cbData, rgbData) {
        rgbDataMarshal := rgbData is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, "ushort", cbData, rgbDataMarshal, rgbData, "HRESULT")
        return result
    }

    /**
     * Retrieves application-defined data associated with the work item.
     * @param {Pointer<Integer>} pcbData A pointer to the number of bytes copied.
     * @param {Pointer<Pointer<Integer>>} prgbData A pointer to a pointer to a BYTE that contains user-defined data for the current work item. The method that invokes 
     * <b>GetWorkItemData</b> is responsible for freeing this memory by using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @returns {HRESULT} The 
     * <b>GetWorkItemData</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getworkitemdata
     */
    GetWorkItemData(pcbData, prgbData) {
        pcbDataMarshal := pcbData is VarRef ? "ushort*" : "ptr"
        prgbDataMarshal := prgbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, pcbDataMarshal, pcbData, prgbDataMarshal, prgbData, "HRESULT")
        return result
    }

    /**
     * Sets the number of times Task Scheduler will try to run the work item again if an error occurs. This method is not implemented.
     * @param {Integer} wRetryCount A value that specifies the number of error retries for the current work item.
     * @returns {HRESULT} The 
     * <b>SetErrorRetryCount</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-seterrorretrycount
     */
    SetErrorRetryCount(wRetryCount) {
        result := ComCall(24, this, "ushort", wRetryCount, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of times that the Task Scheduler will retry an operation when an error occurs. This method is not implemented.
     * @returns {Integer} A pointer to a <b>WORD</b> that contains the number of times to retry.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-geterrorretrycount
     */
    GetErrorRetryCount() {
        result := ComCall(25, this, "ushort*", &pwRetryCount := 0, "HRESULT")
        return pwRetryCount
    }

    /**
     * Sets the time interval, in minutes, between Task Scheduler's attempts to run a work item after an error occurs. This method is not implemented.
     * @param {Integer} wRetryInterval A value that specifies the interval between error retries for the current work item, in minutes.
     * @returns {HRESULT} The 
     * <b>SetErrorRetryInterval</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-seterrorretryinterval
     */
    SetErrorRetryInterval(wRetryInterval) {
        result := ComCall(26, this, "ushort", wRetryInterval, "HRESULT")
        return result
    }

    /**
     * Retrieves the time interval, in minutes, between Task Scheduler's attempts to run a work item if an error occurs. This method is not implemented.
     * @returns {Integer} A pointer to a <b>WORD</b> value that contains the time interval between retries of the current work item.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-geterrorretryinterval
     */
    GetErrorRetryInterval() {
        result := ComCall(27, this, "ushort*", &pwRetryInterval := 0, "HRESULT")
        return pwRetryInterval
    }

    /**
     * Sets the flags that modify the behavior of any type of work item.
     * @param {Integer} dwFlags A value that specifies a combination of one or more of the following flags:
     * @returns {HRESULT} The 
     * <b>SetFlags</b> method returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(28, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the flags that modify the behavior of any type of work item.
     * @returns {Integer} A pointer to a <b>DWORD</b> that contains the flags for the work item. For a list of these flags, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setflags">SetFlags</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getflags
     */
    GetFlags() {
        result := ComCall(29, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the account name and password used to run the work item.
     * @param {PWSTR} pwszAccountName A string that contains the <b>null</b>-terminated name of the user account in which the work item will run. To specify the local system account, use the empty string, L"". Do not use any other string to specify the local system account. For more information, see Remarks.
     * @param {PWSTR} pwszPassword A string that contains the password for the account specified in <i>pwszAccountName</i>. 
     * 
     * 
     * 
     * 
     * Set this parameter to <b>NULL</b> if the local system account is specified. If you set the TASK_FLAG_RUN_ONLY_IF_LOGGED_ON flag, you may also set <i>pwszPassword</i> to <b>NULL</b> for local or domain user accounts. Use the <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-ischeduledworkitem-setflags">IScheduledWorkItem::SetFlags</a> method to set the flag.
     * 
     * Task Scheduler stores account information only once for all tasks that use the same account. If the account password is updated for one task, then all tasks using that same account will use the updated password.
     * 
     * When you have finished using the password, clear the password information by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting passwords, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @returns {HRESULT} The 
     * <b>SetAccountInformation</b> method returns one of the following values. Note that errors from this call may also be returned by the subsequent call to <a href="/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have permission to perform the operation. For more information, see Remarks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The arguments are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_NO_SECURITY_SERVICES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Security services are available only on the Windows Server 2003, Windows XP, and Windows 2000.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_UNSUPPORTED_ACCOUNT_OPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszPassword</i> parameter was set to <b>NULL</b>, but the TASK_FLAG_RUN_ONLY_IF_LOGGED_ON flag was not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b> SCHED_E_ACCOUNT_INFORMATION_NOT_SET </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pwszPassword</i> parameter was incorrect.  In the Windows Server 2003, Task Scheduler validates the password at the time the job is created (during a call to <a href="/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a>). Be aware that if this error occurs, the job file will still be created.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-setaccountinformation
     */
    SetAccountInformation(pwszAccountName, pwszPassword) {
        pwszAccountName := pwszAccountName is String ? StrPtr(pwszAccountName) : pwszAccountName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(30, this, "ptr", pwszAccountName, "ptr", pwszPassword, "HRESULT")
        return result
    }

    /**
     * Retrieves the account name for the work item.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the account name for the current work item. The empty string, L"", is returned for the local system account. 
     * 
     * 
     * 
     * 
     * After processing the account name, be sure to call <b>CoTaskMemFree</b> to free the string.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-ischeduledworkitem-getaccountinformation
     */
    GetAccountInformation() {
        result := ComCall(31, this, "ptr*", &ppwszAccountName := 0, "HRESULT")
        return ppwszAccountName
    }
}
