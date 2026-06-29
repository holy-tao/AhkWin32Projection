#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\TC_GEN_FILTER.ahk" { TC_GEN_FILTER }
#Import ".\QOS_NOTIFY_FLOW.ahk" { QOS_NOTIFY_FLOW }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Networking\WinSock\SOCKET.ahk" { SOCKET }
#Import ".\TC_GEN_FLOW.ahk" { TC_GEN_FLOW }
#Import ".\QOS_QUERY_FLOW.ahk" { QOS_QUERY_FLOW }
#Import "..\..\Networking\WinSock\SOCKADDR.ahk" { SOCKADDR }
#Import ".\QOS_VERSION.ahk" { QOS_VERSION }
#Import ".\ENUMERATION_BUFFER.ahk" { ENUMERATION_BUFFER }
#Import ".\QOS_TRAFFIC_TYPE.ahk" { QOS_TRAFFIC_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\QOS_SET_FLOW.ahk" { QOS_SET_FLOW }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import ".\TCI_CLIENT_FUNC_LIST.ahk" { TCI_CLIENT_FUNC_LIST }
#Import ".\TC_IFC_DESCRIPTOR.ahk" { TC_IFC_DESCRIPTOR }

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */

;@region Functions
/**
 * This function initializes the QOS subsystem and the QOSHandle parameter. The QOSHandle parameter is used when calling other QOS functions. QOSCreateHandle must be called before any other functions.
 * @remarks
 * Every process intending to use qWAVE must first call <b>QOSCreateHandle</b>. The handle returned can be used for performing overlapped I/O. For example, this handle can be associated with an I/O completion port (IOCP) to receive overlapped completion notifications. This function can be  called multiple times to obtain multiple handles although a single handle is sufficient for most applications.
 * 
 * If a machine enters a power save mode that interrupts connectivity such as sleep or standby, existing and active network experiments such as <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> must be reinitiated.  This recreation of the flow mirrors the cleanup and creation activities also necessary for existing sockets. A new handle must be created, and the flow must be recreated and readmitted.
 * @param {Pointer<QOS_VERSION>} _Version Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_version">QOS_VERSION</a> structure that indicates the version of QOS being used.  The <b>MajorVersion</b> member must be set to 1, and the <b>MinorVersion</b> member must be set to 0.
 * @param {Pointer<HANDLE>} QOSHandle Pointer to a variable that receives a QOS handle.  This handle is used when calling other QOS functions.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_GEN_FAILURE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Internal logic error.  Initialization failed.  For example, if the host goes into sleep or standby mode, all existing handles and flows are rendered invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_RESOURCE_DISABLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A resource required by the service is unavailable.  This error may be returned if the user has not enabled the firewall exception for the qWAVE service.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the dependencies of this service is unavailable.  The qWAVE service could not be started.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qoscreatehandle
 * @since windows6.0.6000
 */
export QOSCreateHandle(_Version, QOSHandle) {
    result := DllCall("qwave.dll\QOSCreateHandle", QOS_VERSION.Ptr, _Version, HANDLE.Ptr, QOSHandle, BOOL)
    return result
}

/**
 * The QOSCloseHandle function closes a handle returned by the QOSCreateHandle function.
 * @remarks
 * All flows added on the handle being closed are immediately removed from the system.  Any traffic going out of a socket used to create these flows will no longer be marked with priority values.  Any pending operations on these flows are immediately completed with <b>ERROR_ABORTED</b>.
 * 
 * If any clients were being tracked through the handle being closed by a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> function, <b>QOSCloseHandle</b> indicates that the application is no longer using the client endpoint.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosclosehandle
 * @since windows6.0.6000
 */
export QOSCloseHandle(QOSHandle) {
    result := DllCall("qwave.dll\QOSCloseHandle", HANDLE, QOSHandle, BOOL)
    return result
}

/**
 * The QOSStartTrackingClient function notifies the QOS subsystem of the existence of a new client.
 * @remarks
 * On receipt of a <b>QOSStartTrackingClient</b> call the QoS subsystem begins gathering information about the client such as the QoS capabilities and available bandwidth on the end-to-end path.
 * 
 * An application should call this function as soon as it becomes aware of a client device that may need QoS flow.  For example this function should be called when a media player device first connects to a media server application.
 * 
 * Network experiments performed by <b>QOSStartTrackingClient</b> do not introduce noteworthy load on the network even if no stream is started for a long period of time.  The qWAVE service dynamically adjusts experiment traffic based on QoS subsystem activity.
 * 
 * Link Layer Topology Discovery (LLTD) must be implemented on the sink PC or device for this function to work.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Pointer<SOCKADDR>} DestAddr A pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  Any port number specified in the sockaddr structure will be ignored.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>DestAddr</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosstarttrackingclient
 * @since windows6.0.6000
 */
export QOSStartTrackingClient(QOSHandle, DestAddr) {
    static Flags := 0 ;Reserved parameters must always be NULL

    result := DllCall("qwave.dll\QOSStartTrackingClient", HANDLE, QOSHandle, SOCKADDR.Ptr, DestAddr, "uint", Flags, BOOL)
    return result
}

/**
 * The QOSStopTrackingClient function notifies the QoS subsystem to stop tracking a client that has previously used the QOSStartTrackingClient function. If a flow is currently in progress, this function will not affect it.
 * @remarks
 * The Winsock2.h header file must be included to use Winsock defined identifiers or functions.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the IP address of the client device.  Clients are identified by their IP address and address family.  A port number is not required and will be ignored.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>DestAddr</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosstoptrackingclient
 * @since windows6.0.6000
 */
export QOSStopTrackingClient(QOSHandle, DestAddr) {
    static Flags := 0 ;Reserved parameters must always be NULL

    result := DllCall("qwave.dll\QOSStopTrackingClient", HANDLE, QOSHandle, SOCKADDR.Ptr, DestAddr, "uint", Flags, BOOL)
    return result
}

/**
 * Enumerates all existing flows.
 * @remarks
 * Successfully calling this function requires administrative privileges
 * 
 * Calling the <b>QOSEnumerateFlows</b> function retrieves a list of <b>QOS_FlowId</b>s currently active on the QOS subsystem.   These <b>QOS_FlowId</b>s could then be used to call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosqueryflow">QOSQueryFlow</a> function in order to gain more information on individual flows.
 * 
 * This function has call-twice semantics. First call to get the <i>Buffer</i> size, then call again (with an appropriately sized <i>Buffer</i> if the first call failed with <b>ERROR_INSUFFICIENT_BUFFER</b>) to retrieve the list of flows.  The second call may fail again with <b>ERROR_INSUFFICIENT_BUFFER</b> if new flows ere added since the first call.
 * 
 * Flows from another process cannot be modified.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Pointer<Integer>} _Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
 * 
 * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
 * 
 * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
 * @param {Integer} _Buffer Pointer to an array of <b>QOS_FlowId</b> flow identifiers. A <b>QOS_FlowId</b> is an unsigned 32-bit integer.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Buffer is too small.  On output, <i>Size</i> will contain the minimum required buffer size. This function should then be called again with a buffer of the indicated size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>DestAddr</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosenumerateflows
 * @since windows6.0.6000
 */
export QOSEnumerateFlows(QOSHandle, _Size, _Buffer) {
    _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"

    result := DllCall("qwave.dll\QOSEnumerateFlows", HANDLE, QOSHandle, _SizeMarshal, _Size, "ptr", _Buffer, BOOL)
    return result
}

/**
 * Adds a new flow for traffic.
 * @remarks
 * The use of IPv4/v6 mixed addresses is not supported in qWAVE. The address specified by the <i>DestAddr</i> parameter must be either IPv4 or IPv6.
 * 
 * If there is a requirement for network experiments over a specific network interface, the socket must be bound to that particular interface. Otherwise the most appropriate interface for the experiment, as indicated by the network stack, is assigned by the qWAVE subsystem.
 * 
 * Network traffic associated with this flow is not affected by making this call alone.  For example, packet prioritization does not occur immediately.
 * 
 * There are two categories of applications that use this function:  adaptive and non-adaptive.  An adaptive application makes use of notifications and information in the <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flow_fundamentals">QOS_FLOW_FUNDAMENTALS</a> structure for adapting to network changes such as congestion.  The qWAVE service uses Link Layer Topology Discovery (LLTD) QoS extensions for adaptive flows which can be present on the destination device.
 * 
 * After calling this function adaptive A/V applications should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a> function with an <i>Operation</i> value of <b>QOSSetFlowRate</b> to affect network traffic.
 * 
 * A non-adaptive application either does not adapt to changing network characteristics or is sending traffic to an endpoint that does not support adaptive capabilities as indicated by ERROR_NOT_SUPPORTED.
 * 
 * Non-adaptive applications, or adaptive applications making non-adaptive flows, should call this function with the <b>QOS_NON_ADAPTIVE_FLOW</b> flag.  After calling this function A/V applications should call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qossetflow">QOSSetFlow</a> function with a <i>Operation</i>. <b>QOSSetFlow</b> does not need to be called unless shaping is desired.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {SOCKET} _Socket Identifies the socket that the application will use to flow traffic.
 * @param {Pointer<SOCKADDR>} DestAddr Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinSock/sockaddr-2">sockaddr</a> structure that contains the destination IP address to which the application will send traffic.  The sockaddr structure must specify a destination port.
 * 
 * <div class="alert"><b>Note</b>  <i>DestAddr</i> is optional if the socket is already connected. If this parameter is specified, the remote IP address and port must match those used in the socket's connect call.<p class="note">If the socket is not connected, this parameter must be specified.  If the socket is already connected, this parameter does not need to be specified.  In this case, if the parameter is still specified, the destination host and port must match what was specified during the socket connect call.
 * 
 * <p class="note">Since, under TCP, the socket connect call can be delayed, <b>QOSAddSocketToFlow</b> can be called before a connection is established, passing in the remote system's IP address and port number in the <i>DestAddr</i> parameter.
 * 
 * </div>
 * <div> </div>
 * @param {QOS_TRAFFIC_TYPE} TrafficType A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant that specifies the type of traffic for which this flow will be used.
 * @param {Integer} Flags Optional flag values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOS_NON_ADAPTIVE_FLOW"></a><a id="qos_non_adaptive_flow"></a><dl>
 * <dt><b>QOS_NON_ADAPTIVE_FLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * If specified, the QoS subsystem will not gather data about the network path for this flow.  As a result, functions which rely on bandwidth estimation techniques will not be available.  For example, this would block <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosqueryflow">QOSQueryFlow</a> with an <i>Operation</i> value  of <b>QOSQueryFlowFundamentals</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> with an <i>Operation</i> value of <b>QOSNotifyCongested</b>, <b>QOSNotifyUncongested</b>, and <b>QOSNotifyAvailable</b>. 
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} FlowId Pointer to a buffer that receives a flow identifier. On input, this value must be 0.  On output, the buffer contains a flow identifier if the call succeeds.  
 * 
 * If a socket is being added to an existing flow, this parameter will be the identifier of that flow.
 * 
 * An application can make use of this parameter if multiple sockets used can share the same QoS flow properties.  The QoS subsystem, then does not have to incur the overhead of provisioning new flows for subsequent sockets with the same properties.  Note that only non-adaptive flows can have multiple sockets attached to an existing flow.  
 * 
 * A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CONNECTION_REFUSED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The remote system refused the network connection.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter is invalid.
 * 
 * <div class="alert"><b>Note</b>  This value is also returned if a IPv4/v6 mixed address was supplied through the <i>DestAddr</i> parameter.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosaddsockettoflow
 * @since windows6.0.6000
 */
export QOSAddSocketToFlow(QOSHandle, _Socket, DestAddr, TrafficType, Flags, FlowId) {
    FlowIdMarshal := FlowId is VarRef ? "uint*" : "ptr"

    result := DllCall("qwave.dll\QOSAddSocketToFlow", HANDLE, QOSHandle, SOCKET, _Socket, SOCKADDR.Ptr, DestAddr, QOS_TRAFFIC_TYPE, TrafficType, "uint", Flags, FlowIdMarshal, FlowId, BOOL)
    return result
}

/**
 * Notifies the QOS subsystem that a previously added flow has been terminated.
 * @remarks
 * Calling the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosclosehandle">QOSCloseHandle</a> function immediately aborts all pending operations and flows added by that handle.  If a handle is closed while a <b>QOSRemoveSocketFromFlow</b> call is still progress, the call will complete with <b>ERROR_OPERATION_ABORTED</b>.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {SOCKET} _Socket Socket to be removed from the flow.
 * 
 * Only flows created with the <b>QOS_NON_ADAPTIVE_FLOW</b> flag may have multiple sockets added to the same flow.  By passing the <i>Socket</i> parameter in this call, each socket can be removed individually.  If the <i>Socket</i> parameter is not passed, the entire flow will be destroyed.  If only one socket was attached to the flow, passing this socket as a parameter to this function and passing <b>NULL</b> as a socket are equivalent calls.
 * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient system resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OPERATION_ABORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request was blocked.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosremovesocketfromflow
 * @since windows6.0.6000
 */
export QOSRemoveSocketFromFlow(QOSHandle, _Socket, FlowId) {
    static Flags := 0 ;Reserved parameters must always be NULL

    result := DllCall("qwave.dll\QOSRemoveSocketFromFlow", HANDLE, QOSHandle, SOCKET, _Socket, "uint", FlowId, "uint", Flags, BOOL)
    return result
}

/**
 * Is called by an application to request the QOS subsystem to prioritize the application's packets and change the flow traffic.
 * @remarks
 * If <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosstarttrackingclient">QOSStartTrackingClient</a> has not already been called, calling <b>QOSSetFlow</b> will cause the QOS subsystem to perform the following.<ul>
 * <li>Discover whether the end-to-end network path supports prioritization.</li>
 * <li>Track end-to-end network characteristics by way of network experiments.  These experiments do not place any noteworthy stress on the network.</li>
 * </ul>
 * 
 * 
 * If <b>QOSSetFlow</b> returns <b>ERROR_NETWORK_BUSY</b> there is insufficient bandwidth for the specified flow rate and network priority cannot be granted.  The application can still transmit a data stream but the flow will not receive priority marking.  Ideally an application would not attempt to stream at the requested rate if there is insufficient bandwidth. If <b>ERROR_NETWORK_BUSY</b> is returned the following safe strategy is available:<ol>
 * <li>Query the QoS subsystem with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> in order to determine the current available bandwidth and begin to stream at the received lower rate with priority if the network supports it.</li>
 * <li>Request notification with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosnotifyflow">QOSNotifyFlow</a> for when the originally desired amount of bandwidth is available.  When notification is received call  <b>QOSSetFlow</b> with the new bandwidth request and send at the new rate again with prioritization if supported.</li>
 * </ol>
 * 
 * 
 * This function may optionally be called asynchronously.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Integer} FlowId A flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
 * @param {QOS_SET_FLOW} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_set_flow">QOS_SET_FLOW</a> enumerated type that identifies what will be changed in the flow.  This parameter specifies what structure the <i>Buffer</i> will contain.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSSetTrafficType"></a><a id="qossettraffictype"></a><a id="QOSSETTRAFFICTYPE"></a><dl>
 * <dt><b>QOSSetTrafficType</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The traffic type of the flow will be changed.  The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_traffic_type">QOS_TRAFFIC_TYPE</a> constant.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSSetOutgoingRate"></a><a id="qossetoutgoingrate"></a><a id="QOSSETOUTGOINGRATE"></a><dl>
 * <dt><b>QOSSetOutgoingRate</b></dt>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow rate will be changed. The <i>Buffer</i> will contain a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flowrate_outgoing">QOS_FLOWRATE_OUTGOING</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSSetOutgoingDSCPValue"></a><a id="qossetoutgoingdscpvalue"></a><a id="QOSSETOUTGOINGDSCPVALUE"></a><dl>
 * <dt><b>QOSSetOutgoingDSCPValue</b></dt>
 * <dt>2</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Windows 7, Windows Server 2008 R2, and later: The outgoing DSCP value will be changed. The <i>Buffer</i> will contain a pointer to a <b>DWORD</b> value that defines the arbitrary DSCP value.
 * 
 * <div class="alert"><b>Note</b>  This setting requires the calling application be a member of the Administrators or the  Network Configuration Operators group.</div>
 * <div> </div>
 * </td>
 * </tr>
 * </table>
 * @param {Integer} _Size The size of the <i>Buffer</i> parameter, in bytes.
 * @param {Integer} _Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an OVERLAPPED structure used for asynchronous output.  This must be set to <b>NULL</b> if this function is not being called asynchronously.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The update flow request was successfully received.  Results will be returned during overlapped completion.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The calling application does not have sufficient privileges for the requested operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NETWORK_BUSY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested flow properties were not available on this path.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter specified cannot be found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_RETRY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network connection with the remote host failed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qossetflow
 * @since windows6.0.6000
 */
export QOSSetFlow(QOSHandle, FlowId, Operation, _Size, _Buffer, _Overlapped) {
    static Flags := 0 ;Reserved parameters must always be NULL

    result := DllCall("qwave.dll\QOSSetFlow", HANDLE, QOSHandle, "uint", FlowId, QOS_SET_FLOW, Operation, "uint", _Size, "ptr", _Buffer, "uint", Flags, OVERLAPPED.Ptr, _Overlapped, BOOL)
    return result
}

/**
 * Requests information about a specific flow.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Integer} FlowId Specifies a flow identifier. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
 * @param {QOS_QUERY_FLOW} Operation Specifies which type of flow information is being queried. This parameter specifies what structure the <i>Buffer</i> will contain.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSQueryFlowFundamentals"></a><a id="qosqueryflowfundamentals"></a><a id="QOSQUERYFLOWFUNDAMENTALS"></a><dl>
 * <dt><b>QOSQueryFlowFundamentals</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_flow_fundamentals">QOS_FLOW_FUNDAMENTALS</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSQueryPacketPriority"></a><a id="qosquerypacketpriority"></a><a id="QOSQUERYPACKETPRIORITY"></a><dl>
 * <dt><b>QOSQueryPacketPriority</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>Buffer</i> will contain a <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ns-qos2-qos_packet_priority">QOS_PACKET_PRIORITY</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOSQueryOutgoingRate"></a><a id="qosqueryoutgoingrate"></a><a id="QOSQUERYOUTGOINGRATE"></a><dl>
 * <dt><b>QOSQueryOutgoingRate</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * <i>Buffer</i> will contain a <b>UINT64</b> value that indicates the flow rate specified when requesting the contract, in bits per second.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} _Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
 * 
 * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
 * 
 * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
 * @param {Integer} _Buffer Pointer to the structure specified by the value of the <i>Operation</i> parameter.
 * @param {Integer} Flags Flags pertaining to the data being returned.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="QOS_QUERYFLOW_FRESH"></a><a id="qos_queryflow_fresh"></a><dl>
 * <dt><b>QOS_QUERYFLOW_FRESH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QOS subsystem will only return fresh, not cached,  data.  If fresh data is unavailable, it will try to obtain such data, at the expense of possibly taking more time.  If this is not possible, the call will fail with the error code <b>ERROR_RETRY</b>.
 * 
 * This flag is only applicable when the <i>Operation</i> parameter is set to <b>QOSQueryFlowFundamentals</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be set to <b>NULL</b> if this function is not being called asynchronously.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request to the QOS subsystem timed out before enough useful information could be gathered.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer length as specified by the <b>Size</b> parameter is not sufficient for the queried data.  The <b>Size</b> parameter now contains the minimum required size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter or <i>Buffer</i> size is insufficient.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid <i>FlowId</i> specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the update flow request was successfully initiated.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The is no valid data to be returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_RETRY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is currently insufficient data about networking conditions to answer the query.  This is typically a transient state where qWAVE has erred on the side of caution as it awaits more data before ascertaining the state of the network.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosqueryflow
 * @since windows6.0.6000
 */
export QOSQueryFlow(QOSHandle, FlowId, Operation, _Size, _Buffer, Flags, _Overlapped) {
    _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"

    result := DllCall("qwave.dll\QOSQueryFlow", HANDLE, QOSHandle, "uint", FlowId, QOS_QUERY_FLOW, Operation, _SizeMarshal, _Size, "ptr", _Buffer, "uint", Flags, OVERLAPPED.Ptr, _Overlapped, BOOL)
    return result
}

/**
 * Registers the calling application to receive a notification.
 * @remarks
 * This function may be called asynchronously.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Integer} FlowId Specifies the flow identifier from which the application wishes to receive notifications. A <b>QOS_FLOWID</b> is an unsigned 32-bit integer.
 * @param {QOS_NOTIFY_FLOW} Operation A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_notify_flow">QOS_NOTIFY_FLOW</a> value that indicates what the type of  notification being requested.
 * @param {Pointer<Integer>} _Size Indicates the size of the <i>Buffer</i> parameter, in bytes.
 * 
 * On function return, if successful, this parameter will specify the number of bytes copied into <i>Buffer</i>.
 * 
 * If this call fails with <b>ERROR_INSUFFICIENT_BUFFER</b>, this parameter will indicate the minimum required <i>Buffer</i> size in order to successfully complete this operation.
 * @param {Integer} _Buffer Pointer to a UINT64 that indicates the bandwidth at which point a notification will be sent.  This parameter is only used if the <i>Operation</i> parameter is set to <b>QOSNotifyAvailable</b>. For the <b>QOSNotifyCongested</b> and <b>QOSNotifyUncongested</b> options, this parameter must be set to <b>NULL</b> on input.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an OVERLAPPED structure used for asynchronous output. This must be se to <b>NULL</b> if this function is not being called asynchronously.
 * @returns {BOOL} If the function succeeds, a return value of nonzero is sent when the conditions set by the <i>Operation</i> parameter are met.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>.  Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DISABLED_BY_POLICY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QoS subsystem is currently configured by policy to not allow this operation on the network path between this host and the destination host.  For example, the default policy prevents qWAVE experiments from running to off-link destinations.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that notification request was successfully received.  Results will be returned during overlapped completion.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>FlowId</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that a memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid <i>FlowId</i> specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation being performed requires information that the QoS subsystem does not have.  Obtaining this information on this network is currently not supported.  For example, bandwidth estimations cannot be obtained on a network path where the destination host is off-link.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QOS subsystem has determined that the operation requested could not be completed on the network path specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_HOST_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network location cannot be reached.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_UNEXP_NET_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network connection with the remote host failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There is already a request for notifications of the same type pending on this flow.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qosnotifyflow
 * @since windows6.0.6000
 */
export QOSNotifyFlow(QOSHandle, FlowId, Operation, _Size, _Buffer, _Overlapped) {
    static Flags := 0 ;Reserved parameters must always be NULL

    _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"

    result := DllCall("qwave.dll\QOSNotifyFlow", HANDLE, QOSHandle, "uint", FlowId, QOS_NOTIFY_FLOW, Operation, _SizeMarshal, _Size, "ptr", _Buffer, "uint", Flags, OVERLAPPED.Ptr, _Overlapped, BOOL)
    return result
}

/**
 * Cancels a pending overlapped operation, like QOSSetFlow.
 * @remarks
 * This function would never be called with a <b>NULL</b><i>Overlapped</i> parameter.
 * 
 * Successfully canceled operations complete normal completion mechanisms and return <b>ERROR_OPERATION_ABORTED</b> as their completion return code.
 * 
 * Closing a handle with the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qosclosehandle">QOSCloseHandle</a> will automatically abort all pending operations issued with that handle.  If the handle is closed while a <b>QOSCancel</b> is still in progress, the call will complete with <b>ERROR_OPERATION_ABORTED</b> as the return code.
 * @param {HANDLE} QOSHandle Handle to the QOS subsystem returned by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a>.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to the OVERLAPPED structure used in the operation to be canceled.
 * @returns {BOOL} If the function succeeds, the return value is nonzero.
 * 
 * If the function fails, the return value is 0.  To get extended error information, call <b>GetLastError</b>. Some possible error codes follow.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>QOSHandle</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>Overlapped</i> parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A memory allocation failed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are insufficient resources to carry out the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request could not be performed because of an I/O device error.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DEVICE_REINITIALIZATION_NEEDED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The indicated device requires reinitialization due to hardware errors. The application should clean up and call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos2/nf-qos2-qoscreatehandle">QOSCreateHandle</a> again.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ADAP_HDW_ERR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A network adapter hardware error occurred.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/qos2/nf-qos2-qoscancel
 * @since windows6.0.6000
 */
export QOSCancel(QOSHandle, _Overlapped) {
    result := DllCall("qwave.dll\QOSCancel", HANDLE, QOSHandle, OVERLAPPED.Ptr, _Overlapped, BOOL)
    return result
}

/**
 * The TcRegisterClient function is used to register a client with the traffic control interface (TCI). The TcRegisterClient function must be the first function call a client makes to the TCI.
 * @remarks
 * Some of the return codes can be found in tcerror.h.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcRegisterClient</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {Integer} TciVersion Traffic control version expected by the client, included to ensure compatibility between traffic control and the client. Clients can pass CURRENT_TCI_VERSION, defined in Traffic.h.
 * @param {HANDLE} ClRegCtx Client registration context. <i>ClRegCtx</i> is returned when the client's notification handler function is called. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
 * @param {Pointer<TCI_CLIENT_FUNC_LIST>} ClientHandlerList Pointer to a list of client-supplied handlers. Client-supplied handlers are used for notification events and asynchronous completions. Each completion routine is optional, with the exception of the notification handler. Setting the notification handler to <b>NULL</b> will return an ERROR_INVALID_PARAMETER.
 * @param {Pointer<HANDLE>} pClientHandle Pointer to the buffer that traffic control uses to return a registration handle to the client.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INCOMPATIBLE_TCI_VERSION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The TCI version is wrong.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OPEN_FAILED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Traffic control failed to open a system device. The likely cause is insufficient privileges.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TOO_MANY_CLIENTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Traffic Control was unable to register with the kernel component GPC. The likely cause is too many traffic control clients are currently connected.
 * 
 * <b>Windows 2000:  </b>This value is not supported.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcregisterclient
 * @since windows5.0
 */
export TcRegisterClient(TciVersion, ClRegCtx, ClientHandlerList, pClientHandle) {
    result := DllCall("TRAFFIC.dll\TcRegisterClient", "uint", TciVersion, HANDLE, ClRegCtx, TCI_CLIENT_FUNC_LIST.Ptr, ClientHandlerList, HANDLE.Ptr, pClientHandle, UInt32)
    return result
}

/**
 * The TcEnumerateInterfaces function enumerates all traffic control�enabled network interfaces. Clients are notified of interface changes through the ClNotifyHandler function.
 * @remarks
 * The client calling the 
 * <b>TcEnumerateInterfaces</b> function must first allocate a buffer, then pass the buffer to traffic control through <i>InterfaceBuffer</i>. Traffic control returns a pointer to an array of interface descriptors in <i>InterfaceBuffer</i>. Each interface descriptor contains two elements:
 * 
 * <ul>
 * <li>The traffic control interface's identifying text string.</li>
 * <li>The network address list descriptor currently associated with the interface.</li>
 * </ul>
 * The network address list descriptor includes the media type, as well as a list of network addresses. The media type determines how the network address list should be interpreted:
 * 
 * <ul>
 * <li>For connectionless media such as a LAN, the network address list contains all the protocol-specific addresses associated with the interface.</li>
 * <li>For connection-oriented media such as a WAN, the network address list contains an even number of network addresses: 
 * 
 * 
 * <ul>
 * <li>The first address in each pair represents the local (source) address of the interface.</li>
 * <li>The second address in each pair represents the remote (destination) address of the interface.</li>
 * </ul>
 * </li>
 * </ul>
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcEnumerateInterfaces</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client. Clients receive handles when registering with traffic control through the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
 * @param {Pointer<Integer>} pBufferSize Pointer to a value indicating the size of the buffer. For input, this value is the size of the buffer, in bytes, allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used or needed by traffic control. A value of zero on output indicates that no traffic control interfaces are available, indicating that the QOS Packet Scheduler is not installed.
 * @param {Pointer<TC_IFC_DESCRIPTOR>} InterfaceBuffer Pointer to the buffer containing the returned list of interface descriptors.
 * @returns {Integer} Successful completion returns the device name of the interface.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to enumerate all interfaces. If this error is returned, the correct (required) size of the buffer is passed back in <i>pBufferSize</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcenumerateinterfaces
 * @since windows5.0
 */
export TcEnumerateInterfaces(ClientHandle, pBufferSize, InterfaceBuffer) {
    pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TRAFFIC.dll\TcEnumerateInterfaces", HANDLE, ClientHandle, pBufferSizeMarshal, pBufferSize, TC_IFC_DESCRIPTOR.Ptr, InterfaceBuffer, UInt32)
    return result
}

/**
 * The TcOpenInterface function opens an interface. (ANSI)
 * @remarks
 * Use of the 
 * <b>TcOpenInterface</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcOpenInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
 * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
 * @param {HANDLE} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
 * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client handle is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcopeninterfacea
 * @since windows5.0
 */
export TcOpenInterfaceA(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
    pInterfaceName := pInterfaceName is String ? StrPtr(pInterfaceName) : pInterfaceName

    result := DllCall("TRAFFIC.dll\TcOpenInterfaceA", "ptr", pInterfaceName, HANDLE, ClientHandle, HANDLE, ClIfcCtx, HANDLE.Ptr, pIfcHandle, UInt32)
    return result
}

/**
 * The TcOpenInterface function opens an interface. (Unicode)
 * @remarks
 * Use of the 
 * <b>TcOpenInterface</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcOpenInterface as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pInterfaceName Pointer to the text string identifying the interface to be opened. This text string is part of the information returned in a previous call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateinterfaces">TcEnumerateInterfaces</a>.
 * @param {HANDLE} ClientHandle Handle used by traffic control to identify the client, obtained through the <i>pClientHandle</i> parameter of the client's call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
 * @param {HANDLE} ClIfcCtx Client's interface–context handle for the opened interface. Used as a callback parameter by traffic control when communicating with the client about the opened interface. This can be a container to hold an arbitrary client-defined context for this instance of the interface.
 * @param {Pointer<HANDLE>} pIfcHandle Pointer to the buffer where traffic control can return an interface handle. The interface handle returned to <i>pIfcHandle</i> must be used by the client to identify the interface in subsequent calls to traffic control.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Traffic control failed to find an interface with the name provided in <i>pInterfaceName</i>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The client handle is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcopeninterfacew
 * @since windows5.0
 */
export TcOpenInterfaceW(pInterfaceName, ClientHandle, ClIfcCtx, pIfcHandle) {
    pInterfaceName := pInterfaceName is String ? StrPtr(pInterfaceName) : pInterfaceName

    result := DllCall("TRAFFIC.dll\TcOpenInterfaceW", "ptr", pInterfaceName, HANDLE, ClientHandle, HANDLE, ClIfcCtx, HANDLE.Ptr, pIfcHandle, UInt32)
    return result
}

/**
 * The TcCloseInterface function closes an interface previously opened with a call to TcOpenInterface. All flows and filters on a particular interface should be closed before closing the interface with a call to TcCloseInterface.
 * @remarks
 * Regardless of whether 
 * <b>TcCloseInterface</b> is called, an interface will be closed following a TC_NOTIFY_IFC_CLOSE notification event. If the 
 * <b>TcCloseInterface</b> function is called with the handle of an interface that has already been closed, the handle will be invalidated and 
 * <b>TcCloseInterface</b> will return ERROR_INVALID_HANDLE.
 * 
 * <div class="alert"><b>Note</b>  Use of 
 * <b>TcCloseInterface</b> requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} IfcHandle Handle associated with the interface to be closed. This handle is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The interface handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Not all flows have been deleted for this interface.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tccloseinterface
 * @since windows5.0
 */
export TcCloseInterface(IfcHandle) {
    result := DllCall("TRAFFIC.dll\TcCloseInterface", HANDLE, IfcHandle, UInt32)
    return result
}

/**
 * The TcQueryInterface function queries traffic control for related per-interface parameters.
 * @remarks
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcQueryInterface</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} IfcHandle Handle associated with the interface to be queried. This handle is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the traffic control parameter being queried.
 * @param {BOOLEAN} NotifyChange Used to request notifications from traffic control for the parameter being queried. If <b>TRUE</b>, traffic control will notify the client, through the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a> function, upon changes to the parameter corresponding to the GUID provided in <i>pGuidParam</i>. Notifications are off by default.
 * @param {Pointer<Integer>} pBufferSize Indicates the size of the buffer, in bytes. For input, this value is the size of the buffer allocated by the caller. For output, this value is the actual size of the buffer, in bytes, used by traffic control.
 * @param {Integer} _Buffer Pointer to a client-allocated buffer into which returned data will be written.
 * @returns {Integer} Note that, with regard to a requested notification state, only a return value of NO_ERROR will result in the application of the requested notification state. If a return value other than NO_ERROR is returned from a call to the 
 * <b>TcQueryInterface</b> function, the requested change in notification state will not be accepted.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid interface handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid or <b>NULL</b> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to store the results.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Querying for the GUID provided is not supported on the provided interface.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The instance name was not found, likely because the interface is in the process of being closed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryinterface
 * @since windows5.0
 */
export TcQueryInterface(IfcHandle, pGuidParam, NotifyChange, pBufferSize, _Buffer) {
    pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TRAFFIC.dll\TcQueryInterface", HANDLE, IfcHandle, Guid.Ptr, pGuidParam, BOOLEAN, NotifyChange, pBufferSizeMarshal, pBufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcSetInterface function sets individual parameters for a given interface.
 * @remarks
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcSetInterface</b> function requires administrative privilege. The list of GUIDs that can be set is explained in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.</div>
 * <div> </div>
 * @param {HANDLE} IfcHandle Handle associated with the interface to be set. This handle is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
 * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
 * @param {Integer} _Buffer Pointer to a client-provided buffer. <i>Buffer</i> must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid interface handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Setting the GUID for the provided interface is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The GUID is not available.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetinterface
 * @since windows5.0
 */
export TcSetInterface(IfcHandle, pGuidParam, BufferSize, _Buffer) {
    result := DllCall("TRAFFIC.dll\TcSetInterface", HANDLE, IfcHandle, Guid.Ptr, pGuidParam, "uint", BufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function. (ANSI)
 * @remarks
 * Use of the 
 * <b>TcQueryFlow</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcQueryFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pFlowName Name of the flow being queried.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
 * @param {Pointer<Integer>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
 * @param {Integer} _Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provided buffer is too small to hold the results.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested GUID is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The instance name was not found, likely because the flow or the interface is in the process of being closed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryflowa
 * @since windows5.0
 */
export TcQueryFlowA(pFlowName, pGuidParam, pBufferSize, _Buffer) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TRAFFIC.dll\TcQueryFlowA", "ptr", pFlowName, Guid.Ptr, pGuidParam, pBufferSizeMarshal, pBufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcQueryFlow function queries traffic control for the value of a specific flow parameter based on the name of the flow. The name of a flow can be retrieved from the TcEnumerateFlows function or from the TcGetFlowName function. (Unicode)
 * @remarks
 * Use of the 
 * <b>TcQueryFlow</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcQueryFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pFlowName Name of the flow being queried.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the flow parameter of interest. A list of traffic control's GUIDs can be found in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
 * @param {Pointer<Integer>} pBufferSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space written with returned flow-parameter data, in bytes.
 * @param {Integer} _Buffer Pointer to the client-provided buffer in which the returned flow parameter is written.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provided buffer is too small to hold the results.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The requested GUID is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The instance name was not found, likely because the flow or the interface is in the process of being closed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcqueryfloww
 * @since windows5.0
 */
export TcQueryFlowW(pFlowName, pGuidParam, pBufferSize, _Buffer) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    pBufferSizeMarshal := pBufferSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TRAFFIC.dll\TcQueryFlowW", "ptr", pFlowName, Guid.Ptr, pGuidParam, pBufferSizeMarshal, pBufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcSetFlow function sets individual parameters for a given flow. (ANSI)
 * @remarks
 * Use of the 
 * <b>TcSetFlow</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcSetFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PSTR} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
 * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
 * @param {Integer} _Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
 * @returns {Integer} The 
 * <b>TcSetFlow</b> function has the following return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_READY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow is currently being modified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer size was insufficient for the GUID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Setting the GUID for the provided flow is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetflowa
 * @since windows5.0
 */
export TcSetFlowA(pFlowName, pGuidParam, BufferSize, _Buffer) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    result := DllCall("TRAFFIC.dll\TcSetFlowA", "ptr", pFlowName, Guid.Ptr, pGuidParam, "uint", BufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcSetFlow function sets individual parameters for a given flow. (Unicode)
 * @remarks
 * Use of the 
 * <b>TcSetFlow</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcSetFlow as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {PWSTR} pFlowName Name of the flow being set. The value for this parameter is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcenumerateflows">TcEnumerateFlows</a> function or the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcgetflownamea">TcGetFlowName</a> function.
 * @param {Pointer<Guid>} pGuidParam Pointer to the globally unique identifier (GUID) that corresponds to the parameter to be set. A list of available GUIDs can be found in 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/qos/guid">GUID</a>.
 * @param {Integer} BufferSize Size of the client-provided buffer, in bytes.
 * @param {Integer} _Buffer Pointer to a client-provided buffer. Buffer must contain the value to which the traffic control parameter provided in <i>pGuidParam</i> should be set.
 * @returns {Integer} The 
 * <b>TcSetFlow</b> function has the following return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_READY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow is currently being modified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer size was insufficient for the GUID.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Setting the GUID for the provided flow is not supported.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_INSTANCE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The instance name was not found, likely due to the flow or the interface being in the process of being closed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_WMI_GUID_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device did not register for this GUID.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcsetfloww
 * @since windows5.0
 */
export TcSetFlowW(pFlowName, pGuidParam, BufferSize, _Buffer) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    result := DllCall("TRAFFIC.dll\TcSetFlowW", "ptr", pFlowName, Guid.Ptr, pGuidParam, "uint", BufferSize, "ptr", _Buffer, UInt32)
    return result
}

/**
 * The TcAddFlow function adds a new flow on the specified interface.
 * @remarks
 * If the 
 * <b>TcAddFlow</b> function returns ERROR_SIGNAL_PENDING, the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a> function will be called on a different thread than the thread that called the 
 * <b>TcAddFlow</b> function.
 * 
 * Only the addition of a filter will affect traffic control. However, the addition of a flow will cause resources to be committed within traffic control components. This enables traffic control to prepare for handling traffic on the added flow.
 * 
 * Traffic control may delete a flow for various reasons, including the inability to accommodate the flow due to bandwidth restrictions, and adjusted policy requirements. Clients are notified of deleted flows through the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_notify_handler">ClNotifyHandler</a> callback function, with the TC_NOTIFY_FLOW_CLOSE event.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcAddFlow</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} IfcHandle Handle associated with the interface on which the flow is to be added. This handle is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
 * @param {HANDLE} ClFlowCtx Client provided–flow context handle. Used subsequently by traffic control when referring to the added flow.
 * @param {Integer} Flags Reserved for future use. Must be set to zero.
 * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow being installed.
 * @param {Pointer<HANDLE>} pFlowHandle Pointer to a location into which traffic control will return the flow handle. This flow handle should be used in subsequent calls to traffic control to refer to the installed flow.
 * @returns {Integer} There are many reasons why a request to add a flow might be rejected. Error codes returned by traffic control from calls to 
 * <b>TcAddFlow</b> are provided to aid in determining the reason for rejection.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function is being executed asynchronously; the client will be called back through the client-exposed 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_add_flow_complete_handler">ClAddFlowComplete</a> function when the flow has been added or when the process has been completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The interface handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified or bad <b>INTSERV</b> service type has been provided.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified or bad TOKENRATE value has been provided.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The PEAKBANDWIDTH value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SHAPEDISCARDMODE is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The priority value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The traffic class value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are not enough resources to accommodate the requested flow.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Bad length specified for the TC objects.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Applies to Diffserv flows. Indicates that the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Applies to Diffserv flows. Indicates that the QOS_DIFFSERV_RULE specified in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> object was passed with an invalid <b>ShapingRate</b> member.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The QOS_DS_CLASS is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network cable is not plugged into the adapter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcaddflow
 * @since windows5.0
 */
export TcAddFlow(IfcHandle, ClFlowCtx, Flags, pGenericFlow, pFlowHandle) {
    result := DllCall("TRAFFIC.dll\TcAddFlow", HANDLE, IfcHandle, HANDLE, ClFlowCtx, "uint", Flags, TC_GEN_FLOW.Ptr, pGenericFlow, HANDLE.Ptr, pFlowHandle, UInt32)
    return result
}

/**
 * The TcGetFlowName function provides the name of a flow that has been created by the calling client. (ANSI)
 * @remarks
 * Use of the 
 * <b>TcGetFlowName</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcGetFlowName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} FlowHandle Handle for the flow.
 * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
 * @param {PSTR} pFlowName Pointer to the output buffer holding the flow name.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to contain the results.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcgetflownamea
 * @since windows5.0
 */
export TcGetFlowNameA(FlowHandle, StrSize, pFlowName) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    result := DllCall("TRAFFIC.dll\TcGetFlowNameA", HANDLE, FlowHandle, "uint", StrSize, "ptr", pFlowName, UInt32)
    return result
}

/**
 * The TcGetFlowName function provides the name of a flow that has been created by the calling client. (Unicode)
 * @remarks
 * Use of the 
 * <b>TcGetFlowName</b> function requires administrative privilege.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The traffic.h header defines TcGetFlowName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @param {HANDLE} FlowHandle Handle for the flow.
 * @param {Integer} StrSize Size of the string buffer provided in <i>pFlowName</i>.
 * @param {PWSTR} pFlowName Pointer to the output buffer holding the flow name.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the parameters is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to contain the results.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcgetflownamew
 * @since windows5.0
 */
export TcGetFlowNameW(FlowHandle, StrSize, pFlowName) {
    pFlowName := pFlowName is String ? StrPtr(pFlowName) : pFlowName

    result := DllCall("TRAFFIC.dll\TcGetFlowNameW", HANDLE, FlowHandle, "uint", StrSize, "ptr", pFlowName, UInt32)
    return result
}

/**
 * The TcModifyFlow function modifies an existing flow. When calling TcModifyFlow, new Flowspec parameters and any traffic control objects should be filled.
 * @remarks
 * If the 
 * <b>TcModifyFlow</b> function returns ERROR_SIGNAL_PENDING, the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a> function will be called on a different thread than the thread that called the 
 * <b>TcModifyFlow</b> function.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcModifyFlow</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
 * @param {Pointer<TC_GEN_FLOW>} pGenericFlow Pointer to a description of the flow modifications.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function is being executed asynchronously; the client will be called back through the client-exposed 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_mod_flow_complete_handler">ClModifyFlowComplete</a> function when the flow has been added, or when the process has been completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The interface handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_READY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Action performed on the flow by a previous function call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a>, 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, or 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a> has not yet completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SERVICE_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified or bad intserv service type has been provided.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_TOKEN_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An unspecified or bad <i>TokenRate</i> value has been provided.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PEAK_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>PeakBandwidth</i> value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SD_MODE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>ShapeDiscardMode</i> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_QOS_PRIORITY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The priority value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_TRAFFIC_CLASS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The traffic class value is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are not enough resources to accommodate the requested flow.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TC_OBJECT_LENGTH_INVALID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Bad length specified for the TC objects.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DIFFSERV_FLOW</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Applies to Diffserv flows. Indicates that the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a> object was passed with an invalid parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DS_MAPPING_EXISTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Applies to Diffserv flows. Indicates that the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv_rule">QOS_DIFFSERV_RULE</a> specified in 
 * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-tc_gen_flow">TC_GEN_FLOW</a> already applies to an existing flow on the interface.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_SHAPE_RATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a> was passed with an invalid ShapeRate.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DS_CLASS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_ds_class">QOS_DS_CLASS</a> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NETWORK_UNREACHABLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network cable is not plugged into the adapter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcmodifyflow
 * @since windows5.0
 */
export TcModifyFlow(FlowHandle, pGenericFlow) {
    result := DllCall("TRAFFIC.dll\TcModifyFlow", HANDLE, FlowHandle, TC_GEN_FLOW.Ptr, pGenericFlow, UInt32)
    return result
}

/**
 * The TcAddFilter function associates a new filter with an existing flow that allows packets matching the filter to be directed to the associated flow.
 * @remarks
 * Filters can be of different types. They are typically used to filter packets belonging to different network layers. Filter types installed on an interface generally correspond to the address types of the network layer addresses associated with the interface. The address type should be specified in the filter structure.
 * 
 * Filters may be rejected for various reasons, including possible conflicts with the requested filter as well as filters already associated with the flow. Error codes specific to traffic control are provided to help the user diagnose the reason behind a rejection to the 
 * <b>TcAddFilter</b> function.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcAddFilter</b> function requires administrative privilege.</div>
 * <div> </div>
 * In Windows Vista, overlapping and identical filters can be created.  In these situations, the more specific filter takes precedence.
 * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
 * @param {Pointer<TC_GEN_FILTER>} pGenericFilter Pointer to a description of the filter to be installed.
 * @param {Pointer<HANDLE>} pFilterHandle Pointer to a buffer where traffic control returns the filter handle. This filter handle is used by the client in subsequent calls to refer to the added filter.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow handle is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_ADDRESS_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An invalid address type has been provided.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_DUPLICATE_FILTER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An identical filter exists on a flow on this interface.
 * 
 * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILTER_CONFLICT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A conflicting filter exists on a flow on this interface.
 * 
 * <div class="alert"><b>Note</b>   In Windows Vista, this code will not be returned.</div>
 * <div> </div>
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT READY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow is either being installed, modified, or deleted, and is not in a state that accepts filters.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcaddfilter
 * @since windows5.0
 */
export TcAddFilter(FlowHandle, pGenericFilter, pFilterHandle) {
    result := DllCall("TRAFFIC.dll\TcAddFilter", HANDLE, FlowHandle, TC_GEN_FILTER.Ptr, pGenericFilter, HANDLE.Ptr, pFilterHandle, UInt32)
    return result
}

/**
 * The TcDeregisterClient function deregisters a client with the Traffic Control Interface (TCI).
 * @remarks
 * Once a client calls 
 * <b>TcDeregisterClient</b>, the only traffic control function the client is allowed to call is 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a>.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcDeregisterClient</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} ClientHandle Handle assigned to the client through the previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcregisterclient">TcRegisterClient</a> function.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid interface handle, or the handle was set to <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Interfaces are still open for this client. all interfaces must be closed to deregister a client.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcderegisterclient
 * @since windows5.0
 */
export TcDeregisterClient(ClientHandle) {
    result := DllCall("TRAFFIC.dll\TcDeregisterClient", HANDLE, ClientHandle, UInt32)
    return result
}

/**
 * The TcDeleteFlow function deletes a flow that has been added with the TcAddFlow function. Clients should delete all filters associated with a flow before deleting it, otherwise, an error will be returned and the function will not delete the flow.
 * @remarks
 * If the 
 * <b>TcDeleteFlow</b> function returns ERROR_SIGNAL_PENDING, the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a> function will be called on a different thread than the thread that called the 
 * <b>TcDeleteFlow</b> function.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcDeleteFlow</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} FlowHandle Handle for the flow, as received from a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> function.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SIGNAL_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function is being executed asynchronously; the client will be called back through the client-exposed 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nc-traffic-tci_del_flow_complete_handler">ClDeleteFlowComplete</a> function when the flow has been added, or when the process has been completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The flow handle is invalid or <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_READY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Action performed on the flow by a previous function call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcmodifyflow">TcModifyFlow</a>, 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcdeleteflow">TcDeleteFlow</a>, or 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddflow">TcAddFlow</a> has not yet completed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_TC_SUPPORTED_OBJECTS_EXIST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * At least one filter associated with this flow exists.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcdeleteflow
 * @since windows5.0
 */
export TcDeleteFlow(FlowHandle) {
    result := DllCall("TRAFFIC.dll\TcDeleteFlow", HANDLE, FlowHandle, UInt32)
    return result
}

/**
 * The TcDeleteFilter function deletes a filter previously added with the TcAddFilter function.
 * @param {HANDLE} FilterHandle Handle to the filter to be deleted, as received in a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcaddfilter">TcAddFilter</a> function.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filter handle is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcDeleteFilter</b> function requires administrative privilege.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcdeletefilter
 * @since windows5.0
 */
export TcDeleteFilter(FilterHandle) {
    result := DllCall("TRAFFIC.dll\TcDeleteFilter", HANDLE, FilterHandle, UInt32)
    return result
}

/**
 * The TcEnumerateFlows function enumerates installed flows and their associated filters on an interface.
 * @remarks
 * Do not request zero flows, or pass a buffer with a size equal to zero or pointer to a <b>NULL</b>.
 * 
 * If an enumeration token pointer has been invalidated by traffic control (due to the deletion of a flow), continuing to enumerate flows is not allowed, and the call will return ERROR_INVALID_DATA. Under this circumstance, the process of enumeration must start over. This circumstance can occur when the next flow to be enumerated is deleted while enumeration is in progress.
 * 
 * To get the total number of flows for a given interface, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcqueryinterface">TcQueryInterface</a> and specify <b>GUID_QOS_FLOW_COUNT</b>.
 * 
 * <div class="alert"><b>Note</b>  Use of the 
 * <b>TcEnumerateFlows</b> function requires administrative privilege.</div>
 * <div> </div>
 * @param {HANDLE} IfcHandle Handle associated with the interface on which flows are to be enumerated. This handle is obtained by a previous call to the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/traffic/nf-traffic-tcopeninterfacea">TcOpenInterface</a> function.
 * @param {Pointer<HANDLE>} pEnumHandle Pointer to the enumeration token, used internally by traffic control to maintain returned flow information state. 
 * 
 * 
 * 
 * 
 * For input of the initial call to 
 * <b>TcEnumerateFlows</b>, <i>pEnumToken</i> should be set to <b>NULL</b>. For input on subsequent calls, <i>pEnumToken</i> must be the value returned as the <i>pEnumToken</i> OUT parameter from the immediately preceding call to 
 * <b>TcEnumerateFlows</b>.
 * 
 * For output, <i>pEnumToken</i> is the refreshed enumeration token that must be used in the following call to 
 * <b>TcEnumerateFlows</b>.
 * @param {Pointer<Integer>} pFlowCount Pointer to the number of requested or returned flows. For input, this parameter designates the number of requested flows or it can be set to <b>0xFFFF</b> to request all flows. For output, <i>pFlowCount</i> returns the number of flows actually returned in <i>Buffer</i>.
 * @param {Pointer<Integer>} pBufSize Pointer to the size of the client-provided buffer or the number of bytes used by traffic control. For input, points to the size of <i>Buffer</i>, in bytes. For output, points to the actual amount of buffer space, in bytes, written or needed with flow enumerations.
 * @param {Pointer<ENUMERATION_BUFFER>} _Buffer Pointer to the buffer containing flow enumerations. See 
 * <a href="https://docs.microsoft.com/windows/desktop/api/traffic/ns-traffic-enumeration_buffer">ENUMERATION_BUFFER</a> for more information about flow enumerations.
 * @returns {Integer} <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>NO_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The function executed without errors.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Invalid interface handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the pointers is <b>NULL</b>, or <i>pFlowCount</i> or <i>pBufSize</i> are set to zero.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The buffer is too small to store even a single flow's information and attached filters.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system is out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration token is no longer valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/traffic/nf-traffic-tcenumerateflows
 * @since windows5.0
 */
export TcEnumerateFlows(IfcHandle, pEnumHandle, pFlowCount, pBufSize, _Buffer) {
    pFlowCountMarshal := pFlowCount is VarRef ? "uint*" : "ptr"
    pBufSizeMarshal := pBufSize is VarRef ? "uint*" : "ptr"

    result := DllCall("TRAFFIC.dll\TcEnumerateFlows", HANDLE, IfcHandle, HANDLE.Ptr, pEnumHandle, pFlowCountMarshal, pFlowCount, pBufSizeMarshal, pBufSize, ENUMERATION_BUFFER.Ptr, _Buffer, UInt32)
    return result
}

;@endregion Functions
