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
     * 
     * @param {BSTR} path 
     * @param {Pointer<ITaskFolder>} ppFolder 
     * @returns {HRESULT} 
     */
    GetFolder(path, ppFolder) {
        path := path is String ? BSTR.Alloc(path).Value : path

        result := ComCall(7, this, "ptr", path, "ptr", ppFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<IRunningTaskCollection>} ppRunningTasks 
     * @returns {HRESULT} 
     */
    GetRunningTasks(flags, ppRunningTasks) {
        result := ComCall(8, this, "int", flags, "ptr", ppRunningTasks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flags 
     * @param {Pointer<ITaskDefinition>} ppDefinition 
     * @returns {HRESULT} 
     */
    NewTask(flags, ppDefinition) {
        result := ComCall(9, this, "uint", flags, "ptr", ppDefinition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} serverName 
     * @param {VARIANT} user 
     * @param {VARIANT} domain 
     * @param {VARIANT} password 
     * @returns {HRESULT} 
     */
    Connect(serverName, user, domain, password) {
        result := ComCall(10, this, "ptr", serverName, "ptr", user, "ptr", domain, "ptr", password, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pConnected 
     * @returns {HRESULT} 
     */
    get_Connected(pConnected) {
        result := ComCall(11, this, "ptr", pConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pServer 
     * @returns {HRESULT} 
     */
    get_TargetServer(pServer) {
        result := ComCall(12, this, "ptr", pServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUser 
     * @returns {HRESULT} 
     */
    get_ConnectedUser(pUser) {
        result := ComCall(13, this, "ptr", pUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pDomain 
     * @returns {HRESULT} 
     */
    get_ConnectedDomain(pDomain) {
        result := ComCall(14, this, "ptr", pDomain, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pVersion 
     * @returns {HRESULT} 
     */
    get_HighestVersion(pVersion) {
        result := ComCall(15, this, "uint*", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
