#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWorkItems.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for scheduling tasks.
 * @see https://learn.microsoft.com/windows/win32/api/mstask/nn-mstask-itaskscheduler
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
     * @remarks
     * For a Windows Server 2003, Windows XP computer to create, monitor, or control tasks on a Windows Vista computer, the following operations should be completed on the Windows Vista computer, and the user who is calling the <b>ITaskScheduler::SetTargetComputer</b> method must be a member of the Administrators group on the remote Windows Vista  computer.<p class="proch"><b>Enable the "Share File and Printers" exception in Windows Firewall</b>
     * 
     * <ol>
     * <li>Click Start, and then click Control Panel.</li>
     * <li>In Control Panel, click <b>Classic View</b> and then double-click the <b>Windows Firewall </b> icon.</li>
     * <li>In the Windows Firewall window, click the <b>Exceptions</b> tab and select <b>File and Printer Sharing exception</b> check box.</li>
     * </ol>
     * <p class="proch"><b>Enable the "Remote Registry" service</b>
     * 
     * <ul>
     * <li>Open a Command Prompt window and enter the following command: <b>net start "Remote Registry"</b></li>
     * </ul>
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-settargetcomputer
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-gettargetcomputer
     */
    GetTargetComputer() {
        result := ComCall(4, this, "ptr*", &ppwszComputer := 0, "HRESULT")
        return ppwszComputer
    }

    /**
     * The Enum method retrieves a pointer to an OLE enumerator object that enumerates the tasks in the current task folder.
     * @remarks
     * By default, the current folder resides on the local computer. For remote computers, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-gettargetcomputer">ITaskScheduler::GetTargetComputer</a> and use the name returned by this call. To change the target computer call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-settargetcomputer">ITaskScheduler::SetTargetComputer</a>.
     * 
     * 
     * <table>
     * <tr>
     * <th>For a complete example of</th>
     * <th>See</th>
     * </tr>
     * <tr>
     * <td>Using 
     * <b>Enum</b> to retrieve the task names on the local computer</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/enumerating-tasks-example">Enumerating Tasks Example</a>
     * </td>
     * </tr>
     * </table>
     * @returns {IEnumWorkItems} A pointer to a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-ienumworkitems">IEnumWorkItems</a> interface. This interface contains the enumeration context of the current task(s).
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-enum
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-activate
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-delete
     */
    Delete(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * The NewWorkItem method creates a new work item, allocating space for the work item and retrieving its address.
     * @remarks
     * This method handles memory allocation automatically when creating the new work item.
     * 
     * To save the work item to disk, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> . This COM interface is supported by all work item interfaces (currently 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a> is the only supported work item interface).
     * 
     * Task scheduler provides two methods for adding work items: 
     * <b>NewWorkItem</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-addworkitem">AddWorkItem</a>. Of these methods, each has its specific advantage. 
     * <b>AddWorkItem</b> prevents naming collisions, but also requires two disk write operations per call. One write operation is performed when the call to 
     * <b>AddWorkItem</b> creates an empty work item object on the disk, followed by another write operation when <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> is called.
     * 
     * You can create a task by calling <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-addworkitem">AddWorkItem</a> or <b>NewWorkItem</b>. When use <b>AddWorkItem</b>, it is your responsibility to create an instance of the Task object (which supports the <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a> interface) and then add the task with the name you supply.
     * 
     * 
     * 
     * <b>NewWorkItem</b> does not prevent naming collisions, but requires only one disk write operation when <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersistfile-save">IPersistFile::Save</a> is called. Although 
     * <b>NewWorkItem</b> is more efficient with respect to disk write operations, the application runs the risk of having another application create a work item with the same name before the call to <b>IPersistFile::Save</b> is made.
     * 
     * 
     * <table>
     * <tr>
     * <th>For a complete example of</th>
     * <th>See</th>
     * </tr>
     * <tr>
     * <td>Creating a new task</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/creating-a-task-using-newworkitem-example">Creating a Task Using NewWorkItem Example</a>
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszTaskName A null-terminated string that specifies the name of the new work item. This name must conform to Windows NT file-naming conventions, but cannot include backslashes because nesting within the task folder object is not allowed.
     * @param {Pointer<Guid>} rclsid The class identifier of the work item to be created. The only class supported at this time, the task class, has the identifier CLSID_Ctask.
     * @param {Pointer<Guid>} riid The reference identifier of the interface being requested. The only interface supported at this time, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a>, has the identifier IID_ITask.
     * @returns {IUnknown} A pointer to an interface pointer that receives the requested interface. See Remarks for information on saving the work item to disk.
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-newworkitem
     */
    NewWorkItem(pwszTaskName, rclsid, riid) {
        pwszTaskName := pwszTaskName is String ? StrPtr(pwszTaskName) : pwszTaskName

        result := ComCall(8, this, "ptr", pwszTaskName, "ptr", rclsid, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * The AddWorkItem method adds a task to the schedule of tasks.
     * @remarks
     * Task scheduler provides two methods for adding work items: 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-newworkitem">NewWorkItem</a> and 
     * <b>AddWorkItem</b>. Of these methods, each has its specific advantage. 
     * <b>AddWorkItem</b> prevents naming collisions, but it also requires two disk write operations per call. One write operation is performed when the call to 
     * <b>AddWorkItem</b> creates an empty work item object on the disk, followed by another write operation when <b>IPersistFile::Save</b> is called.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nf-mstask-itaskscheduler-newworkitem">NewWorkItem</a> does not prevent naming collisions, but it requires only one disk write operation when <b>IPersistFile::Save</b> is called. Although 
     * <b>NewWorkItem</b> is more efficient with disk write operations, the application runs the risk of having another application create a work item with the same name before the call to <b>IPersistFile::Save</b> is made.
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-addworkitem
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
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-itaskscheduler-isoftype
     */
    IsOfType(pwszName, riid) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "ptr", pwszName, "ptr", riid, "HRESULT")
        return result
    }
}
