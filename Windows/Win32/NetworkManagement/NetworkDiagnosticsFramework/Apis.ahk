#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class NetworkDiagnosticsFramework {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NDF_ERROR_START => 63744

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_LENGTH_EXCEEDED => -2146895616

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_NOHELPERCLASS => -2146895615

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_CANCELLED => -2146895614

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_DISABLED => -2146895612

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_BAD_PARAM => -2146895611

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_VALIDATION => -2146895610

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_UNKNOWN => -2146895609

    /**
     * @type {Integer (Int32)}
     */
    static NDF_E_PROBLEM_PRESENT => -2146895608

    /**
     * @type {Integer (UInt32)}
     */
    static RF_WORKAROUND => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static RF_USER_ACTION => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static RF_USER_CONFIRMATION => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static RF_INFORMATION_ONLY => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static RF_UI_ONLY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static RF_SHOW_EVENTS => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static RF_VALIDATE_HELPTOPIC => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static RF_REPRO => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RF_CONTACT_ADMIN => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RF_RESERVED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static RF_RESERVED_CA => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RF_RESERVED_LNI => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static RCF_ISLEAF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RCF_ISCONFIRMED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RCF_ISTHIRDPARTY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DF_IMPERSONATION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DF_TRACELESS => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static NDF_INBOUND_FLAG_EDGETRAVERSAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDF_INBOUND_FLAG_HEALTHCHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NDF_ADD_CAPTURE_TRACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NDF_APPLY_INCLUSION_LIST_FILTER => 2
;@endregion Constants

;@region Methods
    /**
     * To test the NDF functionality incorporated into their application.
     * @param {Pointer<PWSTR>} helperClassName Type: <b>LPCWSTR</b>
     * 
     * The name of the helper class to be used in the diagnoses of the incident.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * A count of elements in the attributes array.
     * @param {Pointer<HELPER_ATTRIBUTE>} attributes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a>*</b>
     * 
     * The applicable <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structure.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * A handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>                NDF_E_NOHELPERCLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>helperClassName</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreateincident
     * @since windows6.0.6000
     */
    static NdfCreateIncident(helperClassName, celt, attributes, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateIncident", "ptr", helperClassName, "uint", celt, "ptr", attributes, "ptr", handle, "int")
        return result
    }

    /**
     * Provides access to the Winsock Helper Class provided by Microsoft.
     * @param {Pointer} sock Type: <b>SOCKET</b>
     * 
     * A descriptor identifying a connected socket.
     * @param {Pointer<PWSTR>} host Type: <b>LPCWSTR</b>
     * 
     * A pointer to the local host.
     * @param {Integer} port Type: <b>USHORT</b>
     * 
     * The port providing Winsock access.
     * @param {Pointer<PWSTR>} appId Type: <b>LPCWSTR</b>
     * 
     * Unique identifier associated with the application.
     * @param {Pointer<SID>} userId Type: <b>SID*</b>
     * 
     * Unique identifier associated with the user.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
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
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatewinsockincident
     * @since windows6.0.6000
     */
    static NdfCreateWinSockIncident(sock, host, port, appId, userId, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateWinSockIncident", "ptr", sock, "ptr", host, "ushort", port, "ptr", appId, "ptr", userId, "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses web connectivity problems. (NdfCreateWebIncident)
     * @param {Pointer<PWSTR>} url Type: <b>LPCWSTR</b>
     * 
     * The URL with which there is a connectivity issue.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatewebincident
     * @since windows6.0.6000
     */
    static NdfCreateWebIncident(url, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateWebIncident", "ptr", url, "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses web connectivity problems. (NdfCreateWebIncidentEx)
     * @param {Pointer<PWSTR>} url Type: <b>LPCWSTR</b>
     * 
     * The URL with which there is a connectivity issue.
     * @param {Integer} useWinHTTP Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if diagnosis will be performed using the WinHTTP APIs;  <b>FALSE</b> if the WinInet APIs will be used.
     * @param {Pointer<PWSTR>} moduleName Type: <b>LPWSTR</b>
     * 
     * The module name to use when checking against application-specific filtering rules (for example, "C:\Program Files\Internet Explorer\iexplorer.exe").  If <b>NULL</b>, the value is autodetected during the diagnosis.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatewebincidentex
     * @since windows6.0.6000
     */
    static NdfCreateWebIncidentEx(url, useWinHTTP, moduleName, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateWebIncidentEx", "ptr", url, "int", useWinHTTP, "ptr", moduleName, "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses network problems in accessing a specific network share.
     * @param {Pointer<PWSTR>} UNCPath Type: <b>LPCWSTR</b>
     * 
     * The full UNC string (for example, "\\server\folder\file.ext") for the shared asset with which there is a connectivity issue.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatesharingincident
     * @since windows6.0.6000
     */
    static NdfCreateSharingIncident(UNCPath, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateSharingIncident", "ptr", UNCPath, "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses name resolution issues in resolving a specific host name.
     * @param {Pointer<PWSTR>} hostname Type: <b>LPCWSTR</b>
     * 
     * The host name  with which there is a name resolution issue.
     * @param {Integer} queryType Type: <b>WORD</b>
     * 
     * The numeric representation of the type of record that was queried when the issue occurred.  For more information and a complete listing of record set types and their numeric representations, see the windns.h header file.
     * 
     * This parameter should be set to  <b>DNS_TYPE_ZERO</b> for generic DNS resolution diagnosis.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatednsincident
     * @since windows6.0.6000
     */
    static NdfCreateDNSIncident(hostname, queryType, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateDNSIncident", "ptr", hostname, "ushort", queryType, "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses generic Internet connectivity problems.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreateconnectivityincident
     * @since windows6.0.6000
     */
    static NdfCreateConnectivityIncident(handle) {
        result := DllCall("NDFAPI.dll\NdfCreateConnectivityIncident", "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses connectivity issues using the NetConnection helper class.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @param {Pointer<Guid>} id Type: <b>GUID</b>
     * 
     * Identifier of the network interface that the caller would like to create the incident for.  
     * 
     * The NULL GUID {00000000-0000-0000-0000-000000000000} may be used if the caller does not want to specify an interface. The system will attempt to determine the most appropriate interface based on the current state of the system.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The underlying diagnosis or repair operation has been canceled.
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
     * There is not enough memory available to complete this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatenetconnectionincident
     * @since windows8.0
     */
    static NdfCreateNetConnectionIncident(handle, id) {
        result := DllCall("NDFAPI.dll\NdfCreateNetConnectionIncident", "ptr", handle, "ptr", id, "int")
        return result
    }

    /**
     * Creates a session to diagnose issues with the Peer Name Resolution Protocol (PNRP) service.
     * @remarks
     * The level of diagnosis performed depends on the parameters supplied. The availability of the PNRP service and the availability of the IPv6 networking class will be diagnosed, and additional diagnosis will be performed if certain parameters are supplied.<ul>
     * <li>If <i>peername</i> is specified, NDF will validate the availability of that peer in the PNRP network.</li>
     * <li>If <i>diagnosePublish</i> is specified, NDF will validate the ability to publish a name in PNRP.</li>
     * </ul>
     * @param {Pointer<PWSTR>} cloudname Type: <b>LPCWSTR</b>
     * 
     * The name of the cloud to be diagnosed.
     * @param {Pointer<PWSTR>} peername Type: <b>LPCWSTR</b>
     * 
     * Optional name of a peer node which PNRP can attempt to resolve. The results will be used to help diagnose any problems.
     * @param {Integer} diagnosePublish Type: <b>BOOL</b>
     * 
     * Specifies whether the helper class should verify that the node can publish IDs. If <b>FALSE</b>, this diagnostic step will be skipped.
     * @param {Pointer<PWSTR>} appId Type: <b>LPCWSTR</b>
     * 
     * Application ID for the calling application.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreatepnrpincident
     * @since windows6.1
     */
    static NdfCreatePnrpIncident(cloudname, peername, diagnosePublish, appId, handle) {
        result := DllCall("NDFAPI.dll\NdfCreatePnrpIncident", "ptr", cloudname, "ptr", peername, "int", diagnosePublish, "ptr", appId, "ptr", handle, "int")
        return result
    }

    /**
     * Creates a session to diagnose peer-to-peer grouping functionality issues.
     * @remarks
     * The level of diagnosis performed depends on the parameters supplied.<ul>
     * <li>If no parameters are specified, NDF will validate the grouping service status, the status of peer-to-peer services (PNRP and Identity Manager), and Windows clock synchronization.</li>
     * <li>If <i>CloudName</i> is specified, NDF will validate grouping functionality in that cloud.</li>
     * <li>If <i>GroupName</i> is specified, NDF will validate that the name can be resolved in PNRP (or invoke the PNRP helper class if the name cannot be resolved) and validate the firewall settings for grouping.</li>
     * <li>If <i>Identity</i> is specified, NDF will validate PNRP's ability to register the <i>GroupName</i> with this Identity. If this fails, the PNRP helper class will be invoked.</li>
     * <li>If <i>Invitation</i> is specified, the <i>GroupName</i> will be derived from the Invitation (if a <i>GroupName</i> was not also specified) and NDF will validate the invitation's format and status.</li>
     * <li>If <i>Addresses</i> is specified, NDF will validate whether Windows can connect to up to three of these addresses.</li>
     * </ul>
     * @param {Pointer<PWSTR>} CloudName Type: <b>LPCWSTR</b>
     * 
     * The name of the Peer Name Resolution Protocol (PNRP) cloud where the group is created. If  <b>NULL</b>, the session will  not attempt to diagnose issues related to PNRP.
     * @param {Pointer<PWSTR>} GroupName Type: <b>LPCWSTR</b>
     * 
     * The name of the group to be diagnosed. If <b>NULL</b>, the session will  not attempt to diagnose issues related to group availability.
     * @param {Pointer<PWSTR>} Identity Type: <b>LPCWSTR</b>
     * 
     * The identity that a peer uses to access the group. If  <b>NULL</b>, the session will  not attempt to diagnose issues related to the group's ability to register in PNRP.
     * @param {Pointer<PWSTR>} Invitation Type: <b>LPCWSTR</b>
     * 
     * An XML invitation granted by another peer. An invitation is created when the inviting peer calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreateinvitation">PeerGroupCreateInvitation</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupissuecredentials">PeerGroupIssueCredentials</a>. If this value is present, the invitation will be checked to ensure its format and expiration are valid.
     * @param {Pointer<SOCKET_ADDRESS_LIST>} Addresses Type: <b>SOCKET_ADDRESS_LIST*</b>
     * 
     * Optional list of addresses of the peers to which the application is trying to connect. If this parameter is used, the helper class will diagnose connectivity to these addresses.
     * @param {Pointer<PWSTR>} appId Type: <b>LPCWSTR</b>
     * 
     * Application ID for the calling application.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_BAD_PARAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters has not been provided correctly.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcreategroupingincident
     * @since windows6.1
     */
    static NdfCreateGroupingIncident(CloudName, GroupName, Identity, Invitation, Addresses, appId, handle) {
        result := DllCall("NDFAPI.dll\NdfCreateGroupingIncident", "ptr", CloudName, "ptr", GroupName, "ptr", Identity, "ptr", Invitation, "ptr", Addresses, "ptr", appId, "ptr", handle, "int")
        return result
    }

    /**
     * The NdfExecuteDiagnosis function is used to diagnose the root cause of the incident that has occurred.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @param {Pointer<HWND>} hwnd Type: <b>HWND</b>
     * 
     * Handle to the window that is intended to display the diagnostic information. If specified, the NDF UI is modal to the window.  If <b>NULL</b>, the UI is non-modal.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>handle</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfexecutediagnosis
     * @since windows6.0.6000
     */
    static NdfExecuteDiagnosis(handle, hwnd) {
        result := DllCall("NDFAPI.dll\NdfExecuteDiagnosis", "ptr", handle, "ptr", hwnd, "int")
        return result
    }

    /**
     * Used to close an Network Diagnostics Framework (NDF) incident following its resolution.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the NDF incident that is being closed.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcloseincident
     * @since windows6.0.6000
     */
    static NdfCloseIncident(handle) {
        result := DllCall("NDFAPI.dll\NdfCloseIncident", "ptr", handle, "int")
        return result
    }

    /**
     * Diagnoses the root cause of an incident without displaying a user interface.
     * @remarks
     * This function is intended for use with scenarios where no user interface is shown, or where the standard Windows experience is not being used (as with Media Center and  embedded applications). <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfexecutediagnosis">NdfExecuteDiagnosis</a> will launch the diagnostics user interface, and should be used in scenarios using the standard Windows experience. You can call either <b>NdfExecuteDiagnosis</b> or <b>NdfDiagnoseIncident</b>, but not both.
     * 
     * Before using this API, an application must call an incident creation function such as <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcreatewebincident">NdfCreateWebIncident</a> to begin the NDF diagnostics process. The application then calls <b>NdfDiagnoseIncident</b> to diagnose the issue. If the diagnostics process identifies some possible repairs, the application can call <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfrepairincident">NdfRepairIncident</a> to repair the problem without displaying a user interface. <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcancelincident">NdfCancelIncident</a> can optionally be called from a separate thread if the application wants to cancel an ongoing <b>NdfDiagnoseIncident</b> call. Finally, the application calls <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcloseincident">NdfCloseIncident</a>.
     * 
     * The following table shows some examples of root causes and their corresponding repairs.<table>
     * <tr>
     * <td>Root cause  GUID</td>
     * <td>Repair GUID</td>
     * <td>Root cause description</td>
     * <td>Repair description</td>
     * </tr>
     * <tr>
     * <td>{4DA030B8-86E5-4b6a-A879-2FFF8443B527}</td>
     * <td>{1296DFF0-D04E-4be1-A512-90F04DDFA3E6}</td>
     * <td>A network cable is not properly plugged in or may be broken.</td>
     * <td>Plug an Ethernet cable into this computer.\nAn Ethernet cable looks like a telephone cable but with larger connectors on the ends. Plug this cable into the opening on the back or side of the computer.\nMake sure the other end of the cable is plugged into the router. If that does not help, try using a different cable.</td>
     * </tr>
     * <tr>
     * <td>{60372FD2-AD60-45c2-BD83-6B827FC438DF}</td>
     * <td>{07d37f7b-fa5e-4443-bda7-ab107b29afb6}</td>
     * <td>The %InterfaceName% adapter is disabled.</td>
     * <td>Enable the %FriendlyInterfaceName% adapter.</td>
     * </tr>
     * <tr>
     * <td>{245A9D66-AE9C-4518-A5B4-655752B0A5BD}</td>
     * <td>{07d37f7b-fa5e-4443-bda7-ab107b29afb9}</td>
     * <td>%InterfaceName%"" doesn't have a valid IP configuration.</td>
     * <td>Reset the ""%InterfaceName%"" adapter.\nThis can sometimes resolve an intermittent problem.</td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * A handle to the Network Diagnostics Framework incident.
     * @param {Pointer<UInt32>} RootCauseCount Type: <b>ULONG*</b>
     * 
     * The number of root causes that could potentially have caused this incident. If diagnosis does not succeed, the contents of this parameter should be ignored.
     * @param {Pointer<RootCauseInfo>} RootCauses Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-rootcauseinfo">RootCauseInfo</a>**</b>
     * 
     * A collection of <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-rootcauseinfo">RootCauseInfo</a> structures that contain a detailed description of the root cause. If diagnosis succeeds, this parameter contains both the leaf root causes identified in the diagnosis session and any non-leaf root causes that have an available repair. If diagnosis does not succeed, the contents of this parameter should be ignored.
     * 
     * Memory allocated to these structures should later be freed.  For an example of how to do this, see the Microsoft Windows Network Diagnostics Samples.
     * @param {Integer} dwWait Type: <b>DWORD</b>
     * 
     * The length of time, in milliseconds, to wait before terminating the diagnostic routine. INFINITE may be passed to this parameter if no time-out is desired.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Possible values:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NDF_ADD_CAPTURE_TRACE"></a><a id="ndf_add_capture_trace"></a><dl>
     * <dt><b>NDF_ADD_CAPTURE_TRACE</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turns on network tracing during diagnosis. Diagnostic results will be included in the Event Trace Log (ETL) file returned by <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfgettracefile">NdfGetTraceFile</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NDF_APPLY_INCLUSION_LIST_FILTER_"></a><a id="ndf_apply_inclusion_list_filter_"></a><dl>
     * <dt><b>NDF_APPLY_INCLUSION_LIST_FILTER </b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Applies filtering to the returned root causes so that they are consistent with the in-box scripted diagnostics behavior. Without this flag, root causes will not be filtered. This flag must be set by the caller, so existing callers will not see a change in behavior unless they explicitly specify this flag.
     * 
     * <div class="alert"><b>Note</b>  Available only in Windows 8 and Windows Server 2012.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NDF incident handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The diagnostic routine has terminated because it has taken longer than the time-out specified in dwWait.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfdiagnoseincident
     * @since windows6.1
     */
    static NdfDiagnoseIncident(Handle, RootCauseCount, RootCauses, dwWait, dwFlags) {
        result := DllCall("NDFAPI.dll\NdfDiagnoseIncident", "ptr", Handle, "ptr", RootCauseCount, "ptr", RootCauses, "uint", dwWait, "uint", dwFlags, "int")
        return result
    }

    /**
     * Repairs an incident without displaying a user interface.
     * @remarks
     * <b>NdfRepairIncident</b> can only be called when <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfdiagnoseincident">NdfDiagnoseIncident</a> is used for diagnostics. This is typically the case in scenarios where no user interface is shown, or where the standard Windows experience is not being used (as with Media Center and embedded applications). <b>NdfRepairIncident</b> should not be called when <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfexecutediagnosis">NdfExecuteDiagnosis</a> is used.
     * 
     * Before using this API, an application must call an incident creation function such as <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcreatewebincident">NdfCreateWebIncident</a> to begin the NDF diagnostics process. The application then calls <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfdiagnoseincident">NdfDiagnoseIncident</a> to diagnose the issue. If the diagnostics process identifies some possible repairs, the application can call <b>NdfRepairIncident</b> to repair the problem without displaying a user interface. <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcancelincident">NdfCancelIncident</a> can optionally be called from a separate thread if the application wants to cancel an ongoing <b>NdfRepairIncident</b> call. Finally, the application calls <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcloseincident">NdfCloseIncident</a>.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the Network Diagnostics Framework incident. This handle should match the handle passed to <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfdiagnoseincident">NdfDiagnoseIncident</a>.
     * @param {Pointer<RepairInfoEx>} RepairEx Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-repairinfoex">RepairInfoEx</a>*</b>
     * 
     * A structure (obtained from <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfdiagnoseincident">NdfDiagnoseIncident</a>) which indicates the particular repair to be performed.
     * 
     * Memory allocated to these structures should later be freed.  For an example of how to do this, see the Microsoft Windows Network Diagnostics Samples.
     * @param {Integer} dwWait Type: <b>DWORD</b>
     * 
     * The length of time, in milliseconds, to wait before terminating the diagnostic routine. INFINITE may be passed to this parameter if no timeout is desired.
     * @returns {Integer} Possible return values include, but are not limited to, the following.
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
     * Repair succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NDF_E_VALIDATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The repair executed successfully, but NDF validation still found a connectivity problem. If this value is returned, the session should be closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcloseincident">NdfCloseIncident</a> and another session should be created to continue the diagnosis.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The NDF incident handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WAIT_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The repair operation has terminated because it has taken longer than the time-out specified in dwWait.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Other failure codes are returned if the repair failed to execute. In that case, the client can call <b>NdfRepairIncident</b> again with a different repair.
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfrepairincident
     * @since windows6.1
     */
    static NdfRepairIncident(Handle, RepairEx, dwWait) {
        result := DllCall("NDFAPI.dll\NdfRepairIncident", "ptr", Handle, "ptr", RepairEx, "uint", dwWait, "int")
        return result
    }

    /**
     * Used to cancel unneeded functions which have been previously called on an existing incident.
     * @remarks
     * Before using this API, an application must call an incident creation function such as <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcreatewebincident">NdfCreateWebIncident</a>.
     * 
     * <b>NdfCancelIncident</b> is primarily used to cancel calls to functions such as <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfdiagnoseincident">NdfDiagnoseIncident</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfrepairincident">NdfRepairIncident</a> which have been previously called, but are no longer needed. When <b>NdfCancelIncident</b> is called, NDF will stop the diagnosis/repair as soon as possible rather than calling the other functions (unless results have already been returned from those functions, in which case <b>NdfCancelIncident</b> will have no effect).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ndfapi/nf-ndfapi-ndfcloseincident">NdfCloseIncident</a> should be used to close an incident once it has been resolved, as <b>NdfCancelIncident</b> does not actually close the incident itself.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the Network Diagnostics Framework incident. This handle should match the handle of an existing incident.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     *  Any result other than S_OK should be interpreted as an error.
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfcancelincident
     * @since windows6.1
     */
    static NdfCancelIncident(Handle) {
        result := DllCall("NDFAPI.dll\NdfCancelIncident", "ptr", Handle, "int")
        return result
    }

    /**
     * Used to retrieve the path containing an Event Trace Log (ETL) file that contains Event Tracing for Windows (ETW) events from a diagnostic session.
     * @remarks
     * This function cannot be called on an incident which has already been closed.
     * 
     * ETL files contain information such as which components were diagnosed, component configuration information, and diagnosis results. For more information about ETL files, see <a href="https://docs.microsoft.com/windows/desktop/NDF/network-tracing-in-windows-7">Network Tracing in Windows 7</a>.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to a Network Diagnostics Framework incident. This handle should match the handle of an existing incident.
     * @param {Pointer<PWSTR>} TraceFileLocation Type: <b>LPCWSTR*</b>
     * 
     * The location of the trace file.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * Possible return values include, but are not limited to, the following.
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
     * The operation succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     *  Any result other than S_OK should be interpreted as an error.
     * @see https://learn.microsoft.com/windows/win32/api/ndfapi/nf-ndfapi-ndfgettracefile
     * @since windows6.1
     */
    static NdfGetTraceFile(Handle, TraceFileLocation) {
        result := DllCall("NDFAPI.dll\NdfGetTraceFile", "ptr", Handle, "ptr", TraceFileLocation, "int")
        return result
    }

;@endregion Methods
}
