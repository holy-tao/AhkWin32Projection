#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} path 
     * @param {Pointer<ITaskFolder>} ppFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-getfolder
     */
    GetFolder(path, ppFolder) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(7, this, "ptr", path, "ptr*", ppFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IRunningTaskCollection>} ppRunningTasks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-getrunningtasks
     */
    GetRunningTasks(flags, ppRunningTasks) {
        result := ComCall(8, this, "int", flags, "ptr*", ppRunningTasks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<ITaskDefinition>} ppDefinition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-newtask
     */
    NewTask(flags, ppDefinition) {
        result := ComCall(9, this, "uint", flags, "ptr*", ppDefinition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} serverName 
     * @param {VARIANT} user 
     * @param {VARIANT} domain 
     * @param {VARIANT} password 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-connect
     */
    Connect(serverName, user, domain, password) {
        result := ComCall(10, this, "ptr", serverName, "ptr", user, "ptr", domain, "ptr", password, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pConnected 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connected
     */
    get_Connected(pConnected) {
        result := ComCall(11, this, "ptr", pConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pServer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_targetserver
     */
    get_TargetServer(pServer) {
        result := ComCall(12, this, "ptr", pServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connecteduser
     */
    get_ConnectedUser(pUser) {
        result := ComCall(13, this, "ptr", pUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDomain 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_connecteddomain
     */
    get_ConnectedDomain(pDomain) {
        result := ComCall(14, this, "ptr", pDomain, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/taskschd/nf-taskschd-itaskservice-get_highestversion
     */
    get_HighestVersion(pVersion) {
        result := ComCall(15, this, "uint*", pVersion, "HRESULT")
        return result
    }
}
