#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_ENGINE_OPTION.ahk" { FWPM_ENGINE_OPTION }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_CONTEXT2.ahk" { FWPM_PROVIDER_CONTEXT2 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SESSION0.ahk" { FWPM_SESSION0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_LAYER_ENUM_TEMPLATE0.ahk" { FWPM_LAYER_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\Security\PSID.ahk" { PSID }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_VIRTUAL_IF_TUNNEL_INFO0.ahk" { IPSEC_VIRTUAL_IF_TUNNEL_INFO0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT2.ahk" { FWPM_NET_EVENT2 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_CONTEXT3.ahk" { FWPM_PROVIDER_CONTEXT3 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SESSION_ENUM_TEMPLATE0.ahk" { FWPM_SESSION_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_TRAFFIC0.ahk" { IPSEC_TRAFFIC0 }
#Import "..\..\..\Win32\System\Rpc\SEC_WINNT_AUTH_IDENTITY_W.ahk" { SEC_WINNT_AUTH_IDENTITY_W }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_GETSPI1.ahk" { IPSEC_GETSPI1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_CONTEXT1.ahk" { IPSEC_SA_CONTEXT1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_STATISTICS1.ahk" { IPSEC_STATISTICS1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_DOSP_STATE_ENUM_TEMPLATE0.ahk" { IPSEC_DOSP_STATE_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_CONNECTION_ENUM_TEMPLATE0.ahk" { FWPM_CONNECTION_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SERVICE_STATE.ahk" { FWPM_SERVICE_STATE }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_CONTEXT0.ahk" { IPSEC_SA_CONTEXT0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT3.ahk" { FWPM_NET_EVENT3 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_CONTEXT1.ahk" { FWPM_PROVIDER_CONTEXT1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT5.ahk" { FWPM_NET_EVENT5 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_DOSP_STATISTICS0.ahk" { IPSEC_DOSP_STATISTICS0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_DETAILS0.ahk" { IPSEC_SA_DETAILS0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_SA_DETAILS1.ahk" { IKEEXT_SA_DETAILS1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_FILTER0.ahk" { FWPM_FILTER0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_SA_DETAILS0.ahk" { IKEEXT_SA_DETAILS0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_LAYER0.ahk" { FWPM_LAYER0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SUBLAYER0.ahk" { FWPM_SUBLAYER0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_CONTEXT_ENUM_TEMPLATE0.ahk" { IPSEC_SA_CONTEXT_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_TRAFFIC1.ahk" { IPSEC_TRAFFIC1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_ENUM_TEMPLATE0.ahk" { IPSEC_SA_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT1.ahk" { FWPM_NET_EVENT1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT4.ahk" { FWPM_NET_EVENT4 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_DETAILS1.ahk" { IPSEC_SA_DETAILS1 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_STATISTICS1.ahk" { IKEEXT_STATISTICS1 }
#Import "..\..\..\Win32\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_FILTER_CONDITION0.ahk" { FWPM_FILTER_CONDITION0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.ahk" { FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_SA_DETAILS2.ahk" { IKEEXT_SA_DETAILS2 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_CONNECTION0.ahk" { FWPM_CONNECTION0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_BUNDLE0.ahk" { IPSEC_SA_BUNDLE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_CALLOUT_ENUM_TEMPLATE0.ahk" { FWPM_CALLOUT_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_CALLOUT0.ahk" { FWPM_CALLOUT0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_SUBLAYER_ENUM_TEMPLATE0.ahk" { FWPM_SUBLAYER_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_STATISTICS0.ahk" { IKEEXT_STATISTICS0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT_ENUM_TEMPLATE0.ahk" { FWPM_NET_EVENT_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_GETSPI0.ahk" { IPSEC_GETSPI0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_CONTEXT0.ahk" { FWPM_PROVIDER_CONTEXT0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_FILTER_ENUM_TEMPLATE0.ahk" { FWPM_FILTER_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_NET_EVENT0.ahk" { FWPM_NET_EVENT0 }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Win32\Security\SID.ahk" { SID }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_DOSP_STATE0.ahk" { IPSEC_DOSP_STATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IKEEXT_SA_ENUM_TEMPLATE0.ahk" { IKEEXT_SA_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_STATISTICS0.ahk" { IPSEC_STATISTICS0 }
#Import "..\..\..\Win32\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER_ENUM_TEMPLATE0.ahk" { FWPM_PROVIDER_ENUM_TEMPLATE0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWPM_PROVIDER0.ahk" { FWPM_PROVIDER0 }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\FWP_VALUE0.ahk" { FWP_VALUE0 }
#Import "..\..\..\Win32\Security\ACL.ahk" { ACL }
#Import "..\..\..\Win32\NetworkManagement\WindowsFilteringPlatform\IPSEC_SA_BUNDLE1.ahk" { IPSEC_SA_BUNDLE1 }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.NetworkManagement.WindowsFilteringPlatform
 */

;@region Functions
/**
 * Is used to release memory resources allocated by the Windows Filtering Platform (WFP) functions.
 * @remarks
 * <b>FwpmFreeMemory0</b> is used to free memory returned by the various <b>Fwpm*</b> functions, such as <b>FwpmFilterGetByKey0</b>.
 * 
 * <b>Fwpm*</b> functions that return a HANDLE, such as <b>FwpmCalloutCreateEnumHandle0</b>, have specific functions to release memory.
 * 
 * If the caller passes a pointer that is not valid, the behavior is undefined.
 * 
 * <b>FwpmFreeMemory0</b> is a specific implementation of FwpmFreeMemory. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {Pointer<Pointer<Void>>} p Type: <b>void**</b>
 * 
 * Address of the pointer to be freed.
 * @returns {String} Nothing - always returns an empty string
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfreememory0
 */
export FwpmFreeMemory0(p) {
    pMarshal := p is VarRef ? "ptr*" : "ptr"

    DllCall("fwpuclnt.dll\FwpmFreeMemory0", pMarshal, p)
}

/**
 * 
 * @returns {FWPM_SERVICE_STATE} 
 */
export FwpmBfeStateGet0() {
    result := DllCall("fwpkclnt.sys\FwpmBfeStateGet0", FWPM_SERVICE_STATE)
    return result
}

/**
 * 
 * @param {Pointer<Void>} deviceObject 
 * @param {Pointer<FWPM_SERVICE_STATE_CHANGE_CALLBACK0>} callback 
 * @param {Pointer<Void>} _context 
 * @param {Pointer<HANDLE>} changeHandle 
 * @returns {NTSTATUS} 
 */
export FwpmBfeStateSubscribeChanges0(deviceObject, callback, _context, changeHandle) {
    deviceObjectMarshal := deviceObject is VarRef ? "ptr" : "ptr"
    _contextMarshal := _context is VarRef ? "ptr" : "ptr"

    result := DllCall("fwpkclnt.sys\FwpmBfeStateSubscribeChanges0", deviceObjectMarshal, deviceObject, "ptr", callback, _contextMarshal, _context, HANDLE.Ptr, changeHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} changeHandle 
 * @returns {NTSTATUS} 
 */
export FwpmBfeStateUnsubscribeChanges0(changeHandle) {
    result := DllCall("fwpkclnt.sys\FwpmBfeStateUnsubscribeChanges0", HANDLE, changeHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Opens a session to the filter engine.
 * @remarks
 * A user application must call <b>FwpmEngineOpen0</b> to obtain a handle for open session to the filter engine before adding or removing any filter objects. A handle for an open session to the filter engine is also required for most of the other Windows Filtering Platform management functions.
 * 
 * The session is automatically closed when the program ends. To explicitly close a session, call <a href="https://docs.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmengineclose0">FwpmEngineClose0</a>.
 * 
 * If <i>session</i>.<b>flags</b> is set to <b>FWPM_SESSION_FLAG_DYNAMIC</b>, any WFP objects added during the session are
 * automatically deleted when the session ends. If the session is not dynamic, the caller needs to explicitly delete all WFP objects added during the session.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_OPEN</a> access to the filter engine. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmEngineOpen0</b> is intended for use in non-impersonated mode only.
 * 
 * <b>FwpmEngineOpen0</b> is a specific implementation of FwpmEngineOpen. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {PWSTR} serverName Type: <b>const wchar_t*</b>
 * 
 * This value must be <b>NULL</b>.
 * @param {Integer} authnService Type: <b>UINT32</b>
 * 
 * Specifies the authentication service to use. Allowed services are RPC_C_AUTHN_WINNT and RPC_C_AUTHN_DEFAULT.
 * @param {Pointer<SEC_WINNT_AUTH_IDENTITY_W>} authIdentity Type: <b><a href="https://docs.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-sec_winnt_auth_identity_a">SEC_WINNT_AUTH_IDENTITY_A</a>*</b>
 * 
 * The authentication and authorization credentials for accessing the filter engine. This pointer is optional and can be <b>NULL</b>. If this pointer is <b>NULL</b>, the calling thread's credentials are used.
 * @param {Pointer<FWPM_SESSION0>} session Type: [FWPM_SESSION0](/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_session0)*</b>
 * 
 * Session-specific parameters for the session being opened. This pointer is optional and can be <b>NULL</b>.
 * @param {Pointer<HANDLE>} engineHandle Type: <b>HANDLE*</b>
 * 
 * Handle for the open session to the filter engine.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The session was started successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_ALREADY_EXISTS</b></dt>
 * <dt>0x80320009</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A session with the specified <b>sessionKey</b> is already opened.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmengineopen0
 */
export FwpmEngineOpen0(serverName, authnService, authIdentity, session, engineHandle) {
    serverName := serverName is String ? StrPtr(serverName) : serverName

    result := DllCall("fwpuclnt.dll\FwpmEngineOpen0", "ptr", serverName, "uint", authnService, SEC_WINNT_AUTH_IDENTITY_W.Ptr, authIdentity, FWPM_SESSION0.Ptr, session, HANDLE.Ptr, engineHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Closes a session to a filter engine.
 * @remarks
 * After an application has completed adding or removing system objects, it may call the <b>FwpmEngineClose0</b> function to close the open session to the filter engine.
 * 
 * A filter engine session is also closed when a client process terminates.
 * 
 * If this function is called with a transaction in progress, the transaction will be aborted.
 * 
 * <b>FwpmEngineClose0</b> is a specific implementation of FwpmEngineClose. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The session was closed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmengineclose0
 */
export FwpmEngineClose0(engineHandle) {
    result := DllCall("fwpuclnt.dll\FwpmEngineClose0", HANDLE, engineHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a filter engine option.
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the filter engine. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmEngineGetOption0</b> is a specific implementation of FwpmEngineGetOption. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {FWPM_ENGINE_OPTION} option Type: [FWPM_ENGINE_OPTION](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_engine_option)</b>
 * 
 * The option to be retrieved.
 * @param {Pointer<Pointer<FWP_VALUE0>>} value Type: [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0)**</b>
 * 
 * The option value. The data    type contained in the <i>value</i> parameter will be <b>FWP_UINT32</b>.
 * 
 * 
 * If <i>option</i> is <b>FWPM_ENGINE_COLLECT_NET_EVENTS</b>, <i>value</i> will be one of the following.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Network events are not being collected.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Network events are being collected.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmenginegetoption0
 */
export FwpmEngineGetOption0(engineHandle, option, value) {
    valueMarshal := value is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmEngineGetOption0", HANDLE, engineHandle, FWPM_ENGINE_OPTION, option, valueMarshal, value, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Changes the filter engine settings.
 * @remarks
 * This function cannot be called from within a transaction. It will fail
 * with <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. It will fail with
 * <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about sessions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_WRITE</a> access to the filter engine. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * The default settings for network event collection are as follows:
 * 
 * <ul>
 * <li>Outbound, all (unicast, multicast, and broadcast) events  are collected.</li>
 * <li>Inbound, only unicast events are collected.</li>
 * </ul>
 * Network event collection settings persist across reboots.
 * 
 * To collect inbound broadcast and/or multicast network events,
 * 
 * <ol>
 * <li>Call <b>FwpmEngineSetOption0</b> with <i>option</i> set to FWPM_ENGINE_COLLECT_NET_EVENTS and <i>newValue</i> set to 1.</li>
 * <li> Call <b>FwpmEngineSetOption0</b> with <i>option</i> set to FWPM_ENGINE_NET_EVENT_MATCH_ANY_KEYWORDS and <i>newValue</i> parameter set to FWPM_NET_EVENT_KEYWORD_INBOUND_MCAST and/or FWPM_NET_EVENT_KEYWORD_INBOUND_BCAST.</li>
 * </ol>
 * To stop collecting inbound broadcast and/or multicast network events,
 * 
 * <ul>
 * <li> Call <b>FwpmEngineSetOption0</b> with <i>option</i> set to FWPM_ENGINE_NET_EVENT_MATCH_ANY_KEYWORDS and <i>newValue</i> parameter set to 0 (zero).</li>
 * </ul>
 * Disabling and re-enabling of network event collection (FWPM_ENGINE_COLLECT_NET_EVENTS) does not reset the collection of inbound broadcast and multicast events.
 * 
 * <b>FwpmEngineSetOption0</b> is a specific implementation of FwpmEngineSetOption. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {FWPM_ENGINE_OPTION} option Type: [FWPM_ENGINE_OPTION](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_engine_option)</b>
 * 
 * The option to be set.
 * @param {Pointer<FWP_VALUE0>} newValue Type: [FWP_VALUE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_value0)*</b>
 * 
 * The new   option value. The data type contained in the <i>newValue</i> parameter should be  <b>FWP_UINT32</b>. 
 * 
 * 
 * When <i>option</i> is <b>FWPM_ENGINE_COLLECT_NET_EVENTS</b>, <i>newValue</i> should be one of the following.
 * 
 * 
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Do not collect network events.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>1</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Collect network events. This is the default setting.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The option was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmenginesetoption0
 */
export FwpmEngineSetOption0(engineHandle, option, newValue) {
    result := DllCall("fwpuclnt.dll\FwpmEngineSetOption0", HANDLE, engineHandle, FWPM_ENGINE_OPTION, option, FWP_VALUE0.Ptr, newValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for the filter engine.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmEngineGetSecurityInfo0</b> is a specific implementation of FwpmEngineGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmenginegetsecurityinfo0
 */
export FwpmEngineGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmEngineGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of the filter engine.
 * @remarks
 * <b>FwpmEngineSetSecurityInfo0</b> cannot be called from within a transaction. It will fail
 * with <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * <b>FwpmEngineSetSecurityInfo0</b> behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmEngineSetSecurityInfo0</b> is a specific implementation of FwpmEngineSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmenginesetsecurityinfo0
 */
export FwpmEngineSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmEngineSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of session objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all session objects are returned.
 * 
 * The caller must free the returned handle by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessiondestroyenumhandle0">FwpmSessionDestroyEnumHandle0</a>.
 * 
 * <b>FwpmSessionCreateEnumHandle0</b> cannot be called from within a transaction. It will fail
 * with <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the filter engine. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmSessionCreateEnumHandle0</b> is a specific implementation of FwpmSessionCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_SESSION_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_SESSION_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_session_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle for filter enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0
 */
export FwpmSessionCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmSessionCreateEnumHandle0", HANDLE, engineHandle, FWPM_SESSION_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the session enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmSessionEnum0</b> works on a snapshot of the sessions taken at the time the enumeration handle was created.
 * 
 * <b>FwpmSessionEnum0</b> is a specific implementation of FwpmSessionEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a session enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0">FwpmSessionCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of session entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_SESSION0>>>} entries Type: [FWPM_SESSION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_session0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of session objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The sessions were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsessionenum0
 */
export FwpmSessionEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmSessionEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmSessionCreateEnumHandle0.
 * @remarks
 * <b>FwpmSessionDestroyEnumHandle0</b> is a specific implementation of FwpmSessionDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a session enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsessioncreateenumhandle0">FwpmSessionCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsessiondestroyenumhandle0
 */
export FwpmSessionDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmSessionDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Begins an explicit transaction within the current session.
 * @remarks
 * This function cannot be called from within a transaction. It will fail
 * with <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * For a read-only transaction, the caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_BEGIN_READ_TXN</a> access to the filter engine. For a read/write transaction, the caller needs <b>FWPM_ACTRL_BEGIN_WRITE_TXN</b> access to the filter engine. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmTransactionBegin0</b> is a specific implementation of FwpmTransactionBegin. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} flags Type: <b>UINT32</b>
 * 
 * Possible values:
 * 
 * <table>
 * <tr>
 * <th>Transaction flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Begin read/write transaction.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TXN_READ_ONLY"></a><a id="fwpm_txn_read_only"></a><dl>
 * <dt><b>FWPM_TXN_READ_ONLY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Begin read-only transaction.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The transaction was started successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmtransactionbegin0
 */
export FwpmTransactionBegin0(engineHandle, flags) {
    result := DllCall("fwpuclnt.dll\FwpmTransactionBegin0", HANDLE, engineHandle, "uint", flags, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Commits the current transaction within the current session.
 * @remarks
 * This function can only be called from within a transaction. Otherwise, it will fail
 * with <b>FWP_E_NO_TXN_IN_PROGRESS</b>.
 * 
 * <b>FwpmTransactionCommit0</b> is a specific implementation of FwpmTransactionCommit. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The transaction was committed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmtransactioncommit0
 */
export FwpmTransactionCommit0(engineHandle) {
    result := DllCall("fwpuclnt.dll\FwpmTransactionCommit0", HANDLE, engineHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Causes the current transaction within the current session to abort and rollback.
 * @remarks
 * This function can only be called from within a transaction. Otherwise, it will fail
 * with <b>FWP_E_NO_TXN_IN_PROGRESS</b>.
 * 
 * <b>FwpmTransactionAbort0</b> is a specific implementation of FwpmTransactionAbort. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The transaction was aborted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmtransactionabort0
 */
export FwpmTransactionAbort0(engineHandle) {
    result := DllCall("fwpuclnt.dll\FwpmTransactionAbort0", HANDLE, engineHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new provider to the system.
 * @remarks
 * If the caller supplies a null security descriptor, the system will assign a default security descriptor.
 * 
 * Boot-time objects are added to the Base Filtering Engine (BFE) when the TCP/IP driver starts, and are removed once the BFE finishes initialization.  Persistent objects are added when the BFE starts. If a policy provider has a persistent policy that is not intended to be enforced if its associated service is disabled, the caller can specify an optional service name in the [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0) structure.  This service then owns the persistent policy object.  At start, the BFE only adds the following types of persistent objects to the system.
 * 
 * <ul>
 * <li>The object is not associated with a provider.</li>
 * <li>The object has an associated provider that does not specify a service name.</li>
 * <li>The object has an associated provider and an associated service set to auto-start.</li>
 * </ul>
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the provider's container.  See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderAdd0</b> is a specific implementation of FwpmProviderAdd. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER0>} provider Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)*</b>
 * 
 * The provider object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * Security information for the provider object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovideradd0
 */
export FwpmProviderAdd0(engineHandle, provider, sd) {
    result := DllCall("fwpuclnt.dll\FwpmProviderAdd0", HANDLE, engineHandle, FWPM_PROVIDER0.Ptr, provider, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a provider from the system.
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the provider. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderDeleteByKey0</b> is a specific implementation of FwpmProviderDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the object being removed from the system. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmproviderdeletebykey0
 */
export FwpmProviderDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmProviderDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider.
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderGetByKey0</b> is a specific implementation of FwpmProviderGetByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * A runtime identifier for the desired object. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a>.
 * @param {Pointer<Pointer<FWPM_PROVIDER0>>} provider Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)**</b>
 * 
 * The provider information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidergetbykey0
 */
export FwpmProviderGetByKey0(engineHandle, key, provider) {
    providerMarshal := provider is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, providerMarshal, provider, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of providers.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all providers are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to  <b>FwpmProviderCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call  <b>FwpmProviderCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmproviderenum0">FwpmProviderEnum0</a> from within the same explicit transaction.
 * 
 * The caller must free the returned handle by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmproviderdestroyenumhandle0">FwpmProviderDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the providers' containers and <b>FWPM_ACTRL_READ</b> access to the providers. Only providers to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderCreateEnumHandle0</b> is a specific implementation of FwpmProviderCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_PROVIDER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle for provider enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0
 */
export FwpmProviderCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmProviderCreateEnumHandle0", HANDLE, engineHandle, FWPM_PROVIDER_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the provider enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmProviderEnum0</b> works on a snapshot of the providers taken at the time the enumeration handle was created.
 * 
 * <b>FwpmProviderEnum0</b> is a specific implementation of FwpmProviderEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a provider  enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0">FwpmProviderCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of provider entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER0>>>} entries Type: [FWPM_PROVIDER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of provider objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The providers were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmproviderenum0
 */
export FwpmProviderEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmProviderCreateEnumHandle0.
 * @remarks
 * <b>FwpmProviderDestroyEnumHandle0</b> is a specific implementation of FwpmProviderDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a provider enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercreateenumhandle0">FwpmProviderCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmproviderdestroyenumhandle0
 */
export FwpmProviderDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmProviderDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a provider object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the providers container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmProviderGetSecurityInfoByKey0</b> is a specific implementation of FwpmProviderGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 *  Unique key of the object of interest. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidergetsecurityinfobykey0
 */
export FwpmProviderGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a provider object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the providers container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmProviderSetSecurityInfoByKey0</b> is a specific implementation of FwpmProviderSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 *  Unique identifier of the provider. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovideradd0">FwpmProviderAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidersetsecurityinfobykey0
 */
export FwpmProviderSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmProviderSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new provider context to the system. (FwpmProviderContextAdd0)
 * @remarks
 * Some fields in the [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0) structure are assigned by the system, not the caller, and are ignored in the call to <b>FwpmProviderContextAdd0</b>. 
 * 
 * If the caller supplies a <b>NULL</b> security descriptor, the system will assign a default security descriptor.
 * 
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the provider context's container and <b>FWPM_ACTRL_ADD_LINK</b> access to the provider (if any).  See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)*</b>
 * 
 * The provider context object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * Security information associated with the provider context object.
 * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
 * 
 * Pointer to a variable that receives a runtime identifier for this provider context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * <dt>0x32</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The [FWPM_IPSEC_IKE_MM_CONTEXT](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type)and     the [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
 *       the registry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0
 */
export FwpmProviderContextAdd0(engineHandle, providerContext, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd0", HANDLE, engineHandle, FWPM_PROVIDER_CONTEXT0.Ptr, providerContext, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new provider context to the system. (FwpmProviderContextAdd1)
 * @remarks
 * Some fields in the [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1) structure are assigned by the system, not the caller, and are ignored in the call to <b>FwpmProviderContextAdd1</b>. 
 * 
 * If the caller supplies a <b>NULL</b> security descriptor, the system will assign a default security descriptor.
 * 
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the provider context's container and <b>FWPM_ACTRL_ADD_LINK</b> access to the provider (if any).  See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)*</b>
 * 
 * The provider context object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * Security information associated with the provider context object.
 * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
 * 
 * Pointer to a variable that receives a runtime identifier for this provider context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * <dt>0x32</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
 *       the registry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd1
 */
export FwpmProviderContextAdd1(engineHandle, providerContext, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd1", HANDLE, engineHandle, FWPM_PROVIDER_CONTEXT1.Ptr, providerContext, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new provider context to the system. (FwpmProviderContextAdd2)
 * @remarks
 * Some fields in the [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2) structure are assigned by the system, not the caller, and are ignored in the call to <b>FwpmProviderContextAdd2</b>. 
 * 
 * If the caller supplies a <b>NULL</b> security descriptor, the system will assign a default security descriptor.
 * 
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the provider context's container and <b>FWPM_ACTRL_ADD_LINK</b> access to the provider (if any).  See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
 * 
 * The provider context object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * Security information associated with the provider context object.
 * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
 * 
 * Pointer to a variable that receives a runtime identifier for this provider context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
 * <dt>0x32</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The [FWPM_IPSEC_IKE_MM_CONTEXT](/windows/desktop/api/fwpmtypes/ne-fwpmtypes-fwpm_provider_context_type)and     the [IKEEXT_IPV6_CGA](/windows/desktop/api/iketypes/ne-iketypes-ikeext_authentication_method_type) authentication method in the <b>authenticationMethods</b> array, but cryptographically generated address (CGA) is not enabled in
 *       the registry.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd2
 */
export FwpmProviderContextAdd2(engineHandle, providerContext, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd2", HANDLE, engineHandle, FWPM_PROVIDER_CONTEXT2.Ptr, providerContext, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} providerContext 
 * @param {PSECURITY_DESCRIPTOR} sd 
 * @param {Pointer<Integer>} id 
 * @returns {NTSTATUS} 
 */
export FwpmProviderContextAdd3(engineHandle, providerContext, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextAdd3", HANDLE, engineHandle, FWPM_PROVIDER_CONTEXT3.Ptr, providerContext, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a provider context from the system .
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderContextDeleteById0</b> is a specific implementation of FwpmProviderContextDeleteById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the object  being removed from the system. This is the runtime identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextdeletebyid0
 */
export FwpmProviderContextDeleteById0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\FwpmProviderContextDeleteById0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a provider context from the system.
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderContextDeleteByKey0</b> is a specific implementation of FwpmProviderContextDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the object being removed from the system. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextdeletebykey0
 */
export FwpmProviderContextDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmProviderContextDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetById0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid0
 */
export FwpmProviderContextGetById0(engineHandle, id, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById0", HANDLE, engineHandle, "uint", id, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetById1)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd1">FwpmProviderContextAdd1</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid1
 */
export FwpmProviderContextGetById1(engineHandle, id, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById1", HANDLE, engineHandle, "uint", id, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetById2)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A run-time identifier for the desired object. This must be the run-time identifier that was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd2">FwpmProviderContextAdd2</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbyid2
 */
export FwpmProviderContextGetById2(engineHandle, id, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById2", HANDLE, engineHandle, "uint", id, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {Integer} id 
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>} providerContext 
 * @returns {NTSTATUS} 
 */
export FwpmProviderContextGetById3(engineHandle, id, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetById3", HANDLE, engineHandle, "uint", id, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetByKey0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>} providerContext Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey0
 */
export FwpmProviderContextGetByKey0(engineHandle, key, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetByKey1)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd1">FwpmProviderContextAdd1</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>} providerContext Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey1
 */
export FwpmProviderContextGetByKey1(engineHandle, key, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey1", HANDLE, engineHandle, Guid.Ptr, key, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a provider context. (FwpmProviderContextGetByKey2)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd2">FwpmProviderContextAdd2</a> for this object.
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>} providerContext Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)**</b>
 * 
 * The provider context information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetbykey2
 */
export FwpmProviderContextGetByKey2(engineHandle, key, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey2", HANDLE, engineHandle, Guid.Ptr, key, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {Pointer<Guid>} key 
 * @param {Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>} providerContext 
 * @returns {NTSTATUS} 
 */
export FwpmProviderContextGetByKey3(engineHandle, key, providerContext) {
    providerContextMarshal := providerContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetByKey3", HANDLE, engineHandle, Guid.Ptr, key, providerContextMarshal, providerContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of provider contexts.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all provider contexts are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to  <b>FwpmProviderContextCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call <b>FwpmProviderContextCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextenum0">FwpmProviderContextEnum0</a> from within the same explicit transaction.
 * 
 * The caller must free the returned handle by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextdestroyenumhandle0">FwpmProviderContextDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the provider contexts' containers and <b>FWPM_ACTRL_READ</b> access to the provider contexts. Only provider contexts to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmProviderContextCreateEnumHandle0</b> is a specific implementation of FwpmProviderContextCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context_enum_template0">FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0</a>*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle for provider context enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0
 */
export FwpmProviderContextCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmProviderContextCreateEnumHandle0", HANDLE, engineHandle, FWPM_PROVIDER_CONTEXT_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the provider context enumerator. (FwpmProviderContextEnum0)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmProviderContextEnum0</b> works on a snapshot of the provider contexts taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of provider context objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT0>>>} entries Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)***</b>
 * 
 * The returned provider context objects.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of provider context objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider contexts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextenum0
 */
export FwpmProviderContextEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the provider context enumerator. (FwpmProviderContextEnum1)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmProviderContextEnum1</b> works on a snapshot of the provider contexts taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of provider context objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT1>>>} entries Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)***</b>
 * 
 * The returned provider context objects.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of provider context objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider contexts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextenum1
 */
export FwpmProviderContextEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum1", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the provider context enumerator. (FwpmProviderContextEnum2)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmProviderContextEnum2</b> works on a snapshot of the provider contexts taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of provider context objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT2>>>} entries Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)***</b>
 * 
 * The returned provider context objects.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of provider context objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The provider contexts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextenum2
 */
export FwpmProviderContextEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum2", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {HANDLE} enumHandle 
 * @param {Integer} numEntriesRequested 
 * @param {Pointer<Pointer<Pointer<FWPM_PROVIDER_CONTEXT3>>>} entries 
 * @param {Pointer<Integer>} numEntriesReturned 
 * @returns {NTSTATUS} 
 */
export FwpmProviderContextEnum3(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextEnum3", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmProviderContextCreateEnumHandle0.
 * @remarks
 * <b>FwpmProviderContextDestroyEnumHandle0</b> is a specific implementation of FwpmProviderContextDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextdestroyenumhandle0
 */
export FwpmProviderContextDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmProviderContextDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a provider context object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the provider contexts container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmProviderContextGetSecurityInfoByKey0</b> is a specific implementation of FwpmProviderContextGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the provider context. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextgetsecurityinfobykey0
 */
export FwpmProviderContextGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmProviderContextGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a provider context object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the provider contexts container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmProviderContextSetSecurityInfoByKey0</b> is a specific implementation of FwpmProviderContextSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the provider context object. This is a pointer to the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextadd0">FwpmProviderContextAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmprovidercontextsetsecurityinfobykey0
 */
export FwpmProviderContextSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmProviderContextSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new sublayer to the system.
 * @remarks
 * If the caller supplies a null security descriptor, the system will assign a default security descriptor.
 * 
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the sublayers's container and <b>FWPM_ACTRL_ADD_LINK</b> access to the provider (if any).  See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmSubLayerAdd0</b> is a specific implementation of FwpmSubLayerAdd. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_SUBLAYER0>} subLayer Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)*</b>
 * 
 * The sublayer to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * Security information for the sublayer object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The sublayer was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayeradd0
 */
export FwpmSubLayerAdd0(engineHandle, subLayer, sd) {
    result := DllCall("fwpuclnt.dll\FwpmSubLayerAdd0", HANDLE, engineHandle, FWPM_SUBLAYER0.Ptr, subLayer, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Deletes a sublayer from the system by its key.
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the sub-layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmSubLayerDeleteByKey0</b> is a specific implementation of FwpmSubLayerDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the sublayer to be removed from the system. This is the same GUID that was specified when the application called  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The sublayer was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayerdeletebykey0
 */
export FwpmSubLayerDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmSubLayerDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a sublayer by its key.
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the sublayer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmSubLayerGetByKey0</b> is a specific implementation of FwpmSubLayerGetByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of  the sublayer. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
 * @param {Pointer<Pointer<FWPM_SUBLAYER0>>} subLayer Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)**</b>
 * 
 * The sublayer information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The sublayer was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayergetbykey0
 */
export FwpmSubLayerGetByKey0(engineHandle, key, subLayer) {
    subLayerMarshal := subLayer is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmSubLayerGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, subLayerMarshal, subLayer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of sublayers.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all sublayers are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to   <b>FwpmSubLayerCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call <b>FwpmSubLayerCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayerenum0">FwpmSubLayerEnum0</a> from within the same explicit transaction.
 * 
 * The caller must free the returned handle by a call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayerdestroyenumhandle0">FwpmSubLayerDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the sublayers' containers and <b>FWPM_ACTRL_READ</b> access to the sub-layers. Only sublayers to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmSubLayerCreateEnumHandle0</b> is a specific implementation of FwpmSubLayerCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_SUBLAYER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_SUBLAYER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle for sublayer enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0
 */
export FwpmSubLayerCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmSubLayerCreateEnumHandle0", HANDLE, engineHandle, FWPM_SUBLAYER_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the sublayer enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmSubLayerEnum0</b> works on a snapshot of the sublayers taken at the time the enumeration handle was created.
 * 
 * <b>FwpmSubLayerEnum0</b> is a specific implementation of FwpmSubLayerEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a sublayer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0">FwpmSubLayerCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of sublayer entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_SUBLAYER0>>>} entries Type: [FWPM_SUBLAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_sublayer0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of sublayer objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The sublayers were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayerenum0
 */
export FwpmSubLayerEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmSubLayerEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmSubLayerCreateEnumHandle0.
 * @remarks
 * <b>FwpmSubLayerDestroyEnumHandle0</b> is a specific implementation of FwpmSubLayerDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a sublayer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayercreateenumhandle0">FwpmSubLayerCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayerdestroyenumhandle0
 */
export FwpmSubLayerDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmSubLayerDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a sublayer.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the sublayers container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmSubLayerGetSecurityInfoByKey0</b> is a specific implementation of FwpmSubLayerGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the sublayer. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayergetsecurityinfobykey0
 */
export FwpmSubLayerGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmSubLayerGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a sublayer.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the sublayers container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmSubLayerSetSecurityInfoByKey0</b> is a specific implementation of FwpmSubLayerSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the sublayer. This must be the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmsublayeradd0">FwpmSubLayerAdd0</a>.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmsublayersetsecurityinfobykey0
 */
export FwpmSubLayerSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmSubLayerSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a layer object. (FwpmLayerGetById0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmLayerGetById0</b> is a specific implementation of FwpmLayerGetById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT16</b>
 * 
 *  Identifier of the desired layer. For a list of possible values, see <a href="https://docs.microsoft.com/windows-hardware/drivers/network/run-time-filtering-layer-identifiers">Run-time Filtering Layer Identifiers</a>  in the WDK documentation for Windows Filtering Platform.
 * @param {Pointer<Pointer<FWPM_LAYER0>>} layer Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)**</b>
 * 
 * The layer information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The layer was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayergetbyid0
 */
export FwpmLayerGetById0(engineHandle, id, layer) {
    layerMarshal := layer is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmLayerGetById0", HANDLE, engineHandle, "ushort", id, layerMarshal, layer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a layer object. (FwpmLayerGetByKey0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmLayerGetByKey0</b> is a specific implementation of FwpmLayerGetByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
 * @param {Pointer<Pointer<FWPM_LAYER0>>} layer Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)**</b>
 * 
 * The layer information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The layer was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayergetbykey0
 */
export FwpmLayerGetByKey0(engineHandle, key, layer) {
    layerMarshal := layer is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmLayerGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, layerMarshal, layer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of layer objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all layers are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to   <b>FwpmLayerCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call  <b>FwpmLayerCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayerenum0">FwpmLayerEnum0</a> from within the same explicit transaction.
 * 
 * The caller must free the returned handle by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayerdestroyenumhandle0">FwpmLayerDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the layers' containers and <b>FWPM_ACTRL_READ</b> access to the layers. Only layers to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmLayerCreateEnumHandle0</b> is a specific implementation of FwpmLayerCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_LAYER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_LAYER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle for the layer enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0
 */
export FwpmLayerCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmLayerCreateEnumHandle0", HANDLE, engineHandle, FWPM_LAYER_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the layer enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmLayerEnum0</b> is a specific implementation of FwpmLayerEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a layer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0">FwpmLayerCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of layer entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_LAYER0>>>} entries Type: [FWPM_LAYER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_layer0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of layer entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The layers were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayerenum0
 */
export FwpmLayerEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmLayerEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmFilterCreateEnumHandle0. (FwpmLayerDestroyEnumHandle0)
 * @remarks
 * <b>FwpmLayerDestroyEnumHandle0</b> is a specific implementation of FwpmLayerDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a layer enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmlayercreateenumhandle0">FwpmLayerCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayerdestroyenumhandle0
 */
export FwpmLayerDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmLayerDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a layer object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the layers container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmLayerGetSecurityInfoByKey0</b> is a specific implementation of FwpmLayerGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayergetsecurityinfobykey0
 */
export FwpmLayerGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmLayerGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a layer object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the layers container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmLayerSetSecurityInfoByKey0</b> is a specific implementation of FwpmLayerSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/management-filtering-layer-identifiers-">Filtering Layer Identifiers</a> for a list of possible GUID values.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmlayersetsecurityinfobykey0
 */
export FwpmLayerSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmLayerSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new callout object to the system.
 * @remarks
 * Some fields in the [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0) structure are assigned by the system, not the caller, and are ignored in the call to <b>FwpmCalloutAdd0</b>. If the caller supplies a null security descriptor, the system will assign a default security descriptor.
 * 
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the callout's container, 
 *    <b>FWPM_ACTRL_ADD_LINK </b> access to the provider (if any), and 
 *    <b>FWPM_ACTRL_ADD_LINK </b> access to the applicable layer. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * To add a filter that references a callout, invoke the functions in the following order.
 * 
 * <ul>
 * <li>Call <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/fwpsk/nf-fwpsk-fwpscalloutregister0">FwpsCalloutRegister</a> (documented in the Windows Driver Kit (WDK)), to register the callout with the filter engine.</li>
 * <li>Call <b>FwpmCalloutAdd0</b> to add the callout to the system.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> to add the filter that references the callout to the system.</li>
 * </ul>
 *   
 * By default filters that reference callouts that have been added but have not yet registered with the filter engine are treated as Block filters.
 * 
 * <b>FwpmCalloutAdd0</b> is a specific implementation of FwpmCalloutAdd. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_CALLOUT0>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)*</b>
 * 
 * The callout object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * The security information associated with the callout.
 * @param {Pointer<Integer>} id Type: <b>UINT32*</b>
 * 
 * Runtime identifier for this callout.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callout was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
 * <dt>0x80320035</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
 *    address were specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutadd0
 */
export FwpmCalloutAdd0(engineHandle, callout, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmCalloutAdd0", HANDLE, engineHandle, FWPM_CALLOUT0.Ptr, callout, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a callout object from the system. (FwpmCalloutDeleteById0)
 * @remarks
 * An applications's callouts cannot be removed from the system as long as there are filters in the system that specify the callouts for an action.
 * 
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the callout. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmCalloutDeleteById0</b> is a specific implementation of FwpmCalloutDeleteById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT32</b>
 * 
 * The runtime identifier for the callout being removed from the system. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callout was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutdeletebyid0
 */
export FwpmCalloutDeleteById0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\FwpmCalloutDeleteById0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a callout object from the system. (FwpmCalloutDeleteByKey0)
 * @remarks
 * An applications's callouts cannot be removed from the system as long as there are filters in the system that specify the callouts for an action.
 * 
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the callout. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmCalloutDeleteByKey0</b> is a specific implementation of FwpmCalloutDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the callout being removed from the system. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callout was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutdeletebykey0
 */
export FwpmCalloutDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmCalloutDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a callout object. (FwpmCalloutGetById0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the callout. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmCalloutGetById0</b> is a specific implementation of FwpmCalloutGetById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT32</b>
 * 
 * The runtime identifier for the callout. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_CALLOUT0>>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)**</b>
 * 
 * Information about the state associated with the callout.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callout was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutgetbyid0
 */
export FwpmCalloutGetById0(engineHandle, id, callout) {
    calloutMarshal := callout is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmCalloutGetById0", HANDLE, engineHandle, "uint", id, calloutMarshal, callout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a callout object. (FwpmCalloutGetByKey0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the callout. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmCalloutGetByKey0</b> is a specific implementation of FwpmCalloutGetByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_CALLOUT0>>} callout Type: [FWPM_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)**</b>
 * 
 * Information about the state associated with the callout.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callout was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutgetbykey0
 */
export FwpmCalloutGetByKey0(engineHandle, key, callout) {
    calloutMarshal := callout is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmCalloutGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, calloutMarshal, callout, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of callout objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all callout objects are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to <b>FwpmCalloutCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call <b>FwpmCalloutCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutenum0">FwpmCalloutEnum0</a> from within the same explicit transaction.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutdestroyenumhandle0">FwpmCalloutDestroyEnumHandle0</a> to free the returned handle.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the callouts' containers and <b>FWPM_ACTRL_READ</b> access to the callouts. Only callouts to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmCalloutCreateEnumHandle0</b> is a specific implementation of FwpmCalloutCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_CALLOUT_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_CALLOUT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle of the newly created enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0
 */
export FwpmCalloutCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmCalloutCreateEnumHandle0", HANDLE, engineHandle, FWPM_CALLOUT_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the callout enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmCalloutEnum0</b> works on a snapshot of the callouts taken at the time the enumeration handle was created.
 * 
 * <b>FwpmCalloutEnum0</b> is a specific implementation of FwpmCalloutEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a callout enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0">FwpmCalloutCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of callout objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_CALLOUT0>>>} entries Type: [FWP_CALLOUT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_callout0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of callouts returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The callouts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutenum0
 */
export FwpmCalloutEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmCalloutEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmCalloutCreateEnumHandle0.
 * @remarks
 * <b>FwpmCalloutDestroyEnumHandle0</b> is a specific implementation of FwpmCalloutDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a callout enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutcreateenumhandle0">FwpmCalloutCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutdestroyenumhandle0
 */
export FwpmCalloutDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmCalloutDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a callout object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the callouts container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmCalloutGetSecurityInfoByKey0</b> is a specific implementation of FwpmCalloutGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutgetsecurityinfobykey0
 */
export FwpmCalloutGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmCalloutGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a callout object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the callouts container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmCalloutSetSecurityInfoByKey0</b> is a specific implementation of FwpmCalloutSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the callout. This GUID was specified in the <b>calloutKey</b> member of the <i>callout</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmcalloutadd0">FwpmCalloutAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmcalloutsetsecurityinfobykey0
 */
export FwpmCalloutSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmCalloutSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new filter object to the system.
 * @remarks
 * **FwpmFilterAdd0** adds the filter to the specified sub-layer at every filtering layer in the system.
 * 
 * Some fields in the [FWPM_FILTER0](../fwpmtypes/ns-fwpmtypes-fwpm_filter0.md) structure are assigned by the system, not the caller, and are ignored in the call to **FwpmFilterAdd0**.
 * 
 * If the caller supplies a **NULL** security descriptor, the system will assign a default security descriptor.
 * 
 * To block connections to particular locations, add a [FWP_ACTION_BLOCK](../fwpmtypes/ns-fwpmtypes-fwpm_action0.md) filter specifying the local address at the [FWPM_LAYER_ALE_AUTH_CONNECT_V*](/windows/desktop/FWP/management-filtering-layer-identifiers-) layer, or add a **FWP_ACTION_BLOCK** filter without specifying the local address at the **FWPM_LAYER_ALE_RESOURCE_ASSIGNMENT_V*** layer.
 * 
 * > [!Note]
 * > If a local address is specified at the resource assignment layer, an implicit bind would succeed because address, address type, and port may come back as [FWP_EMPTY](../fwptypes/ne-fwptypes-fwp_data_type.md).
 * 
 * The [FWPM_FILTER0](../fwpmtypes/ns-fwpmtypes-fwpm_filter0.md) structure can label a filter as a boot-time or persistent filter.  Boot-time filters are added to the Base Filtering Engine (BFE) when the TCP/IP driver starts, and are removed once the BFE finishes initialization.  Persistent objects are added when the BFE starts.
 * 
 * This function cannot be called from within a read-only transaction. It will fail with **FWP_E_INCOMPATIBLE_TXN**. See [Object Management](/windows/desktop/FWP/object-management) for more information about transactions.
 * 
 * The caller needs the following access rights:
 * 
 * - [FWPM_ACTRL_ADD](/windows/desktop/FWP/access-right-identifiers) access to the filter's container
 * - [FWPM_ACTRL_ADD_LINK](/windows/desktop/FWP/access-right-identifiers) access to the provider (if any)
 * - [FWPM_ACTRL_ADD_LINK](/windows/desktop/FWP/access-right-identifiers) access to the applicable layer
 * - [FWPM_ACTRL_ADD_LINK](/windows/desktop/FWP/access-right-identifiers) access to the applicable sub-layer
 * - [FWPM_ACTRL_ADD_LINK](/windows/desktop/FWP/access-right-identifiers) access to the callout (if any)
 * - [FWPM_ACTRL_ADD_LINK](/windows/desktop/FWP/access-right-identifiers) access to the provider context (if any).
 *   
 * See [Access Control](/windows/desktop/FWP/access-control) for more information.
 * 
 * To add a filter that references a callout, invoke the functions in the following order.
 * 
 * - Call [FwpsCalloutRegister0](/windows-hardware/drivers/ddi/fwpsk/nf-fwpsk-fwpscalloutregister0) (documented in the Windows Driver Kit (WDK)), to register the callout with the filter engine.
 * - Call [FwpmCalloutAdd0](nf-fwpmu-fwpmcalloutadd0.md) to add the callout to the system.
 * - Call **FwpmFilterAdd0** to add the filter that references the callout to the system.
 * 
 * By default filters that reference callouts that have been added but have not yet registered with the filter engine are treated as Block filters.
 * 
 * **FwpmFilterAdd0** is a specific implementation of FwpmFilterAdd. See [WFP Version-Independent Names and Targeting Specific Versions of Windows](/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows)  for more information.
 * @param {HANDLE} engineHandle Type: **HANDLE**
 * 
 * Handle for an open session to the filter engine. Call  [FwpmEngineOpen0](nf-fwpmu-fwpmengineopen0.md) to open a session to the filter engine.
 * @param {Pointer<FWPM_FILTER0>} filter Type: **[FWPM_FILTER0](../fwpmtypes/ns-fwpmtypes-fwpm_filter0.md)***
 * 
 * The filter object to be added.
 * @param {PSECURITY_DESCRIPTOR} sd Type: **[SECURITY_DESCRIPTOR](../winnt/ns-winnt-security_descriptor.md)**
 * 
 * Security information about the filter object.
 * @param {Pointer<Integer>} id Type: **UINT64***
 * 
 * The runtime identifier for this filter.
 * @returns {NTSTATUS} Type: **DWORD**
 * 
 * | Return code/value | Description |
 * | ----------------- | ----------- |
 * | ERROR_SUCCESS <br/> 0 | The filter was successfully added. |
 * | ERROR_INVALID_SECURITY_DESCR <br/> 0x8007053A | The security descriptor structure is invalid. Or, a filter condition contains a security descriptor in absolute format. |
 * | FWP_E_CALLOUT_NOTIFICATION_FAILED <br/> 0x80320037 | The caller added a callout filter and the callout returned an error from its notification routine. |
 * | FWP_E_* error code <br/> 0x80320001—0x80320039 | A Windows Filtering Platform (WFP) specific error. See [WFP Error Codes](/windows/desktop/FWP/wfp-error-codes) for details. |
 * | RPC_* error code <br/> 0x80010001—0x80010122 | Failure to communicate with the remote or local firewall engine. |
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilteradd0
 */
export FwpmFilterAdd0(engineHandle, filter, sd, id) {
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmFilterAdd0", HANDLE, engineHandle, FWPM_FILTER0.Ptr, filter, PSECURITY_DESCRIPTOR, sd, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a filter object from the system. (FwpmFilterDeleteById0)
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the filter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmFilterDeleteById0</b> is a specific implementation of FwpmFilterDeleteById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * Runtime identifier for the object  being removed from the system. This value is returned by the  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> function.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filter was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilterdeletebyid0
 */
export FwpmFilterDeleteById0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\FwpmFilterDeleteById0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes a filter object from the system. (FwpmFilterDeleteByKey0)
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail with
 * <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the filter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmFilterDeleteByKey0</b> is a specific implementation of FwpmFilterDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the object being removed from the system. This is the same GUID that was specified when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filter was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilterdeletebykey0
 */
export FwpmFilterDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmFilterDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a filter object. (FwpmFilterGetById0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the filter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmFilterGetById0</b> is a specific implementation of FwpmFilterGetById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the desired object. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_FILTER0>>} filter Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)**</b>
 * 
 * The filter information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filter was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfiltergetbyid0
 */
export FwpmFilterGetById0(engineHandle, id, filter) {
    filterMarshal := filter is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmFilterGetById0", HANDLE, engineHandle, "uint", id, filterMarshal, filter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a filter object. (FwpmFilterGetByKey0)
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the filter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmFilterGetByKey0</b> is a specific implementation of FwpmFilterGetByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
 * @param {Pointer<Pointer<FWPM_FILTER0>>} filter Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)**</b>
 * 
 * The filter information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filter was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfiltergetbykey0
 */
export FwpmFilterGetByKey0(engineHandle, key, filter) {
    filterMarshal := filter is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmFilterGetByKey0", HANDLE, engineHandle, Guid.Ptr, key, filterMarshal, filter, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of filter objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all filters are returned.
 * 
 * The enumerator is not "live", meaning it does not reflect changes made to the system after the call to  <b>FwpmFilterCreateEnumHandle0</b> returns. If you need to ensure that the results are current, you must call <b>FwpmFilterCreateEnumHandle0</b> and <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilterenum0">FwpmFilterEnum0</a> from within the same explicit transaction.
 * 
 * The caller must free the returned handle by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilterdestroyenumhandle0">FwpmFilterDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the filters' containers and <b>FWPM_ACTRL_READ</b> access to the filters. Only filters to which the caller has <b>FWPM_ACTRL_READ</b> access will be returned. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmFilterCreateEnumHandle0</b> is a specific implementation of FwpmFilterCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_FILTER_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_FILTER_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * The handle for filter enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0
 */
export FwpmFilterCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmFilterCreateEnumHandle0", HANDLE, engineHandle, FWPM_FILTER_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the filter enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmFilterEnum0</b> works on a snapshot of the filters taken at the time the enumeration handle was created.
 * 
 * <b>FwpmFilterEnum0</b> is a specific implementation of FwpmFilterEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a filter enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0">FwpmFilterCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of filter objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_FILTER0>>>} entries Type: [FWPM_FILTER0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter0)***</b>
 * 
 * Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of filter objects returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The filters were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilterenum0
 */
export FwpmFilterEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmFilterEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmFilterCreateEnumHandle0. (FwpmFilterDestroyEnumHandle0)
 * @remarks
 * <b>FwpmFilterDestroyEnumHandle0</b> is a specific implementation of FwpmFilterDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a filter enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfiltercreateenumhandle0">FwpmFilterCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfilterdestroyenumhandle0
 */
export FwpmFilterDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmFilterDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a filter object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the filters container.
 * 
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmFilterGetSecurityInfoByKey0</b> is a specific implementation of FwpmFilterGetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfiltergetsecurityinfobykey0
 */
export FwpmFilterGetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmFilterGetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a filter object.
 * @remarks
 * If the <i>key</i> parameter is <b>NULL</b> or if it is  a <b>NULL</b> GUID, this function manages the security information of the filters container.
 * 
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function can be called within a dynamic session if the corresponding object was added during the same session. If this function is called for an object that was added during a different dynamic session, it will fail with <b>FWP_E_WRONG_SESSION</b>. If this function is called for an object that was not added during a dynamic session, it will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmFilterSetSecurityInfoByKey0</b> is a specific implementation of FwpmFilterSetSecurityInfoByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the filter. This GUID was specified in the <b>filterKey</b> member of the <i>filter</i> parameter when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfilteradd0">FwpmFilterAdd0</a> for this object.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmfiltersetsecurityinfobykey0
 */
export FwpmFilterSetSecurityInfoByKey0(engineHandle, key, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmFilterSetSecurityInfoByKey0", HANDLE, engineHandle, Guid.Ptr, key, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new Internet Protocol Security (IPsec) tunnel mode policy to the system. (FwpmIpsecTunnelAdd0)
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} flags Type: <b>UINT32</b>
 * 
 * Possible values:
 * 
 * <table>
 * <tr>
 * <th>IPsec tunnel flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TUNNEL_FLAG_POINT_TO_POINT"></a><a id="fwpm_tunnel_flag_point_to_point"></a><dl>
 * <dt><b>FWPM_TUNNEL_FLAG_POINT_TO_POINT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds a point-to-point tunnel to the system.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} mainModePolicy Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)*</b>
 * 
 * The Main Mode policy for the IPsec tunnel.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT0>} tunnelPolicy Type: [FWPM_PROVIDER_CONTEXT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context0)*</b>
 * 
 * The Quick Mode policy for the IPsec tunnel.
 * @param {Integer} numFilterConditions Type: <b>UINT32</b>
 * 
 * Number of filter conditions present in the <i>filterConditions</i> parameter.
 * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions Type: [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0)*</b>
 * 
 * Array of filter conditions that describe the traffic which should be tunneled by IPsec.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * The security information associated with the IPsec tunnel.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec tunnel mode policy was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
 * <dt>0x80320035</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
 *    address were specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneladd0
 */
export FwpmIPsecTunnelAdd0(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, sd) {
    result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd0", HANDLE, engineHandle, "uint", flags, FWPM_PROVIDER_CONTEXT0.Ptr, mainModePolicy, FWPM_PROVIDER_CONTEXT0.Ptr, tunnelPolicy, "uint", numFilterConditions, FWPM_FILTER_CONDITION0.Ptr, filterConditions, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new Internet Protocol Security (IPsec) tunnel mode policy to the system. (FwpmIpsecTunnelAdd1)
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>.  See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} flags Type: <b>UINT32</b>
 * 
 * Possible values:
 * 
 * <table>
 * <tr>
 * <th>IPsec tunnel flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TUNNEL_FLAG_POINT_TO_POINT"></a><a id="fwpm_tunnel_flag_point_to_point"></a><dl>
 * <dt><b>FWPM_TUNNEL_FLAG_POINT_TO_POINT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds a point-to-point tunnel to the system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING"></a><a id="fwpm_tunnel_flag_enable_virtual_if_tunneling"></a><dl>
 * <dt><b>FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables virtual interface-based IPsec tunnel mode.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} mainModePolicy Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)*</b>
 * 
 * The Main Mode policy for the IPsec tunnel.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT1>} tunnelPolicy Type: [FWPM_PROVIDER_CONTEXT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context1)*</b>
 * 
 * The Quick Mode policy for the IPsec tunnel.
 * @param {Integer} numFilterConditions Type: <b>UINT32</b>
 * 
 * Number of filter conditions present in the <i>filterConditions</i> parameter.
 * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions Type: <b>const FWPM_FILTER_CONDITION0*</b>
 * 
 * Array of filter conditions that describe the traffic which should be tunneled by IPsec.
 * @param {Pointer<Guid>} keyModKey Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the keying module key.
 * 
 * If the caller supplies this parameter, only that keying module will be used for the tunnel. Otherwise, the default keying policy applies.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * The security information associated with the IPsec tunnel.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec tunnel mode policy was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
 * <dt>0x80320035</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
 *    address were specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneladd1
 */
export FwpmIPsecTunnelAdd1(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
    result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd1", HANDLE, engineHandle, "uint", flags, FWPM_PROVIDER_CONTEXT1.Ptr, mainModePolicy, FWPM_PROVIDER_CONTEXT1.Ptr, tunnelPolicy, "uint", numFilterConditions, FWPM_FILTER_CONDITION0.Ptr, filterConditions, Guid.Ptr, keyModKey, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Adds a new Internet Protocol Security (IPsec) tunnel mode policy to the system. (FwpmIPsecTunnelAdd2)
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>.  See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} flags Type: <b>UINT32</b>
 * 
 * Possible values:
 * 
 * <table>
 * <tr>
 * <th>IPsec tunnel flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TUNNEL_FLAG_POINT_TO_POINT"></a><a id="fwpm_tunnel_flag_point_to_point"></a><dl>
 * <dt><b>FWPM_TUNNEL_FLAG_POINT_TO_POINT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Adds a point-to-point tunnel to the system.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING"></a><a id="fwpm_tunnel_flag_enable_virtual_if_tunneling"></a><dl>
 * <dt><b>FWPM_TUNNEL_FLAG_ENABLE_VIRTUAL_IF_TUNNELING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Enables virtual interface-based IPsec tunnel mode.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} mainModePolicy Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
 * 
 * The Main Mode policy for the IPsec tunnel.
 * @param {Pointer<FWPM_PROVIDER_CONTEXT2>} tunnelPolicy Type: [FWPM_PROVIDER_CONTEXT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_provider_context2)*</b>
 * 
 * The Quick Mode policy for the IPsec tunnel.
 * @param {Integer} numFilterConditions Type: <b>UINT32</b>
 * 
 * Number of filter conditions present in the <i>filterConditions</i> parameter.
 * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions Type: [FWPM_FILTER_CONDITION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_filter_condition0)*</b>
 * 
 * Array of filter conditions that describe the traffic which should be tunneled by IPsec.
 * @param {Pointer<Guid>} keyModKey Type: <b>const GUID*</b>
 * 
 * Pointer to a GUID that uniquely identifies the keying module key.
 * 
 * If the caller supplies this parameter, only that keying module will be used for the tunnel. Otherwise, the default keying policy applies.
 * @param {PSECURITY_DESCRIPTOR} sd Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a></b>
 * 
 * The security information associated with the IPsec tunnel.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec tunnel mode policy was successfully added.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_INVALID_PARAMETER</b></dt>
 * <dt>0x80320035</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * FWPM_TUNNEL_FLAG_POINT_TO_POINT was not set and conditions other than local/remote
 *    address were specified.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneladd2
 */
export FwpmIPsecTunnelAdd2(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
    result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd2", HANDLE, engineHandle, "uint", flags, FWPM_PROVIDER_CONTEXT2.Ptr, mainModePolicy, FWPM_PROVIDER_CONTEXT2.Ptr, tunnelPolicy, "uint", numFilterConditions, FWPM_FILTER_CONDITION0.Ptr, filterConditions, Guid.Ptr, keyModKey, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {Integer} flags 
 * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} mainModePolicy 
 * @param {Pointer<FWPM_PROVIDER_CONTEXT3>} tunnelPolicy 
 * @param {Integer} numFilterConditions 
 * @param {Pointer<FWPM_FILTER_CONDITION0>} filterConditions 
 * @param {Pointer<Guid>} keyModKey 
 * @param {PSECURITY_DESCRIPTOR} sd 
 * @returns {NTSTATUS} 
 */
export FwpmIPsecTunnelAdd3(engineHandle, flags, mainModePolicy, tunnelPolicy, numFilterConditions, filterConditions, keyModKey, sd) {
    result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelAdd3", HANDLE, engineHandle, "uint", flags, FWPM_PROVIDER_CONTEXT3.Ptr, mainModePolicy, FWPM_PROVIDER_CONTEXT3.Ptr, tunnelPolicy, "uint", numFilterConditions, FWPM_FILTER_CONDITION0.Ptr, filterConditions, Guid.Ptr, keyModKey, PSECURITY_DESCRIPTOR, sd, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Removes an Internet Protocol Security (IPsec) tunnel mode policy from the system.
 * @remarks
 * This function cannot be called from within a read-only transaction. It will fail
 * with <b>FWP_E_INCOMPATIBLE_TXN</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * <b>FwpmIPsecTunnelDeleteByKey0</b> is a specific implementation of FwpmIPsecTunnelDeleteByKey. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<Guid>} key Type: <b>const GUID*</b>
 * 
 * Unique identifier of the IPsec tunnel.  This GUID was specified in the <b>providerContextKey</b> member of the <i>tunnelPolicy</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmipsectunneladd0">FwpmIPsecTunnelAdd0</a> function.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec tunnel mode policy was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmipsectunneldeletebykey0
 */
export FwpmIPsecTunnelDeleteByKey0(engineHandle, key) {
    result := DllCall("fwpuclnt.dll\FwpmIPsecTunnelDeleteByKey0", HANDLE, engineHandle, Guid.Ptr, key, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves Internet Protocol Security (IPsec) statistics. (IPsecGetStatistics0)
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_STATISTICS0>} ipsecStatistics Type: [IPSEC_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_statistics0)*</b>
 * 
 * Top-level object of IPsec statistics organization.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec statistics were successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecgetstatistics0
 */
export IPsecGetStatistics0(engineHandle, ipsecStatistics) {
    result := DllCall("fwpuclnt.dll\IPsecGetStatistics0", HANDLE, engineHandle, IPSEC_STATISTICS0.Ptr, ipsecStatistics, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves Internet Protocol Security (IPsec) statistics. (IPsecGetStatistics1)
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_STATISTICS1>} ipsecStatistics Type: [IPSEC_STATISTICS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_statistics1)*</b>
 * 
 * Top-level object of IPsec statistics organization.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec statistics were successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecgetstatistics1
 */
export IPsecGetStatistics1(engineHandle, ipsecStatistics) {
    result := DllCall("fwpuclnt.dll\IPsecGetStatistics1", HANDLE, engineHandle, IPSEC_STATISTICS1.Ptr, ipsecStatistics, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates an IPsec security association (SA) context. (IPsecSaContextCreate0)
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. The call will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about dynamic sessions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_TRAFFIC0>} outboundTraffic Type: [IPSEC_TRAFFIC0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0)*</b>
 * 
 * The outbound traffic of the SA.
 * @param {Pointer<Integer>} inboundFilterId Type: <b>UINT64*</b>
 * 
 *  Optional filter identifier of the cached inbound filter corresponding to the <i>outboundTraffic</i> parameter specified by the caller. Base filtering engine (BFE) may cache the inbound filter identifier and return the cached value, if available. Caller must handle the case when BFE does not have a cached value, in which case this parameter will be set to 0.
 * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
 * 
 * The identifier of the  IPsec SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0
 */
export IPsecSaContextCreate0(engineHandle, outboundTraffic, inboundFilterId, id) {
    inboundFilterIdMarshal := inboundFilterId is VarRef ? "uint*" : "ptr"
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextCreate0", HANDLE, engineHandle, IPSEC_TRAFFIC0.Ptr, outboundTraffic, inboundFilterIdMarshal, inboundFilterId, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates an IPsec security association (SA) context. (IPsecSaContextCreate1)
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. The call will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about dynamic sessions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_TRAFFIC1>} outboundTraffic Type: [IPSEC_TRAFFIC1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_traffic0)*</b>
 * 
 * The outbound traffic of the SA.
 * @param {Pointer<IPSEC_VIRTUAL_IF_TUNNEL_INFO0>} virtualIfTunnelInfo Type: [IPSEC_VIRTUAL_IF_TUNNEL_INFO0](/windows/desktop/api/fwptypes/ns-fwptypes-ipsec_virtual_if_tunnel_info0)*</b>
 * 
 * Details related to virtual interface tunneling.
 * @param {Pointer<Integer>} inboundFilterId Type: <b>UINT64*</b>
 * 
 *  Optional filter identifier of the cached inbound filter corresponding to the <i>outboundTraffic</i> parameter specified by the caller. Base filtering engine (BFE) may cache the inbound filter identifier and return the cached value, if available. Caller must handle the case when BFE does not have a cached value, in which case this parameter will be set to 0.
 * @param {Pointer<Integer>} id Type: <b>UINT64*</b>
 * 
 * The identifier of the  IPsec SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1
 */
export IPsecSaContextCreate1(engineHandle, outboundTraffic, virtualIfTunnelInfo, inboundFilterId, id) {
    inboundFilterIdMarshal := inboundFilterId is VarRef ? "uint*" : "ptr"
    idMarshal := id is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextCreate1", HANDLE, engineHandle, IPSEC_TRAFFIC1.Ptr, outboundTraffic, IPSEC_VIRTUAL_IF_TUNNEL_INFO0.Ptr, virtualIfTunnelInfo, inboundFilterIdMarshal, inboundFilterId, idMarshal, id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Deletes an IPsec security association (SA) context.
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. The call will fail with <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about dynamic sessions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecSaContextDeleteById0</b> is a specific implementation of IPsecSaContextDeleteById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the object being removed from the system.  This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextdeletebyid0
 */
export IPsecSaContextDeleteById0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextDeleteById0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves an IPsec security association (SA) context. (IPsecSaContextGetById0)
 * @remarks
 * The caller must free the returned object, <i>saContext</i>,  by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @param {Pointer<Pointer<IPSEC_SA_CONTEXT0>>} saContext Type: [IPSEC_SA_CONTEXT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context0)**</b>
 * 
 * Address of the IPsec SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextgetbyid0
 */
export IPsecSaContextGetById0(engineHandle, id, saContext) {
    saContextMarshal := saContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextGetById0", HANDLE, engineHandle, "uint", id, saContextMarshal, saContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves an IPsec security association (SA) context. (IPsecSaContextGetById1)
 * @remarks
 * The caller must free the returned object, <i>saContext</i>,  by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @param {Pointer<Pointer<IPSEC_SA_CONTEXT1>>} saContext Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)**</b>
 * 
 * Address of the IPsec SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextgetbyid1
 */
export IPsecSaContextGetById1(engineHandle, id, saContext) {
    saContextMarshal := saContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextGetById1", HANDLE, engineHandle, "uint", id, saContextMarshal, saContext, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the security parameters index (SPI) for a security association (SA) context. (IPsecSaContextGetSpi0)
 * @remarks
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @param {Pointer<IPSEC_GETSPI0>} getSpi Type: [IPSEC_GETSPI0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi0)*</b>
 * 
 * The inbound IPsec traffic.
 * @param {Pointer<Integer>} inboundSpi Type: <b>IPSEC_SA_SPI*</b>
 * 
 * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SPI for the IPsec SA context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextgetspi0
 */
export IPsecSaContextGetSpi0(engineHandle, id, getSpi, inboundSpi) {
    inboundSpiMarshal := inboundSpi is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextGetSpi0", HANDLE, engineHandle, "uint", id, IPSEC_GETSPI0.Ptr, getSpi, inboundSpiMarshal, inboundSpi, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves the security parameters index (SPI) for a security association (SA) context. (IPsecSaContextGetSpi1)
 * @remarks
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
 * @param {Pointer<IPSEC_GETSPI1>} getSpi Type: [IPSEC_GETSPI1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi1)*</b>
 * 
 * The inbound IPsec traffic.
 * @param {Pointer<Integer>} inboundSpi Type: <b>IPSEC_SA_SPI*</b>
 * 
 * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SPI for the IPsec SA context was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextgetspi1
 */
export IPsecSaContextGetSpi1(engineHandle, id, getSpi, inboundSpi) {
    inboundSpiMarshal := inboundSpi is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextGetSpi1", HANDLE, engineHandle, "uint", id, IPSEC_GETSPI1.Ptr, getSpi, inboundSpiMarshal, inboundSpi, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets the security parameters index (SPI) for a security association (SA) context.
 * @remarks
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ADD</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecSaContextSetSpi0</b> is a specific implementation of IPsecSaContextSetSpi. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for the SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
 * @param {Pointer<IPSEC_GETSPI1>} getSpi Type: [IPSEC_GETSPI1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_getspi1)*</b>
 * 
 * The inbound IPsec traffic.
 * @param {Integer} inboundSpi Type: <b>IPSEC_SA_SPI</b>
 * 
 * The inbound SA SPI. The <b>IPSEC_SA_SPI</b> data type maps to the <b>UINT32</b> data type.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SPI for the IPsec SA context was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextsetspi0
 */
export IPsecSaContextSetSpi0(engineHandle, id, getSpi, inboundSpi) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextSetSpi0", HANDLE, engineHandle, "uint", id, IPSEC_GETSPI1.Ptr, getSpi, "uint", inboundSpi, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecSaContextAddInbound0 function adds an inbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddInbound0 is the specific implementation of IPsecSaContextAddInbound used in Windows Vista.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @param {Pointer<IPSEC_SA_BUNDLE0>} inboundBundle Type: [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0)*</b>
 * 
 * The inbound IPsec SA bundle to be added to the SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA bundle was successfully added to the SA context.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextaddinbound0
 */
export IPsecSaContextAddInbound0(engineHandle, id, inboundBundle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextAddInbound0", HANDLE, engineHandle, "uint", id, IPSEC_SA_BUNDLE0.Ptr, inboundBundle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecSaContextAddOutbound0 function adds an outbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddOutbound0 is the specific implementation of IPsecSaContextAddOutbound used in Windows Vista.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @param {Pointer<IPSEC_SA_BUNDLE0>} outboundBundle Type: [IPSEC_SA_BUNDLE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle0)*</b>
 * 
 * The outbound IPsec SA bundle to be added to the SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA bundle was successfully added to the SA context.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextaddoutbound0
 */
export IPsecSaContextAddOutbound0(engineHandle, id, outboundBundle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextAddOutbound0", HANDLE, engineHandle, "uint", id, IPSEC_SA_BUNDLE0.Ptr, outboundBundle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecSaContextAddInbound1 function adds an inbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddInbound1 is the specific implementation of IPsecSaContextAddInbound used in Windows 7 and later.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
 * @param {Pointer<IPSEC_SA_BUNDLE1>} inboundBundle Type: [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1)*</b>
 * 
 * The inbound IPsec SA bundle to be added to the SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA bundle was successfully added to the SA context.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextaddinbound1
 */
export IPsecSaContextAddInbound1(engineHandle, id, inboundBundle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextAddInbound1", HANDLE, engineHandle, "uint", id, IPSEC_SA_BUNDLE1.Ptr, inboundBundle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecSaContextAddOutbound1 function adds an outbound IPsec security association (SA) bundle to an existing SA context.Note  IPsecSaContextAddOutbound1 is the specific implementation of IPsecSaContextAddOutbound used in Windows 7 and later.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * Identifier for the existing IPsec SA context. This is the value returned in the <i>id</i> parameter by the call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate1">IPsecSaContextCreate1</a>.
 * @param {Pointer<IPSEC_SA_BUNDLE1>} outboundBundle Type: [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1)*</b>
 * 
 * The outbound IPsec SA bundle to be added to the SA context.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA bundle was successfully added to the SA context.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextaddoutbound1
 */
export IPsecSaContextAddOutbound1(engineHandle, id, outboundBundle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextAddOutbound1", HANDLE, engineHandle, "uint", id, IPSEC_SA_BUNDLE1.Ptr, outboundBundle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Indicates that an IPsec security association (SA) context should be expired.
 * @remarks
 * When an SA context is expired, the corresponding outbound SA gets deleted immediately, whereas the inbound SA deletion is postponed for a minute. This allows the processing of any inbound IPsec protected traffic that may still be on the wire.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/standard-access-rights">DELETE</a> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecSaContextExpire0</b> is a specific implementation of IPsecSaContextExpire. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * A runtime identifier for SA context. This identifier was received from the system when the application called <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreate0">IPsecSaContextCreate0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was successfully expired.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextexpire0
 */
export IPsecSaContextExpire0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextExpire0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Updates an IPsec security association (SA) context.
 * @remarks
 * <b>IPsecSaContextUpdate0</b> is a specific implementation of IPsecSaContextUpdate. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} flags Type: <b>UINT32</b>
 * 
 * Flags indicating the specific field in the [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1) structure that is being updated.
 * 
 * Possible values:
 * 
 * <table>
 * <tr>
 * <th>IPsec SA flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_DETAILS_UPDATE_TRAFFIC"></a><a id="ipsec_sa_details_update_traffic"></a><dl>
 * <dt><b>IPSEC_SA_DETAILS_UPDATE_TRAFFIC</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_DETAILS_UPDATE_UDP_ENCAPSULATION"></a><a id="ipsec_sa_details_update_udp_encapsulation"></a><dl>
 * <dt><b>IPSEC_SA_DETAILS_UPDATE_UDP_ENCAPSULATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_FLAGS"></a><a id="ipsec_sa_bundle_update_flags"></a><dl>
 * <dt><b>IPSEC_SA_BUNDLE_UPDATE_FLAGS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_NAP_CONTEXT"></a><a id="ipsec_sa_bundle_update_nap_context"></a><dl>
 * <dt><b>IPSEC_SA_BUNDLE_UPDATE_NAP_CONTEXT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_KEY_MODULE_STATE"></a><a id="ipsec_sa_bundle_update_key_module_state"></a><dl>
 * <dt><b>IPSEC_SA_BUNDLE_UPDATE_KEY_MODULE_STATE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_PEER_V4_PRIVATE_ADDRESS"></a><a id="ipsec_sa_bundle_update_peer_v4_private_address"></a><dl>
 * <dt><b>IPSEC_SA_BUNDLE_UPDATE_PEER_V4_PRIVATE_ADDRESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%"><a id="IPSEC_SA_BUNDLE_UPDATE_MM_SA_ID"></a><a id="ipsec_sa_bundle_update_mm_sa_id"></a><dl>
 * <dt><b>IPSEC_SA_BUNDLE_UPDATE_MM_SA_ID</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Updates the [IPSEC_SA_BUNDLE1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_bundle1) structure.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<IPSEC_SA_CONTEXT1>} newValues Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)*</b>
 * 
 * An inbound and outbound SA pair.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA context was updated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextupdate0
 */
export IPsecSaContextUpdate0(engineHandle, flags, newValues) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextUpdate0", HANDLE, engineHandle, "uint", flags, IPSEC_SA_CONTEXT1.Ptr, newValues, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of IPsec security association (SA) context objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all IPsec SA objects are returned.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextdestroyenumhandle0">IPsecSaContextDestroyEnumHandle0</a> to free the returned handle.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> and <b>FWPM_ACTRL_READ</b> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecSaContextCreateEnumHandle0</b> is a specific implementation of IPsecSaContextCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_SA_CONTEXT_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_context_enum_template0">IPSEC_SA_CONTEXT_ENUM_TEMPLATE0</a>*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for SA context enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0
 */
export IPsecSaContextCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextCreateEnumHandle0", HANDLE, engineHandle, IPSEC_SA_CONTEXT_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IPsec security association (SA) context enumerator. (IPsecSaContextEnum0)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an SA context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of SA contexts requested.
 * @param {Pointer<Pointer<Pointer<IPSEC_SA_CONTEXT0>>>} entries Type: [IPSEC_SA_CONTEXT0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of SA contexts returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA contexts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextenum0
 */
export IPsecSaContextEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IPsec security association (SA) context enumerator. (IPsecSaContextEnum1)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an SA context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of SA contexts requested.
 * @param {Pointer<Pointer<Pointer<IPSEC_SA_CONTEXT1>>>} entries Type: [IPSEC_SA_CONTEXT1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_context1)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of SA contexts returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec SA contexts were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextenum1
 */
export IPsecSaContextEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaContextEnum1", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by IPsecSaContextCreateEnumHandle0.
 * @remarks
 * <b>IPsecSaContextDestroyEnumHandle0</b> is a specific implementation of IPsecSaContextDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of an IPsec security association (SA) context enumeration returned by <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacontextcreateenumhandle0">IPsecSaContextCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacontextdestroyenumhandle0
 */
export IPsecSaContextDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecSaContextDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of Internet Protocol Security (IPsec) security association (SA) objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all IPsec SA objects are returned.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsadestroyenumhandle0">IPsecSaDestroyEnumHandle0</a> to free the returned handle.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> and <b>FWPM_ACTRL_ENUM</b> access to the IPsec security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecSaCreateEnumHandle0</b> is a specific implementation of IPsecSaCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_SA_ENUM_TEMPLATE0>} enumTemplate Type: [IPSEC_SA_ENUM_TEMPLATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_enum_template0)*</b>
 * 
 * Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Handle of the newly created enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0
 */
export IPsecSaCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecSaCreateEnumHandle0", HANDLE, engineHandle, IPSEC_SA_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IPsec security association (SA) enumerator. (IPsecSaEnum0)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IPsecSaEnum0</b> works on a snapshot of the SAs taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IPsec SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IPSEC_SA_DETAILS0>>>} entries Type: [IPSEC_SA_DETAILS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SAs were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsaenum0
 */
export IPsecSaEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IPsec security association (SA) enumerator. (IPsecSaEnum1)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IPsecSaEnum1</b> works on a snapshot of the SAs taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IPsec SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IPSEC_SA_DETAILS1>>>} entries Type: [IPSEC_SA_DETAILS1](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_sa_details1)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SAs were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsaenum1
 */
export IPsecSaEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaEnum1", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by IPsecSaCreateEnumHandle0.
 * @remarks
 * <b>IPsecSaDestroyEnumHandle0</b> is a specific implementation of IPsecSaDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecsacreateenumhandle0">IPsecSaCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was deleted successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsadestroyenumhandle0
 */
export IPsecSaDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecSaDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for the IPsec security association (SA) database.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>IPsecSaDbGetSecurityInfo0</b> is a specific implementation of IPsecSaDbGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsadbgetsecurityinfo0
 */
export IPsecSaDbGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecSaDbGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of the IPsec security association database.
 * @remarks
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>IPsecSaDbSetSecurityInfo0</b> is a specific implementation of IPsecSaDbSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security information was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecsadbsetsecurityinfo0
 */
export IPsecSaDbSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\IPsecSaDbSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecDospGetStatistics0 function retrieves Internet Protocol Security (IPsec) DoS Protection statistics.
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IPsec DoS Protection component. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecDospGetStatistics0</b> is a specific implementation of IPsecDospGetStatistics. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_DOSP_STATISTICS0>} idpStatistics Type: [IPSEC_DOSP_STATISTICS0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_dosp_statistics0)*</b>
 * 
 * Top-level object of IPsec DoS Protection statistics organization.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The IPsec DoS Protection statistics were  successfully returned.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospgetstatistics0
 */
export IPsecDospGetStatistics0(engineHandle, idpStatistics) {
    result := DllCall("fwpuclnt.dll\IPsecDospGetStatistics0", HANDLE, engineHandle, IPSEC_DOSP_STATISTICS0.Ptr, idpStatistics, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of IPsec DoS Protection objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all IPsec DoS Protection objects are returned.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecdospstatedestroyenumhandle0">IPsecDospStateDestroyEnumHandle0</a> to free the returned handle.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IPsec DoS Protection component. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IPsecDospStateCreateEnumHandle0</b> is a specific implementation of IPsecDospStateCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<IPSEC_DOSP_STATE_ENUM_TEMPLATE0>} enumTemplate Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state_enum_template0">IPSEC_DOSP_STATE_ENUM_TEMPLATE0</a>*</b>
 * 
 * Template for selectively restricting the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for the newly created enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0
 */
export IPsecDospStateCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecDospStateCreateEnumHandle0", HANDLE, engineHandle, IPSEC_DOSP_STATE_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IPsec DoS Protection state enumerator. Each IPsec DoS Protection state entry corresponds to a flow that has successfully passed the IPsec DoS Protection authentication checks.
 * @remarks
 * If the <i>numEntries</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IPsecDospStateEnum0</b> is a specific implementation of IPsecDospStateEnum. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IPsec DoS Protection enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0">IPsecDospStateCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IPSEC_DOSP_STATE0>>>} entries Type: [IPSEC_DOSP_STATE0](/windows/desktop/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntries Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The results   were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospstateenum0
 */
export IPsecDospStateEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntries) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesMarshal := numEntries is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecDospStateEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesMarshal, numEntries, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by IPsecDospStateCreateEnumHandle0.
 * @remarks
 * <b>IPsecDospStateDestroyEnumHandle0</b> is a specific implementation of IPsecDospStateDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ipsecdospstatecreateenumhandle0">IPsecDospStateCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was deleted successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospstatedestroyenumhandle0
 */
export IPsecDospStateDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\IPsecDospStateDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for the IPsec DoS Protection database.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic. 
 * 
 * <b>IPsecDospGetSecurityInfo0</b> is a specific implementation of IPsecDospGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospgetsecurityinfo0
 */
export IPsecDospGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IPsecDospGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IPsecDospSetSecurityInfo0 function sets specified security information in the security descriptor of the IPsec DoS Protection database.
 * @remarks
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>IPsecDospSetSecurityInfo0</b> is a specific implementation of IPsecDospSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security information was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ipsecdospsetsecurityinfo0
 */
export IPsecDospSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\IPsecDospSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) statistics. (IkeextGetStatistics0)
 * @remarks
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Pointer<IKEEXT_STATISTICS0>} ikeextStatistics Type: [IKEEXT_STATISTICS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_statistics0)*</b>
 * 
 * The top-level object of IKE/AuthIP statistics organization.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextgetstatistics0
 */
export IkeextGetStatistics0(engineHandle, ikeextStatistics) {
    result := DllCall("fwpuclnt.dll\IkeextGetStatistics0", HANDLE, engineHandle, IKEEXT_STATISTICS0.Ptr, ikeextStatistics, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) statistics. (IkeextGetStatistics1)
 * @remarks
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ_STATS</a> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Pointer<IKEEXT_STATISTICS1>} ikeextStatistics Type: [IKEEXT_STATISTICS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_statistics1)*</b>
 * 
 * The top-level object of IKE/AuthIP statistics organization.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The information was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextgetstatistics1
 */
export IkeextGetStatistics1(engineHandle, ikeextStatistics) {
    result := DllCall("fwpuclnt.dll\IkeextGetStatistics1", HANDLE, engineHandle, IKEEXT_STATISTICS1.Ptr, ikeextStatistics, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IkeextSaDeleteById0 function removes a security association (SA) from the database.
 * @remarks
 * <b>IkeextSaDeleteById0</b> is a specific implementation of IkeextSaDeleteById. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * The SA identifier.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SA was removed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsadeletebyid0
 */
export IkeextSaDeleteById0(engineHandle, id) {
    result := DllCall("fwpuclnt.dll\IkeextSaDeleteById0", HANDLE, engineHandle, "uint", id, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves an IKE/AuthIP security association (SA) from the database. (IkeextSaGetById0)
 * @remarks
 * The caller must free <i>sa</i> by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * The SA identifier.
 * @param {Pointer<Pointer<IKEEXT_SA_DETAILS0>>} sa Type: [IKEEXT_SA_DETAILS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details0)**</b>
 * 
 * Address of the SA details.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SA was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsagetbyid0
 */
export IkeextSaGetById0(engineHandle, id, sa) {
    saMarshal := sa is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaGetById0", HANDLE, engineHandle, "uint", id, saMarshal, sa, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves an IKE/AuthIP security association (SA) from the database. (IkeextSaGetById1)
 * @remarks
 * The caller must free <i>sa</i> by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * The SA identifier.
 * @param {Pointer<Guid>} saLookupContext Type: <b>GUID*</b>
 * 
 * Optional pointer to the SA lookup context propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
 * @param {Pointer<Pointer<IKEEXT_SA_DETAILS1>>} sa Type: [IKEEXT_SA_DETAILS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details1)**</b>
 * 
 * Address of the SA details.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SA was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsagetbyid1
 */
export IkeextSaGetById1(engineHandle, id, saLookupContext, sa) {
    saMarshal := sa is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaGetById1", HANDLE, engineHandle, "uint", id, Guid.Ptr, saLookupContext, saMarshal, sa, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves an IKE/AuthIP security association (SA) from the database. (IkeextSaGetById2)
 * @remarks
 * The caller must free <i>sa</i> by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * The SA identifier.
 * @param {Pointer<Guid>} saLookupContext Type: <b>GUID*</b>
 * 
 * Optional pointer to the SA lookup context propagated from the SA to data connections flowing over that SA. It is made available to any application that queries socket security properties using the Winsock API <a href="https://docs.microsoft.com/windows/desktop/api/ws2tcpip/nf-ws2tcpip-wsaquerysocketsecurity">WSAQuerySocketSecurity</a> function, allowing the application to obtain detailed IPsec authentication information for its connection.
 * @param {Pointer<Pointer<IKEEXT_SA_DETAILS2>>} sa Type: [IKEEXT_SA_DETAILS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details2)**</b>
 * 
 * Address of the SA details.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SA was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsagetbyid2
 */
export IkeextSaGetById2(engineHandle, id, saLookupContext, sa) {
    saMarshal := sa is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaGetById2", HANDLE, engineHandle, "uint", id, Guid.Ptr, saLookupContext, saMarshal, sa, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of Internet Key Exchange (IKE) and Authenticated Internet Protocol (AuthIP) security association (SA) objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all IKE/AuthIP SA objects are returned.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsadestroyenumhandle0">IkeextSaDestroyEnumHandle0</a> to free the returned handle.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> and <b>FWPM_ACTRL_READ</b> access to the IKE/AuthIP security associations database. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>IkeextSaCreateEnumHandle0</b> is a specific implementation of IkeextSaCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Pointer<IKEEXT_SA_ENUM_TEMPLATE0>} enumTemplate Type: [IKEEXT_SA_ENUM_TEMPLATE0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_enum_template0)*</b>
 * 
 * Template for selectively restricting the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Address of a <b>HANDLE</b> variable. On function return, it contains the handle of the newly created enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0
 */
export IkeextSaCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\IkeextSaCreateEnumHandle0", HANDLE, engineHandle, IKEEXT_SA_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator. (IkeextSaEnum0)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IkeextSaEnum0</b> works on a snapshot of the SAs taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS0>>>} entries Type: [IKEEXT_SA_DETAILS0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details0)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SAs were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsaenum0
 */
export IkeextSaEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator. (IkeextSaEnum1)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IkeextSaEnum1</b> works on a snapshot of the SAs taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS1>>>} entries Type: [IKEEXT_SA_DETAILS1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details1)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SAs were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsaenum1
 */
export IkeextSaEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaEnum1", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the IKE/AuthIP security association (SA) enumerator. (IkeextSaEnum2)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>IkeextSaEnum2</b> works on a snapshot of the SAs taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for an IKE/AuthIP SA enumeration. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a> to obtain an enumeration handle.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<IKEEXT_SA_DETAILS2>>>} entries Type: [IKEEXT_SA_DETAILS2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_sa_details2)***</b>
 * 
 * Addresses of the enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SAs were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsaenum2
 */
export IkeextSaEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaEnum2", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by IkeextSaCreateEnumHandle0.
 * @remarks
 * <b>IkeextSaDestroyEnumHandle0</b> is a specific implementation of IkeextSaDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of the enumeration to destroy. Previously created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-ikeextsacreateenumhandle0">IkeextSaCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumeration was deleted successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsadestroyenumhandle0
 */
export IkeextSaDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\IkeextSaDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IkeextSaDbGetSecurityInfo0 function retrieves a copy of the security descriptor for a security association (SA) database.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>IkeextSaDbGetSecurityInfo0</b> is a specific implementation of IkeextSaDbGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsadbgetsecurityinfo0
 */
export IkeextSaDbGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\IkeextSaDbGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The IkeextSaDbSetSecurityInfo0 function sets specified security information in the security descriptor of the IKE/AuthIP security association database.
 * @remarks
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>IkeextSaDbSetSecurityInfo0</b> is a specific implementation of IkeextSaDbSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine generated by a previous  call to  <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a>.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security information was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-ikeextsadbsetsecurityinfo0
 */
export IkeextSaDbSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\IkeextSaDbSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of network events.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all network event objects are returned.
 * 
 * The caller must call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventdestroyenumhandle0">FwpmNetEventDestroyEnumHandle0</a> to free the returned handle.
 * 
 * This function cannot be called from within a transaction. It will fail
 * with <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the events' containers. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * 
 * <b>FwpmNetEventCreateEnumHandle0</b> is a specific implementation of FwpmNetEventCreateEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_NET_EVENT_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_NET_EVENT_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event_enum_template0)*</b>
 * 
 *   Template to selectively restrict the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * The handle for network event enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0
 */
export FwpmNetEventCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmNetEventCreateEnumHandle0", HANDLE, engineHandle, FWPM_NET_EVENT_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the network event enumerator. (FwpmNetEventEnum0)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call  that uses  the same <i>enumHandle</i> parameter will return the next set of events following those in the  current <i>entries</i> buffer.
 * 
 * <b>FwpmNetEventEnum0</b> returns only events that were logged prior to the creation of the  <i>enumHandle</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/logging">Logging</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT0>>>} entries Type: [FWPM_NET_EVENT0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event0)***</b>
 * 
 * Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network events were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
 * <dt>0x80320013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The collection of network diagnostic events is disabled.
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventenum0
 */
export FwpmNetEventEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the network event enumerator. (FwpmNetEventEnum1)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call  that uses  the same <i>enumHandle</i> parameter will return the next set of events following those in the  current <i>entries</i> buffer.
 * 
 * <b>FwpmNetEventEnum1</b> returns only events that were logged prior to the creation of the  <i>enumHandle</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/logging">Logging</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The nmber of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT1>>>} entries Type: [FWPM_NET_EVENT1](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event1)***</b>
 * 
 * Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network events were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
 * <dt>0x80320013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The collection of network diagnostic events is disabled.
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventenum1
 */
export FwpmNetEventEnum1(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum1", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the network event enumerator. (FwpmNetEventEnum2)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call  that uses  the same <i>enumHandle</i> parameter will return the next set of events following those in the  current <i>entries</i> buffer.
 * 
 * <b>FwpmNetEventEnum2</b> returns only events that were logged prior to the creation of the  <i>enumHandle</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/logging">Logging</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT2>>>} entries Type: [FWPM_NET_EVENT2](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_net_event2)***</b>
 * 
 * Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * 
 * The number of enumeration entries returned.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network events were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
 * <dt>0x80320013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The collection of network diagnostic events is disabled.
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventenum2
 */
export FwpmNetEventEnum2(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum2", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the network event enumerator. (FwpmNetEventEnum3)
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted.
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call  that uses  the same <i>enumHandle</i> parameter will return the next set of events following those in the  current <i>entries</i> buffer.
 * 
 * <b>FwpmNetEventEnum3</b> returns only events that were logged prior to the creation of the  <i>enumHandle</i> parameter. See <a href="https://docs.microsoft.com/windows/desktop/FWP/logging">Logging</a> for more information.
 * @param {HANDLE} engineHandle Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Handle for a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested The number of enumeration entries requested.
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT3>>>} entries Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned The number of enumeration entries returned.
 * @returns {NTSTATUS} <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The network events were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_NET_EVENTS_DISABLED</b></dt>
 * <dt>0x80320013</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The collection of network diagnostic events is disabled.
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmenginesetoption0">FwpmEngineSetOption0</a> to enable it.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventenum3
 */
export FwpmNetEventEnum3(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum3", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {HANDLE} enumHandle 
 * @param {Integer} numEntriesRequested 
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT4>>>} entries 
 * @param {Pointer<Integer>} numEntriesReturned 
 * @returns {NTSTATUS} 
 */
export FwpmNetEventEnum4(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum4", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {HANDLE} engineHandle 
 * @param {HANDLE} enumHandle 
 * @param {Integer} numEntriesRequested 
 * @param {Pointer<Pointer<Pointer<FWPM_NET_EVENT5>>>} entries 
 * @param {Pointer<Integer>} numEntriesReturned 
 * @returns {NTSTATUS} 
 */
export FwpmNetEventEnum5(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventEnum5", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmNetEventCreateEnumHandle0.
 * @remarks
 * <b>FwpmNetEventDestroyEnumHandle0</b> is a specific implementation of FwpmNetEventDestroyEnumHandle. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a network event enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmneteventcreateenumhandle0">FwpmNetEventCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventdestroyenumhandle0
 */
export FwpmNetEventDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmNetEventDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * The FwpmNetEventsGetSecurityInfo0 function retrieves a copy of the security descriptor for a network event object.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four (optional) returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmNetEventsGetSecurityInfo0</b> is a specific implementation of FwpmNetEventsGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * 
 * Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventsgetsecurityinfo0
 */
export FwpmNetEventsGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmNetEventsGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor of a network event object.
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. It will fail with
 * <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about sessions.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmNetEventsSetSecurityInfo0</b> is a specific implementation of FwpmNetEventsSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was set successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmneteventssetsecurityinfo0
 */
export FwpmNetEventsSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmNetEventsSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a connection object.
 * @remarks
 * The caller must free the returned object by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_READ</a> access to the provider context. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} id Type: <b>UINT64</b>
 * 
 * The run-time identifier for the connection.
 * @param {Pointer<Pointer<FWPM_CONNECTION0>>} _connection Type: [FWPM_CONNECTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0)**</b>
 * 
 * The connection information.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection object was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectiongetbyid0
 */
export FwpmConnectionGetById0(engineHandle, id, _connection) {
    _connectionMarshal := _connection is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmConnectionGetById0", HANDLE, engineHandle, "uint", id, _connectionMarshal, _connection, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Returns the next page of results from the connection object enumerator.
 * @remarks
 * If the <i>numEntriesReturned</i> is less than the <i>numEntriesRequested</i>, the enumeration is exhausted. 
 * 
 * The returned array of entries (but not the individual entries themselves) must be freed by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>.
 * 
 * A subsequent call using the same enumeration handle will return the next set of items following those in the last output buffer.
 * 
 * <b>FwpmConnectionEnum0</b> works on a snapshot of the connection objects taken at the time the enumeration handle was created.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle for a provider context enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectioncreateenumhandle0">FwpmConnectionCreateEnumHandle0</a>.
 * @param {Integer} numEntriesRequested Type: <b>UINT32</b>
 * 
 * Number of connection objects requested.
 * @param {Pointer<Pointer<Pointer<FWPM_CONNECTION0>>>} entries Type: [FWPM_CONNECTION0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection0)***</b>
 * 
 * Addresses of enumeration entries.
 * @param {Pointer<Integer>} numEntriesReturned Type: <b>UINT32*</b>
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The connection objects were enumerated successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectionenum0
 */
export FwpmConnectionEnum0(engineHandle, enumHandle, numEntriesRequested, entries, numEntriesReturned) {
    entriesMarshal := entries is VarRef ? "ptr*" : "ptr"
    numEntriesReturnedMarshal := numEntriesReturned is VarRef ? "uint*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmConnectionEnum0", HANDLE, engineHandle, HANDLE, enumHandle, "uint", numEntriesRequested, entriesMarshal, entries, numEntriesReturnedMarshal, numEntriesReturned, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Creates a handle used to enumerate a set of connection objects.
 * @remarks
 * If <i>enumTemplate</i> is <b>NULL</b>, all connection objects are returned.
 * 
 * The caller must free the returned handle by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmconnectiondestroyenumhandle0">FwpmConnectionDestroyEnumHandle0</a>.
 * 
 * The caller needs <a href="https://docs.microsoft.com/windows/desktop/FWP/access-right-identifiers">FWPM_ACTRL_ENUM</a> access to the connection objects' containers and <b>FWPM_ACTRL_READ</b> access to the connection objects. See <a href="https://docs.microsoft.com/windows/desktop/FWP/access-control">Access Control</a> for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Pointer<FWPM_CONNECTION_ENUM_TEMPLATE0>} enumTemplate Type: [FWPM_CONNECTION_ENUM_TEMPLATE0](/windows/desktop/api/fwpmtypes/ns-fwpmtypes-fwpm_connection_enum_template0)*</b>
 * 
 * Template for selectively restricting the enumeration.
 * @param {Pointer<HANDLE>} enumHandle Type: <b>HANDLE*</b>
 * 
 * Address of a <b>HANDLE</b> variable. On function return, it contains the handle for the enumeration.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was created successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectioncreateenumhandle0
 */
export FwpmConnectionCreateEnumHandle0(engineHandle, enumTemplate, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmConnectionCreateEnumHandle0", HANDLE, engineHandle, FWPM_CONNECTION_ENUM_TEMPLATE0.Ptr, enumTemplate, HANDLE.Ptr, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Frees a handle returned by FwpmConnectionCreateEnumHandle0.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {HANDLE} enumHandle Type: <b>HANDLE</b>
 * 
 * Handle of a connection object enumeration created by a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmprovidercontextcreateenumhandle0">FwpmProviderContextCreateEnumHandle0</a>.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The enumerator was successfully deleted.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectiondestroyenumhandle0
 */
export FwpmConnectionDestroyEnumHandle0(engineHandle, enumHandle) {
    result := DllCall("fwpuclnt.dll\FwpmConnectionDestroyEnumHandle0", HANDLE, engineHandle, HANDLE, enumHandle, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a connection object change event.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectiongetsecurityinfo0
 */
export FwpmConnectionGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmConnectionGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor for a connection object change event.
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. It will fail with
 * <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about sessions.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security information was successfully set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmconnectionsetsecurityinfo0
 */
export FwpmConnectionSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmConnectionSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Retrieves a copy of the security descriptor for a vSwitch event.
 * @remarks
 * The returned <i>securityDescriptor</i> parameter must be freed through a call to <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmfreememory0">FwpmFreeMemory0</a>. The other four returned parameters must not be freed, as they point to addresses within the <i>securityDescriptor</i> parameter.
 * 
 * This function behaves like the standard Win32 	<a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>GetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmvSwitchEventsGetSecurityInfo0</b> is a specific implementation of FwpmvSwitchEventsGetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * Handle for an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to retrieve.
 * @param {Pointer<PSID>} sidOwner Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The owner security identifier (SID) in the returned security descriptor.
 * @param {Pointer<PSID>} sidGroup Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">PSID</a>*</b>
 * 
 * The primary group security identifier (SID) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} dacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The discretionary access control list (DACL) in the returned security descriptor.
 * @param {Pointer<Pointer<ACL>>} sacl Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">PACL</a>*</b>
 * 
 * The system access control list (SACL) in the returned security descriptor.
 * @param {Pointer<PSECURITY_DESCRIPTOR>} _securityDescriptor Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">PSECURITY_DESCRIPTOR</a>*</b>
 * 
 * The returned security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security descriptor was successfully retrieved.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmvswitcheventsgetsecurityinfo0
 */
export FwpmvSwitchEventsGetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl, _securityDescriptor) {
    sidOwnerMarshal := sidOwner is VarRef ? "ptr*" : "ptr"
    sidGroupMarshal := sidGroup is VarRef ? "ptr*" : "ptr"
    daclMarshal := dacl is VarRef ? "ptr*" : "ptr"
    saclMarshal := sacl is VarRef ? "ptr*" : "ptr"

    result := DllCall("fwpuclnt.dll\FwpmvSwitchEventsGetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, sidOwnerMarshal, sidOwner, sidGroupMarshal, sidGroup, daclMarshal, dacl, saclMarshal, sacl, PSECURITY_DESCRIPTOR.Ptr, _securityDescriptor, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * Sets specified security information in the security descriptor for a vSwitch event.
 * @remarks
 * This function cannot be called from within a transaction. It will fail with
 * <b>FWP_E_TXN_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about transactions.
 * 
 * This function cannot be called from within a dynamic session. It will fail with
 * <b>FWP_E_DYNAMIC_SESSION_IN_PROGRESS</b>. See <a href="https://docs.microsoft.com/windows/desktop/FWP/object-management">Object Management</a> for more information about sessions.
 * 
 * This function behaves like the standard Win32 	 <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> function. The caller needs the same standard access rights as described in the <b>SetSecurityInfo</b> reference topic.
 * 
 * <b>FwpmvSwitchEventsSetSecurityInfo0</b> is a specific implementation of FwpmvSwitchEventsSetSecurityInfo. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @param {HANDLE} engineHandle Type: <b>HANDLE</b>
 * 
 * A handle to an open session to the filter engine. Call <a href="https://docs.microsoft.com/windows/desktop/api/fwpmu/nf-fwpmu-fwpmengineopen0">FwpmEngineOpen0</a> to open a session to the filter engine.
 * @param {Integer} securityInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a></b>
 * 
 * The type of security information to set.
 * @param {Pointer<SID>} sidOwner Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The owner's security identifier (SID) to be set in the security descriptor.
 * @param {Pointer<SID>} sidGroup Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a>*</b>
 * 
 * The group's SID to be set in the security descriptor.
 * @param {Pointer<ACL>} dacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The discretionary access control list (DACL) to be set in the security descriptor.
 * @param {Pointer<ACL>} sacl Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a>*</b>
 * 
 * The system access control list (SACL) to be set in the security descriptor.
 * @returns {NTSTATUS} Type: <b>DWORD</b>
 * 
 * <table>
 * <tr>
 * <th>Return code/value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * <dt>0</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The security information was successfully set.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>FWP_E_* error code</b></dt>
 * <dt>0x80320001—0x80320039</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A Windows Filtering Platform (WFP) specific error. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-error-codes">WFP Error Codes</a> for details.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>RPC_* error code</b></dt>
 * <dt>0x80010001—0x80010122</dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Failure to communicate with the remote or local firewall engine.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/fwpmu/nf-fwpmu-fwpmvswitcheventssetsecurityinfo0
 */
export FwpmvSwitchEventsSetSecurityInfo0(engineHandle, securityInfo, sidOwner, sidGroup, dacl, sacl) {
    result := DllCall("fwpuclnt.dll\FwpmvSwitchEventsSetSecurityInfo0", HANDLE, engineHandle, "uint", securityInfo, SID.Ptr, sidOwner, SID.Ptr, sidGroup, ACL.Ptr, dacl, ACL.Ptr, sacl, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

;@endregion Functions
