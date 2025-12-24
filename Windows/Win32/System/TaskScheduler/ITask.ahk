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
     * This method assigns a specific application to the current task.
     * @param {PWSTR} pwszApplicationName A null-terminated string  that contains the name of the application that will be associated with the task. Use an empty string to clear the application name.
     * @returns {HRESULT} The 
     * <b>SetApplicationName</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-setapplicationname
     */
    SetApplicationName(pwszApplicationName) {
        pwszApplicationName := pwszApplicationName is String ? StrPtr(pwszApplicationName) : pwszApplicationName

        result := ComCall(32, this, "ptr", pwszApplicationName, "HRESULT")
        return result
    }

    /**
     * This method retrieves the name of the application that the task is associated with.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the name of the application the current task is associated with. After processing this name, call <b>CoTaskMemFree</b> to free resources.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-getapplicationname
     */
    GetApplicationName() {
        result := ComCall(33, this, "ptr*", &ppwszApplicationName := 0, "HRESULT")
        return ppwszApplicationName
    }

    /**
     * This method sets the command-line parameters for the task.
     * @param {PWSTR} pwszParameters A null-terminated string that contains task parameters. These parameters are passed as command-line arguments to the application the task will run. To clear the command-line parameter property, set <i>pwszParameters</i> to L"".
     * @returns {HRESULT} The 
     * <b>SetParameters</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-setparameters
     */
    SetParameters(pwszParameters) {
        pwszParameters := pwszParameters is String ? StrPtr(pwszParameters) : pwszParameters

        result := ComCall(34, this, "ptr", pwszParameters, "HRESULT")
        return result
    }

    /**
     * This method retrieves the task's command-line parameters.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the command-line parameters for the task. The method that invokes 
     * <b>GetParameters</b> is responsible for freeing this string using the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-getparameters
     */
    GetParameters() {
        result := ComCall(35, this, "ptr*", &ppwszParameters := 0, "HRESULT")
        return ppwszParameters
    }

    /**
     * This method sets the working directory for the task.
     * @param {PWSTR} pwszWorkingDirectory A null-terminated string that contains a directory path to the working directory for the task. 
     * 
     * 
     * 
     * 
     * The application starts with this directory as the current working directory. To clear the directory, set <i>pwszWorkingDirectory</i> to L"". If the working directory is set to L"", when the application is run, the current directory will be the directory in which the task scheduler service executable, Mstask.exe, resides.
     * @returns {HRESULT} The 
     * <b>SetWorkingDirectory</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-setworkingdirectory
     */
    SetWorkingDirectory(pwszWorkingDirectory) {
        pwszWorkingDirectory := pwszWorkingDirectory is String ? StrPtr(pwszWorkingDirectory) : pwszWorkingDirectory

        result := ComCall(36, this, "ptr", pwszWorkingDirectory, "HRESULT")
        return result
    }

    /**
     * This method retrieves the task'sworking directory.
     * @returns {PWSTR} A pointer to a null-terminated string that contains the task's working directory. The application that invokes 
     * <b>GetWorkingDirectory</b> is responsible for freeing this string using the <b>CoTaskMemFree</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-getworkingdirectory
     */
    GetWorkingDirectory() {
        result := ComCall(37, this, "ptr*", &ppwszWorkingDirectory := 0, "HRESULT")
        return ppwszWorkingDirectory
    }

    /**
     * This method sets the priority for the task.
     * @param {Integer} dwPriority A <b>DWORD</b> that specifies the priority for the current task. The priority of a task determines the frequency and length of the time slices for a process. This applies only to the Windows Server 2003, Windows XP, and Windows 2000 operating systems. These values are taken from the <b>CreateProcess</b> priority class and can be one of following flags (in descending order of thread scheduling priority): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>REALTIME_PRIORITY_CLASS</li>
     * <li>HIGH_PRIORITY_CLASS</li>
     * <li>NORMAL_PRIORITY_CLASS</li>
     * <li>IDLE_PRIORITY_CLASS</li>
     * </ul>
     * @returns {HRESULT} The 
     * <b>SetPriority</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-setpriority
     */
    SetPriority(dwPriority) {
        result := ComCall(38, this, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * This method retrieves the priority for the task.
     * @returns {Integer} A pointer to a <b>DWORD</b> that contains the priority for the current task. The priority value determines the frequency and length of the time slices for a process. This applies only to the Windows Server 2003, Windows XP, and Windows 2000 operating systems. It is taken from the CreateProcess priority class and can be one of the following flags (in descending order of thread scheduling priority): 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>REALTIME_PRIORITY_CLASS</li>
     * <li>HIGH_PRIORITY_CLASS</li>
     * <li>NORMAL_PRIORITY_CLASS</li>
     * <li>IDLE_PRIORITY_CLASS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-getpriority
     */
    GetPriority() {
        result := ComCall(39, this, "uint*", &pdwPriority := 0, "HRESULT")
        return pdwPriority
    }

    /**
     * This method sets the flags that modify the behavior of a scheduled task.
     * @param {Integer} dwFlags Currently, there are no flags defined for scheduled tasks.
     * @returns {HRESULT} The 
     * <b>SetTaskFlags</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-settaskflags
     */
    SetTaskFlags(dwFlags) {
        result := ComCall(40, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * This method returns the flags that modify the behavior of a task.
     * @returns {Integer} Currently, there are no defined flags for scheduled tasks.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-gettaskflags
     */
    GetTaskFlags() {
        result := ComCall(41, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * This method sets the maximum time the task can run, in milliseconds, before terminating.
     * @param {Integer} dwMaxRunTimeMS A <b>DWORD</b> value that specifies the maximum run time (in milliseconds), for the task. This parameter may be set to INFINITE to specify an unlimited time.
     * @returns {HRESULT} The 
     * <b>SetMaxRunTime</b> method returns one of the following values.
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
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-setmaxruntime
     */
    SetMaxRunTime(dwMaxRunTimeMS) {
        result := ComCall(42, this, "uint", dwMaxRunTimeMS, "HRESULT")
        return result
    }

    /**
     * This method retrieves the maximum length of time, in milliseconds, the task can run before terminating.
     * @returns {Integer} A pointer to a <b>DWORD</b> that contains the maximum run time of the current task. 
     * 
     * 
     * 
     * 
     * If the maximum run time is reached during the execution of a task, the Task Scheduler first sends a WM_CLOSE message to the associated application. If the application does not  exit within three minutes, <b>TerminateProcess</b> is run.
     * @see https://docs.microsoft.com/windows/win32/api//mstask/nf-mstask-itask-getmaxruntime
     */
    GetMaxRunTime() {
        result := ComCall(43, this, "uint*", &pdwMaxRunTimeMS := 0, "HRESULT")
        return pdwMaxRunTimeMS
    }
}
