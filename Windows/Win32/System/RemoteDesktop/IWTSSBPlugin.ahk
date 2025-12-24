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
     * Initializes the plug-in and returns a value that indicates the redirection capabilities of the plug-in.
     * @returns {Integer} A pointer to a value that indicates the redirection capabilities of the plug-in.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-initialize
     */
    Initialize() {
        result := ComCall(3, this, "uint*", &PluginCapabilities := 0, "HRESULT")
        return PluginCapabilities
    }

    /**
     * Notifies the plug-in that a change occurred in the server environment.
     * @param {Integer} NotificationType A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_notification_type">WTSSBX_NOTIFICATION_TYPE</a> enumeration type that indicates the type of event that occurred.
     * @param {Integer} MachineId The ID of the server on which the change  occurred.
     * @param {Pointer<WTSSBX_MACHINE_INFO>} pMachineInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_info">WTSSBX_MACHINE_INFO</a> structure that contains information about the server that changed. Only the members that changed are reported in this structure. The other members are set to zero.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-wtssbx_machinechangenotification
     */
    WTSSBX_MachineChangeNotification(NotificationType, MachineId, pMachineInfo) {
        result := ComCall(4, this, "int", NotificationType, "int", MachineId, "ptr", pMachineInfo, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that a change, such as a logon, logoff, disconnect, or reconnect, occurred in the session.
     * @param {Integer} NotificationType A <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_notification_type">WTSSBX_NOTIFICATION_TYPE</a> type that specifies the type of change that occurred.
     * @param {Integer} MachineId The ID of the server on which the session change occurred.
     * @param {Integer} NumOfSessions The number of elements in the <i>SessionInfo</i> array.
     * @param {Pointer<WTSSBX_SESSION_INFO>} SessionInfo An array of <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_session_info">WTSSBX_SESSION_INFO</a> structures that contain information about sessions. Only the members that have changed are reported in this structure. The others are set to zero.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-wtssbx_sessionchangenotification
     */
    WTSSBX_SessionChangeNotification(NotificationType, MachineId, NumOfSessions, SessionInfo) {
        result := ComCall(5, this, "int", NotificationType, "int", MachineId, "uint", NumOfSessions, "ptr", SessionInfo, "HRESULT")
        return result
    }

    /**
     * Returns the ID of the server to which Terminal Services Session Broker (TS�Session Broker) should direct the incoming connection.
     * @param {PWSTR} UserName A pointer to a Unicode string that contains the user name of the incoming connection.
     * @param {PWSTR} DomainName A pointer to a Unicode string that contains the domain name that is associated with the  incoming connection.
     * @param {PWSTR} ApplicationType A pointer to a Unicode string that contains the name of the program that Remote Desktop Services runs after it creates the session.
     * @param {PWSTR} FarmName A pointer to a Unicode string that contains the name of the farm in TS Session Broker that the user is connecting to.
     * @param {Pointer<Integer>} pMachineId A pointer to the ID of the server to which TS Session Broker will redirect the incoming connection.  This value is initially set to the  ID of the server provided by the load balancing logic of TS Session Broker.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-wtssbx_getmostsuitableserver
     */
    WTSSBX_GetMostSuitableServer(UserName, DomainName, ApplicationType, FarmName, pMachineId) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        ApplicationType := ApplicationType is String ? StrPtr(ApplicationType) : ApplicationType
        FarmName := FarmName is String ? StrPtr(FarmName) : FarmName

        pMachineIdMarshal := pMachineId is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", UserName, "ptr", DomainName, "ptr", ApplicationType, "ptr", FarmName, pMachineIdMarshal, pMachineId, "HRESULT")
        return result
    }

    /**
     * Notifies the plug-in that it is about to be destroyed by Terminal Services Session Broker (TS�Session Broker).
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-terminated
     */
    Terminated() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Redirects an incoming connection to a computing resource, such as a virtual machine, a blade server, or even the user's own corporate desktop by providing a WTSSBX_MACHINE_CONNECT_INFO structure that contains information about the resource.
     * @param {PWSTR} UserName A pointer to a Unicode string  that contains the user name of the incoming connection.
     * @param {PWSTR} DomainName A pointer to a Unicode string  that contains the domain name of the incoming connection.
     * @param {PWSTR} ApplicationType A pointer to a Unicode string  that contains the program that Remote Desktop Services runs after the user session is created.
     * @param {Pointer<WTSSBX_IP_ADDRESS>} RedirectorInternalIP A pointer to the internal IP address of the RD Session Host server that first accepted the connection.
     * @param {Pointer<Integer>} pSessionId A pointer to the session ID of the session to which the plug-in is redirecting the incoming connection.
     * @param {Pointer<WTSSBX_MACHINE_CONNECT_INFO>} pMachineConnectInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_machine_connect_info">WTSSBX_MACHINE_CONNECT_INFO</a> structure that contains information about the computer to which the plug-in  is directing the incoming connection.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful.
     * @see https://docs.microsoft.com/windows/win32/api//tssbx/nf-tssbx-iwtssbplugin-wtssbx_getuserexternalsession
     */
    WTSSBX_GetUserExternalSession(UserName, DomainName, ApplicationType, RedirectorInternalIP, pSessionId, pMachineConnectInfo) {
        UserName := UserName is String ? StrPtr(UserName) : UserName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        ApplicationType := ApplicationType is String ? StrPtr(ApplicationType) : ApplicationType

        pSessionIdMarshal := pSessionId is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", UserName, "ptr", DomainName, "ptr", ApplicationType, "ptr", RedirectorInternalIP, pSessionIdMarshal, pSessionId, "ptr", pMachineConnectInfo, "HRESULT")
        return result
    }
}
