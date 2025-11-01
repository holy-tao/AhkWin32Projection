#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * @param {PWSTR} helperClassName Type: <b>LPCWSTR</b>
     * 
     * The name of the helper class to be used in the diagnoses of the incident.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * A count of elements in the attributes array.
     * @param {Pointer<HELPER_ATTRIBUTE>} attributes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a>*</b>
     * 
     * The applicable <a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-helper_attribute">HELPER_ATTRIBUTE</a> structure.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * A handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreateincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateIncident(helperClassName, celt, attributes, handle) {
        helperClassName := helperClassName is String ? StrPtr(helperClassName) : helperClassName

        result := DllCall("NDFAPI.dll\NdfCreateIncident", "ptr", helperClassName, "uint", celt, "ptr", attributes, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Provides access to the Winsock Helper Class provided by Microsoft.
     * @param {SOCKET} sock Type: <b>SOCKET</b>
     * 
     * A descriptor identifying a connected socket.
     * @param {PWSTR} host Type: <b>LPCWSTR</b>
     * 
     * A pointer to the local host.
     * @param {Integer} port Type: <b>USHORT</b>
     * 
     * The port providing Winsock access.
     * @param {PWSTR} appId Type: <b>LPCWSTR</b>
     * 
     * Unique identifier associated with the application.
     * @param {Pointer<SID>} userId Type: <b>SID*</b>
     * 
     * Unique identifier associated with the user.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatewinsockincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateWinSockIncident(sock, host, port, appId, userId, handle) {
        sock := sock is Win32Handle ? NumGet(sock, "ptr") : sock
        host := host is String ? StrPtr(host) : host
        appId := appId is String ? StrPtr(appId) : appId

        result := DllCall("NDFAPI.dll\NdfCreateWinSockIncident", "ptr", sock, "ptr", host, "ushort", port, "ptr", appId, "ptr", userId, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses web connectivity problems.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL with which there is a connectivity issue.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatewebincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateWebIncident(url, handle) {
        url := url is String ? StrPtr(url) : url

        result := DllCall("NDFAPI.dll\NdfCreateWebIncident", "ptr", url, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses web connectivity problems.
     * @param {PWSTR} url Type: <b>LPCWSTR</b>
     * 
     * The URL with which there is a connectivity issue.
     * @param {BOOL} useWinHTTP Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if diagnosis will be performed using the WinHTTP APIs;  <b>FALSE</b> if the WinInet APIs will be used.
     * @param {PWSTR} moduleName Type: <b>LPWSTR</b>
     * 
     * The module name to use when checking against application-specific filtering rules (for example, "C:\Program Files\Internet Explorer\iexplorer.exe").  If <b>NULL</b>, the value is autodetected during the diagnosis.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatewebincidentex
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateWebIncidentEx(url, useWinHTTP, moduleName, handle) {
        url := url is String ? StrPtr(url) : url
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := DllCall("NDFAPI.dll\NdfCreateWebIncidentEx", "ptr", url, "int", useWinHTTP, "ptr", moduleName, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses network problems in accessing a specific network share.
     * @param {PWSTR} UNCPath Type: <b>LPCWSTR</b>
     * 
     * The full UNC string (for example, "\\server\folder\file.ext") for the shared asset with which there is a connectivity issue.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatesharingincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateSharingIncident(UNCPath, handle) {
        UNCPath := UNCPath is String ? StrPtr(UNCPath) : UNCPath

        result := DllCall("NDFAPI.dll\NdfCreateSharingIncident", "ptr", UNCPath, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses name resolution issues in resolving a specific host name.
     * @param {PWSTR} hostname Type: <b>LPCWSTR</b>
     * 
     * The host name  with which there is a name resolution issue.
     * @param {Integer} queryType Type: <b>WORD</b>
     * 
     * The numeric representation of the type of record that was queried when the issue occurred.  For more information and a complete listing of record set types and their numeric representations, see the windns.h header file.
     * 
     * This parameter should be set to  <b>DNS_TYPE_ZERO</b> for generic DNS resolution diagnosis.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatednsincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateDNSIncident(hostname, queryType, handle) {
        hostname := hostname is String ? StrPtr(hostname) : hostname

        result := DllCall("NDFAPI.dll\NdfCreateDNSIncident", "ptr", hostname, "ushort", queryType, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses generic Internet connectivity problems.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreateconnectivityincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCreateConnectivityIncident(handle) {
        result := DllCall("NDFAPI.dll\NdfCreateConnectivityIncident", "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses connectivity issues using the NetConnection helper class.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @param {Guid} id Type: <b>GUID</b>
     * 
     * Identifier of the network interface that the caller would like to create the incident for.  
     * 
     * The NULL GUID {00000000-0000-0000-0000-000000000000} may be used if the caller does not want to specify an interface. The system will attempt to determine the most appropriate interface based on the current state of the system.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatenetconnectionincident
     * @deprecated
     * @since windows8.0
     */
    static NdfCreateNetConnectionIncident(handle, id) {
        result := DllCall("NDFAPI.dll\NdfCreateNetConnectionIncident", "ptr*", handle, "ptr", id, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a session to diagnose issues with the Peer Name Resolution Protocol (PNRP) service.
     * @param {PWSTR} cloudname Type: <b>LPCWSTR</b>
     * 
     * The name of the cloud to be diagnosed.
     * @param {PWSTR} peername Type: <b>LPCWSTR</b>
     * 
     * Optional name of a peer node which PNRP can attempt to resolve. The results will be used to help diagnose any problems.
     * @param {BOOL} diagnosePublish Type: <b>BOOL</b>
     * 
     * Specifies whether the helper class should verify that the node can publish IDs. If <b>FALSE</b>, this diagnostic step will be skipped.
     * @param {PWSTR} appId Type: <b>LPCWSTR</b>
     * 
     * Application ID for the calling application.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreatepnrpincident
     * @deprecated
     * @since windows6.1
     */
    static NdfCreatePnrpIncident(cloudname, peername, diagnosePublish, appId, handle) {
        cloudname := cloudname is String ? StrPtr(cloudname) : cloudname
        peername := peername is String ? StrPtr(peername) : peername
        appId := appId is String ? StrPtr(appId) : appId

        result := DllCall("NDFAPI.dll\NdfCreatePnrpIncident", "ptr", cloudname, "ptr", peername, "int", diagnosePublish, "ptr", appId, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a session to diagnose peer-to-peer grouping functionality issues.
     * @param {PWSTR} CloudName Type: <b>LPCWSTR</b>
     * 
     * The name of the Peer Name Resolution Protocol (PNRP) cloud where the group is created. If  <b>NULL</b>, the session will  not attempt to diagnose issues related to PNRP.
     * @param {PWSTR} GroupName Type: <b>LPCWSTR</b>
     * 
     * The name of the group to be diagnosed. If <b>NULL</b>, the session will  not attempt to diagnose issues related to group availability.
     * @param {PWSTR} Identity Type: <b>LPCWSTR</b>
     * 
     * The identity that a peer uses to access the group. If  <b>NULL</b>, the session will  not attempt to diagnose issues related to the group's ability to register in PNRP.
     * @param {PWSTR} Invitation Type: <b>LPCWSTR</b>
     * 
     * An XML invitation granted by another peer. An invitation is created when the inviting peer calls <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupcreateinvitation">PeerGroupCreateInvitation</a> or <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergroupissuecredentials">PeerGroupIssueCredentials</a>. If this value is present, the invitation will be checked to ensure its format and expiration are valid.
     * @param {Pointer<SOCKET_ADDRESS_LIST>} Addresses Type: <b>SOCKET_ADDRESS_LIST*</b>
     * 
     * Optional list of addresses of the peers to which the application is trying to connect. If this parameter is used, the helper class will diagnose connectivity to these addresses.
     * @param {PWSTR} appId Type: <b>LPCWSTR</b>
     * 
     * Application ID for the calling application.
     * @param {Pointer<Pointer<Void>>} handle Type: <b>NDFHANDLE*</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcreategroupingincident
     * @deprecated
     * @since windows6.1
     */
    static NdfCreateGroupingIncident(CloudName, GroupName, Identity, Invitation, Addresses, appId, handle) {
        CloudName := CloudName is String ? StrPtr(CloudName) : CloudName
        GroupName := GroupName is String ? StrPtr(GroupName) : GroupName
        Identity := Identity is String ? StrPtr(Identity) : Identity
        Invitation := Invitation is String ? StrPtr(Invitation) : Invitation
        appId := appId is String ? StrPtr(appId) : appId

        result := DllCall("NDFAPI.dll\NdfCreateGroupingIncident", "ptr", CloudName, "ptr", GroupName, "ptr", Identity, "ptr", Invitation, "ptr", Addresses, "ptr", appId, "ptr*", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The NdfExecuteDiagnosis function is used to diagnose the root cause of the incident that has occurred.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the Network Diagnostics Framework incident.
     * @param {HWND} hwnd Type: <b>HWND</b>
     * 
     * Handle to the window that is intended to display the diagnostic information. If specified, the NDF UI is modal to the window.  If <b>NULL</b>, the UI is non-modal.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfexecutediagnosis
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfExecuteDiagnosis(handle, hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("NDFAPI.dll\NdfExecuteDiagnosis", "ptr", handle, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to close an Network Diagnostics Framework (NDF) incident following its resolution.
     * @param {Pointer<Void>} handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the NDF incident that is being closed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcloseincident
     * @deprecated
     * @since windows6.0.6000
     */
    static NdfCloseIncident(handle) {
        result := DllCall("NDFAPI.dll\NdfCloseIncident", "ptr", handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Diagnoses the root cause of an incident without displaying a user interface.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * A handle to the Network Diagnostics Framework incident.
     * @param {Pointer<Integer>} RootCauseCount Type: <b>ULONG*</b>
     * 
     * The number of root causes that could potentially have caused this incident. If diagnosis does not succeed, the contents of this parameter should be ignored.
     * @param {Pointer<Pointer<RootCauseInfo>>} RootCauses Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ns-ndattrib-rootcauseinfo">RootCauseInfo</a>**</b>
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
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfdiagnoseincident
     * @deprecated
     * @since windows6.1
     */
    static NdfDiagnoseIncident(Handle, RootCauseCount, RootCauses, dwWait, dwFlags) {
        result := DllCall("NDFAPI.dll\NdfDiagnoseIncident", "ptr", Handle, "uint*", RootCauseCount, "ptr*", RootCauses, "uint", dwWait, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Repairs an incident without displaying a user interface.
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
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * The repair executed successfully, but NDF validation still found a connectivity problem. If this value is returned, the session should be closed by calling <a href="/windows/desktop/api/ndfapi/nf-ndfapi-ndfcloseincident">NdfCloseIncident</a> and another session should be created to continue the diagnosis.
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfrepairincident
     * @deprecated
     * @since windows6.1
     */
    static NdfRepairIncident(Handle, RepairEx, dwWait) {
        result := DllCall("NDFAPI.dll\NdfRepairIncident", "ptr", Handle, "ptr", RepairEx, "uint", dwWait, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to cancel unneeded functions which have been previously called on an existing incident.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to the Network Diagnostics Framework incident. This handle should match the handle of an existing incident.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfcancelincident
     * @deprecated
     * @since windows6.1
     */
    static NdfCancelIncident(Handle) {
        result := DllCall("NDFAPI.dll\NdfCancelIncident", "ptr", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to retrieve the path containing an Event Trace Log (ETL) file that contains Event Tracing for Windows (ETW) events from a diagnostic session.
     * @param {Pointer<Void>} Handle Type: <b>NDFHANDLE</b>
     * 
     * Handle to a Network Diagnostics Framework incident. This handle should match the handle of an existing incident.
     * @param {Pointer<PWSTR>} TraceFileLocation Type: <b>LPCWSTR*</b>
     * 
     * The location of the trace file.
     * @returns {HRESULT} Type: <b>HRESULT</b>
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
     * @see https://docs.microsoft.com/windows/win32/api//ndfapi/nf-ndfapi-ndfgettracefile
     * @deprecated
     * @since windows6.1
     */
    static NdfGetTraceFile(Handle, TraceFileLocation) {
        result := DllCall("NDFAPI.dll\NdfGetTraceFile", "ptr", Handle, "ptr", TraceFileLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
