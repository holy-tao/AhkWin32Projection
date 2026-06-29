#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITaskFolder.ahk" { ITaskFolder }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\ITaskDefinition.ahk" { ITaskDefinition }
#Import ".\IRunningTaskCollection.ahk" { IRunningTaskCollection }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides access to the Task Scheduler service for managing registered tasks.
 * @see https://learn.microsoft.com/windows/win32/api/taskschd/nn-taskschd-itaskservice
 * @namespace Windows.Win32.System.TaskScheduler
 */
export default struct ITaskService extends IDispatch {
    /**
     * The interface identifier for ITaskService
     * @type {Guid}
     */
    static IID := Guid("{2faba4c7-4da9-4013-9697-20cc3fd40f85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITaskService interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetFolder           : IntPtr
        GetRunningTasks     : IntPtr
        NewTask             : IntPtr
        Connect             : IntPtr
        get_Connected       : IntPtr
        get_TargetServer    : IntPtr
        get_ConnectedUser   : IntPtr
        get_ConnectedDomain : IntPtr
        get_HighestVersion  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITaskService.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {BSTR} _path The path to the folder to retrieve. Do not use a backslash following the last folder name in the path. The root task folder is specified with a backslash (\\). An example of a task folder path, under the root task folder,
     *  is \MyTaskFolder. The '.' character  cannot be used to specify the current task folder  and the '..' characters cannot be used to specify the parent task folder in the path.
     * @returns {ITaskFolder} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface for the requested folder.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskfolder">ITaskFolder</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-getfolder
     */
    GetFolder(_path) {
        _path := _path is String ? BSTR.Alloc(_path).Value : _path

        result := ComCall(7, this, BSTR, _path, "ptr*", &ppFolder := 0, "HRESULT")
        return ITaskFolder(ppFolder)
    }

    /**
     * Gets a collection of running tasks.
     * @param {Integer} flags A value from the <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/ne-taskschd-task_enum_flags">TASK_ENUM_FLAGS</a> enumeration. Pass in 0 to return a collection of running tasks that are not hidden tasks.
     * @returns {IRunningTaskCollection} An <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface that contains the currently running tasks.
     * 
     * Pass in a reference to a <b>NULL</b> <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-irunningtaskcollection">IRunningTaskCollection</a> interface pointer. Referencing a non-<b>NULL</b> pointer can cause a memory leak because the pointer will be overwritten.
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-getrunningtasks
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-newtask
     */
    NewTask(flags) {
        result := ComCall(9, this, "uint", flags, "ptr*", &ppDefinition := 0, "HRESULT")
        return ITaskDefinition(ppDefinition)
    }

    /**
     * Connects to a remote computer and associates all subsequent calls on this interface with a remote session.
     * @remarks
     * The <b>ITaskService::Connect</b> method should be called before calling any of the other <a href="https://docs.microsoft.com/windows/desktop/api/taskschd/nn-taskschd-itaskservice">ITaskService</a> methods.
     * 
     * If you are to connecting to a remote Windows Vista computer from a Windows Vista, you need to allow the Remote Scheduled Tasks Management firewall exception on the remote computer. To allow this exception click <b>Start</b>, <b>Control Panel</b>, <b>Security</b>, <b>Allow a program through Windows Firewall</b>, and then select the <b>Remote Scheduled Tasks Management</b> check box. Then click the <b>Ok</b> button in the Windows Firewall Settings dialog box.
     * 
     * If you are connecting to a remote Windows XP or Windows Server 2003 computer from a Windows Vista computer, you need to allow the File and Printer Sharing firewall exception on the remote computer. To allow this exception click <b>Start</b>, <b>Control Panel</b>, double-click <b>Windows Firewall</b>, select the <b>Exceptions</b> tab, and then select the <b>File and Printer Sharing</b> firewall exception. Then click the <b>OK</b> button in the Windows Firewall dialog box. The Remote Registry service must also be running on the remote computer.
     * 
     * 
     * <div class="alert"><b>Note</b>  The <b>ITaskService::Connect</b> may return an  error <b>SCHED_E_INVALIDVALUE</b> while reading the task definition if the schema of the remote task is not supported by the current machine. To verify the highest schema version supported by the current machine, check the <a href="https://docs.microsoft.com/windows/desktop/TaskSchd/taskservice-highestversion"> ITaskService::HighestVersion</a> property.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-connect
     */
    Connect(serverName, user, domain, password) {
        result := ComCall(10, this, VARIANT, serverName, VARIANT, user, VARIANT, domain, VARIANT, password, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates if you are connected to the Task Scheduler service.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connected
     */
    get_Connected() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pConnected := 0, "HRESULT")
        return pConnected
    }

    /**
     * Gets the name of the computer that is running the Task Scheduler service that the user is connected to.
     * @remarks
     * This property returns an empty string when the user passes an IP address, Localhost, or  '.' into the <i>pServer</i> parameter, and it returns the name of the computer that is running the Task Scheduler service when the user does not pass any parameter value.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_targetserver
     */
    get_TargetServer() {
        pServer := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pServer, "HRESULT")
        return pServer
    }

    /**
     * Gets the name of the user that is connected to the Task Scheduler service.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connecteduser
     */
    get_ConnectedUser() {
        pUser := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pUser, "HRESULT")
        return pUser
    }

    /**
     * Gets the name of the domain to which the TargetServer computer is connected.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connecteddomain
     */
    get_ConnectedDomain() {
        pDomain := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pDomain, "HRESULT")
        return pDomain
    }

    /**
     * Indicates the highest version of Task Scheduler that a computer supports.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_highestversion
     */
    get_HighestVersion() {
        result := ComCall(15, this, "uint*", &pVersion := 0, "HRESULT")
        return pVersion
    }

    Query(iid) {
        if (ITaskService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFolder := CallbackCreate(GetMethod(implObj, "GetFolder"), flags, 3)
        this.vtbl.GetRunningTasks := CallbackCreate(GetMethod(implObj, "GetRunningTasks"), flags, 3)
        this.vtbl.NewTask := CallbackCreate(GetMethod(implObj, "NewTask"), flags, 3)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 5)
        this.vtbl.get_Connected := CallbackCreate(GetMethod(implObj, "get_Connected"), flags, 2)
        this.vtbl.get_TargetServer := CallbackCreate(GetMethod(implObj, "get_TargetServer"), flags, 2)
        this.vtbl.get_ConnectedUser := CallbackCreate(GetMethod(implObj, "get_ConnectedUser"), flags, 2)
        this.vtbl.get_ConnectedDomain := CallbackCreate(GetMethod(implObj, "get_ConnectedDomain"), flags, 2)
        this.vtbl.get_HighestVersion := CallbackCreate(GetMethod(implObj, "get_HighestVersion"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFolder)
        CallbackFree(this.vtbl.GetRunningTasks)
        CallbackFree(this.vtbl.NewTask)
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.get_Connected)
        CallbackFree(this.vtbl.get_TargetServer)
        CallbackFree(this.vtbl.get_ConnectedUser)
        CallbackFree(this.vtbl.get_ConnectedDomain)
        CallbackFree(this.vtbl.get_HighestVersion)
    }
}
