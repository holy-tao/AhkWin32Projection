#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Used to extend the capabilities of Terminal Services Session Broker (TS�Session Broker). Implement this interface when you want to provide a plug-in that overrides the redirection logic of TS�Session Broker.
 * @remarks
 * 
  * TS Session Broker calls the <a href="https://docs.microsoft.com/windows/desktop/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_getuserexternalsession">WTSSBX_GetUserExternalSession</a> method so that the plug-in can direct an incoming connection to a computer that does not belong to a farm in TS Session Broker.
  * 
  * Alternatively, TS Session Broker calls the <a href="https://docs.microsoft.com/windows/desktop/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_getmostsuitableserver">WTSSBX_GetMostSuitableServer</a> method so that the plug-in can direct an incoming connection to a computer that does belong to a farm in TS Session Broker.
  * 
  * These methods reference an individual server in the farm by using the unique <i>MachineId</i> assigned to the server by TS Session Broker. When a server joins a farm in TS Session Broker, TS Session Broker calls the <a href="https://docs.microsoft.com/windows/desktop/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_machinechangenotification">WTSSBX_MachineChangeNotification</a> method to notify the plug-in of the change and pass the <i>MachineId</i> of the new server to the plug-in.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/nn-tssbx-iwtssbplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSSBPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSSBPlugin
     * @type {Guid}
     */
    static IID => Guid("{dc44be78-b18d-4399-b210-641bf67a002c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "WTSSBX_MachineChangeNotification", "WTSSBX_SessionChangeNotification", "WTSSBX_GetMostSuitableServer", "Terminated", "WTSSBX_GetUserExternalSession"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<Integer>} PluginCapabilities 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(PluginCapabilities) {
        result := ComCall(3, this, "uint*", PluginCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NotificationType 
     * @param {Integer} MachineId 
     * @param {Pointer<WTSSBX_MACHINE_INFO>} pMachineInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_machinechangenotification
     */
    WTSSBX_MachineChangeNotification(NotificationType, MachineId, pMachineInfo) {
        result := ComCall(4, this, "int", NotificationType, "int", MachineId, "ptr", pMachineInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NotificationType 
     * @param {Integer} MachineId 
     * @param {Integer} NumOfSessions 
     * @param {Pointer<WTSSBX_SESSION_INFO>} SessionInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_sessionchangenotification
     */
    WTSSBX_SessionChangeNotification(NotificationType, MachineId, NumOfSessions, SessionInfo) {
        result := ComCall(5, this, "int", NotificationType, "int", MachineId, "uint", NumOfSessions, "ptr", SessionInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} UserName 
     * @param {PWSTR} DomainName 
     * @param {PWSTR} ApplicationType 
     * @param {PWSTR} FarmName 
     * @param {Pointer<Integer>} pMachineId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_getmostsuitableserver
     */
    WTSSBX_GetMostSuitableServer(UserName, DomainName, ApplicationType, FarmName, pMachineId) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        ApplicationType := ApplicationType is String ? StrPtr(ApplicationType) : ApplicationType
        FarmName := FarmName is String ? StrPtr(FarmName) : FarmName

        result := ComCall(6, this, "ptr", UserName, "ptr", DomainName, "ptr", ApplicationType, "ptr", FarmName, "int*", pMachineId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tssbx/nf-tssbx-iwtssbplugin-terminated
     */
    Terminated() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} UserName 
     * @param {PWSTR} DomainName 
     * @param {PWSTR} ApplicationType 
     * @param {Pointer<WTSSBX_IP_ADDRESS>} RedirectorInternalIP 
     * @param {Pointer<Integer>} pSessionId 
     * @param {Pointer<WTSSBX_MACHINE_CONNECT_INFO>} pMachineConnectInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tssbx/nf-tssbx-iwtssbplugin-wtssbx_getuserexternalsession
     */
    WTSSBX_GetUserExternalSession(UserName, DomainName, ApplicationType, RedirectorInternalIP, pSessionId, pMachineConnectInfo) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        ApplicationType := ApplicationType is String ? StrPtr(ApplicationType) : ApplicationType

        result := ComCall(8, this, "ptr", UserName, "ptr", DomainName, "ptr", ApplicationType, "ptr", RedirectorInternalIP, "uint*", pSessionId, "ptr", pMachineConnectInfo, "HRESULT")
        return result
    }
}
