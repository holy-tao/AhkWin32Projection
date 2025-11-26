#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITaskFolder.ahk
#Include .\IRunningTaskCollection.ahk
#Include .\ITaskDefinition.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Provides access to the Task Scheduler service for managing registered tasks.
 * @see https://docs.microsoft.com/windows/win32/api//taskschd/nn-taskschd-itaskservice
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class ITaskService extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITaskService
     * @type {Guid}
     */
    static IID => Guid("{2faba4c7-4da9-4013-9697-20cc3fd40f85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFolder", "GetRunningTasks", "NewTask", "Connect", "get_Connected", "get_TargetServer", "get_ConnectedUser", "get_ConnectedDomain", "get_HighestVersion"]

    /**
     * @type {VARIANT_BOOL} 
     */
    Connected {
        get => this.get_Connected()
    }

    /**
     * @type {BSTR} 
     */
    TargetServer {
        get => this.get_TargetServer()
    }

    /**
     * @type {BSTR} 
     */
    ConnectedUser {
        get => this.get_ConnectedUser()
    }

    /**
     * @type {BSTR} 
     */
    ConnectedDomain {
        get => this.get_ConnectedDomain()
    }

    /**
     * @type {Integer} 
     */
    HighestVersion {
        get => this.get_HighestVersion()
    }

    /**
     * Gets a folder of registered tasks.
     * @param {BSTR} path The path to the folder to retrieve. Do not use a backslash following the last folder name in the path. The root task folder is specified with a backslash (\\). An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @returns {ITaskFolder} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface for the requested folder.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-getfolder
     */
    GetFolder(path) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(7, this, "ptr", path, "ptr*", &ppFolder := 0, "HRESULT")
        return ITaskFolder(ppFolder)
    }

    /**
     * Gets a collection of running tasks.
     * @param {Integer} flags A value from the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_enum_flags">TASK_ENUM_FLAGS</a> enumeration. Pass in 0 to return a collection of running tasks that are not hidden tasks.
     * @returns {IRunningTaskCollection} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface that contains the currently running tasks.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-getrunningtasks
     */
    GetRunningTasks(flags) {
        result := ComCall(8, this, "int", flags, "ptr*", &ppRunningTasks := 0, "HRESULT")
        return IRunningTaskCollection(ppRunningTasks)
    }

    /**
     * Returns an empty task definition object to be filled in with settings and properties and then registered using the ITaskFolder::RegisterTaskDefinition method.
     * @param {Integer} flags This parameter is reserved for future use and must be set to 0.
     * @returns {ITaskDefinition} The task definition that specifies all the information required to create a new task.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskdefinition">ITaskDefinition</a> interface pointer. Referencing a non-NULL pointer can cause a memory leak because the pointer will be overwritten.
     * 
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskdefinition">ITaskDefinition</a> pointer must be released after it is used.
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-newtask
     */
    NewTask(flags) {
        result := ComCall(9, this, "uint", flags, "ptr*", &ppDefinition := 0, "HRESULT")
        return ITaskDefinition(ppDefinition)
    }

    /**
     * Connects to a remote computer and associates all subsequent calls on this interface with a remote session.
     * @param {VARIANT} serverName The name of the computer that you want to connect to. If the <i>serverName</i> parameter is empty, then this method will execute on the local computer.
     * @param {VARIANT} user The user name that is used during the connection to the computer. If the <i>user</i> is not specified, then the current token is used.
     * @param {VARIANT} domain The domain of the user specified in the <i>user</i> parameter.
     * @param {VARIANT} password The password that is used to connect to the computer. If the user name and password are not specified, then the current token is used.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESS_DENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied to connect to the Task Scheduler service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SCHED_E_SERVICE_NOT_RUNNING</b></dt>
     * <dt>0x80041315</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Task Scheduler service is not running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * <dt>0x8007000e</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application does not have enough memory to complete the operation or the <i>user</i>, <i>password</i>, or <i>domain</i> has at least one null and one non-null value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NETPATH</b></dt>
     * <dt>53</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned in the following situations:
     * 
     * <ul>
     * <li>The computer name specified in the <i>serverName</i> parameter does not exist.</li>
     * <li>When you are trying to connect to a Windows Server 2003 or Windows XP computer, and the remote computer does not have the File and Printer Sharing firewall exception enabled or the Remote Registry service is not running.</li>
     * <li>When you are trying to connect to a Windows Vista computer, and the remote computer does not have the Remote Scheduled Tasks Management firewall exception enabled and the File and Printer Sharing firewall exception enabled, or the Remote Registry service is not running.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * <dt>50</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>user</i>, <i>password</i>, or <i>domain</i> parameters cannot be specified when connecting to a remote Windows XP or Windows Server 2003 computer from a Windows Vista computer.
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-connect
     */
    Connect(serverName, user, domain, password) {
        result := ComCall(10, this, "ptr", serverName, "ptr", user, "ptr", domain, "ptr", password, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates if you are connected to the Task Scheduler service.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-get_connected
     */
    get_Connected() {
        result := ComCall(11, this, "short*", &pConnected := 0, "HRESULT")
        return pConnected
    }

    /**
     * Gets the name of the computer that is running the Task Scheduler service that the user is connected to.
     * @remarks
     * 
     * This property returns an empty string when the user passes an IP address, Localhost, or  '.' into the <i>pServer</i> parameter, and it returns the name of the computer that is running the Task Scheduler service when the user does not pass any parameter value.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-get_targetserver
     */
    get_TargetServer() {
        pServer := BSTR()
        result := ComCall(12, this, "ptr", pServer, "HRESULT")
        return pServer
    }

    /**
     * Gets the name of the user that is connected to the Task Scheduler service.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-get_connecteduser
     */
    get_ConnectedUser() {
        pUser := BSTR()
        result := ComCall(13, this, "ptr", pUser, "HRESULT")
        return pUser
    }

    /**
     * Gets the name of the domain to which the TargetServer computer is connected.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-get_connecteddomain
     */
    get_ConnectedDomain() {
        pDomain := BSTR()
        result := ComCall(14, this, "ptr", pDomain, "HRESULT")
        return pDomain
    }

    /**
     * Indicates the highest version of Task Scheduler that a computer supports.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//taskschd/nf-taskschd-itaskservice-get_highestversion
     */
    get_HighestVersion() {
        result := ComCall(15, this, "uint*", &pVersion := 0, "HRESULT")
        return pVersion
    }
}
