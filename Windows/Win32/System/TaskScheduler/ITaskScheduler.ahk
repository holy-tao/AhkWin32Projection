#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWorkItems.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for scheduling tasks.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-itaskscheduler
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskScheduler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskScheduler
     * @type {Guid}
     */
    static IID => Guid("{148bd527-a2ab-11ce-b11f-00aa00530503}")

    /**
     * The class identifier for TaskScheduler
     * @type {Guid}
     */
    static CLSID => Guid("{0f87369f-a4e5-4cfc-bd3e-73e6154572dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTargetComputer", "GetTargetComputer", "Enum", "Activate", "Delete", "NewWorkItem", "AddWorkItem", "IsOfType"]

    /**
     * The SetTargetComputer method selects the computer that the ITaskScheduler interface operates on, allowing remote task management and enumeration.
     * @param {PWSTR} pwszComputer A pointer to a <b>null</b>-terminated wide character string that specifies the target computer name for the current instance of the 
     * <b>ITaskScheduler</b> interface. Specify the target computer name in the Universal Naming Convention (UNC) format. To indicate the local computer, set this value to <b>NULL</b> or to the local computer's UNC name.
     * 
     * <div class="alert"><b>Note</b>  When specifying a remote computer name, use two backslash (\\) characters before the computer name. For example, use "\\ComputerName" instead of "ComputerName".</div>
     * <div> </div>
     * @returns {HRESULT} The 
     * <b>SetTargetComputer</b> method returns one of the following values.
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
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_SERVICE_NOT_INSTALLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Task Scheduler service is not installed on the target computer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have access to the remote computer.
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
     * The <i>pwszComputer</i> parameter is not valid.
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
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-settargetcomputer
     */
    SetTargetComputer(pwszComputer) {
        pwszComputer := pwszComputer is String ? StrPtr(pwszComputer) : pwszComputer

        result := ComCall(3, this, "ptr", pwszComputer, "HRESULT")
        return result
    }

    /**
     * The GetTargetComputer method returns the name of the computer on which ITaskScheduler is currently targeted.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the name of the target computer for the current task. This string is allocated by the application that invokes 
     * <b>GetTargetComputer</b>, and must also be freed using <b>CoTaskMemFree</b>.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-gettargetcomputer
     */
    GetTargetComputer() {
        result := ComCall(4, this, "ptr*", &ppwszComputer := 0, "HRESULT")
        return ppwszComputer
    }

    /**
     * The Enum method retrieves a pointer to an OLE enumerator object that enumerates the tasks in the current task folder.
     * @returns {IEnumWorkItems} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface. This interface contains the enumeration context of the current task(s).
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-enum
     */
    Enum() {
        result := ComCall(5, this, "ptr*", &ppEnumWorkItems := 0, "HRESULT")
        return IEnumWorkItems(ppEnumWorkItems)
    }

    /**
     * The Activate method returns an active interface for a specified work item.
     * @param {PWSTR} pwszName A null-terminated string that specifies the name of the work item to activate.
     * @param {Pointer<Guid>} riid An identifier that identifies the interface being requested. The only interface supported at this time, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a>, has the identifier IID_ITask.
     * @returns {IUnknown} A pointer to an interface pointer that receives the address of the requested interface.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-activate
     */
    Activate(pwszName, riid) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The Delete method deletes a task.
     * @param {PWSTR} pwszName A null-terminated string that specifies the name of the task to delete.
     * @returns {HRESULT} The 
     * <b>Delete</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-delete
     */
    Delete(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * The NewWorkItem method creates a new work item, allocating space for the work item and retrieving its address.
     * @param {PWSTR} pwszTaskName A null-terminated string that specifies the name of the new work item. This name must conform to Windows NT file-naming conventions, but cannot include backslashes because nesting within the task folder object is not allowed.
     * @param {Pointer<Guid>} rclsid The class identifier of the work item to be created. The only class supported at this time, the task class, has the identifier CLSID_Ctask.
     * @param {Pointer<Guid>} riid The reference identifier of the interface being requested. The only interface supported at this time, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a>, has the identifier IID_ITask.
     * @returns {IUnknown} A pointer to an interface pointer that receives the requested interface. See Remarks for information on saving the work item to disk.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-newworkitem
     */
    NewWorkItem(pwszTaskName, rclsid, riid) {
        pwszTaskName := pwszTaskName is String ? StrPtr(pwszTaskName) : pwszTaskName

        result := ComCall(8, this, "ptr", pwszTaskName, "ptr", rclsid, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The AddWorkItem method adds a task to the schedule of tasks.
     * @param {PWSTR} pwszTaskName A null-terminated string that specifies the name of the task to add. The task name must conform to Windows NT file-naming conventions, but cannot include backslashes because nesting within the task folder object is not allowed.
     * @param {IScheduledWorkItem} pWorkItem A pointer to the task to add to the schedule.
     * @returns {HRESULT} The 
     * <b>AddWorkItem</b> method returns one of the following values.
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
     * <dt><b>ERROR_FILE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A task with the specified name already exists. The actual return value is HRESULT_FROM_WIN32(ERROR_FILE_EXISTS).
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
     * One or more of the arguments is not valid.
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
     * Not enough memory is available to complete the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-addworkitem
     */
    AddWorkItem(pwszTaskName, pWorkItem) {
        pwszTaskName := pwszTaskName is String ? StrPtr(pwszTaskName) : pwszTaskName

        result := ComCall(9, this, "ptr", pwszTaskName, "ptr", pWorkItem, "HRESULT")
        return result
    }

    /**
     * The IsOfType method checks the object's type to verify that it supports a particular interface.
     * @param {PWSTR} pwszName A null-terminated string that contains the name of the object to check.
     * @param {Pointer<Guid>} riid The reference identifier of the interface to be matched.
     * @returns {HRESULT} The 
     * <b>IsOfType</b> method returns S_OK if the object named by <i>pwszName</i> supports the interface specified in <i>riid</i>. Otherwise,  S_FALSE is returned.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itaskscheduler-isoftype
     */
    IsOfType(pwszName, riid) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "ptr", pwszName, "ptr", riid, "HRESULT")
        return result
    }
}
