#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class WindowsFirewall {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NETCON_MAX_NAME_LEN => 256

    /**
     * @type {Integer (Int32)}
     */
    static S_OBJECT_NO_LONGER_VALID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETISO_GEID_FOR_WDAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETISO_GEID_FOR_NEUTRAL_AWARE => 2
;@endregion Constants

;@region Methods
    /**
     * The NcFreeNetconProperties function frees memory associated with NETCON_PROPERTIES structures.
     * @param {Pointer<NETCON_PROPERTIES>} pProps Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/netcon/ns-netcon-netcon_properties">NETCON_PROPERTIES</a> structure to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-ncfreenetconproperties
     * @since windows5.1.2600
     */
    static NcFreeNetconProperties(pProps) {
        DllCall("Netshell.dll\NcFreeNetconProperties", "ptr", pProps)
    }

    /**
     * The NcIsValidConnectionName function verifies if the passed in connection name is valid.
     * @param {Pointer<PWSTR>} pszwName Connection name to check.
     * @returns {Integer} <b>TRUE</b> if connection name is valid.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-ncisvalidconnectionname
     * @since windows5.1.2600
     */
    static NcIsValidConnectionName(pszwName) {
        pszwName := pszwName is String? StrPtr(pszwName) : pszwName

        result := DllCall("Netshell.dll\NcIsValidConnectionName", "ptr", pszwName, "int")
        return result
    }

    /**
     * The NetworkIsolationSetupAppContainerBinaries function is used by software installers to provide information about the image paths of applications that are running in an app container.
     * @remarks
     * Applications creating an app container can use <b>NetworkIsolationSetupAppContainerBinaries</b> to provide third-party firewall applications with  the direct path to applications running inside that app container.
     * @param {Pointer<PSID>} applicationContainerSid Type: <b>PSID</b>
     * 
     * The package identifier of the app container.
     * @param {Pointer<PWSTR>} packageFullName Type: <b>LPCWSTR</b>
     * 
     * A string representing the package identity of the app that owns this app container. Contains the 5-part tuple as individual fields (name, version, architecture, resourceid, publisher).
     * @param {Pointer<PWSTR>} packageFolder Type: <b>LPCWSTR</b>
     * 
     * The file location of the app that owns this app container.
     * @param {Pointer<PWSTR>} displayName Type: <b>LPCWSTR</b>
     * 
     * The friendly name of the app container.
     * @param {Integer} bBinariesFullyComputed Type: <b>BOOL</b>
     * 
     * True if the binary files are being provided by the caller; otherwise, false.
     * @param {Pointer<PWSTR>} binaries Type: <b>LPCWSTR*</b>
     * 
     * An array of paths to the applications running in the app container.
     * @param {Integer} binariesCount Type: <b>DWORD</b>
     * 
     * The number of paths contained in the <i>binaries</i> parameter.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If the function succeeds, it returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationsetupappcontainerbinaries
     * @since windows8.0
     */
    static NetworkIsolationSetupAppContainerBinaries(applicationContainerSid, packageFullName, packageFolder, displayName, bBinariesFullyComputed, binaries, binariesCount) {
        packageFullName := packageFullName is String? StrPtr(packageFullName) : packageFullName
        packageFolder := packageFolder is String? StrPtr(packageFolder) : packageFolder
        displayName := displayName is String? StrPtr(displayName) : displayName
        binaries := binaries is String? StrPtr(binaries) : binaries

        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationSetupAppContainerBinaries", "ptr", applicationContainerSid, "ptr", packageFullName, "ptr", packageFolder, "ptr", displayName, "int", bBinariesFullyComputed, "ptr", binaries, "uint", binariesCount, "int")
        return result
    }

    /**
     * The NetworkIsolationRegisterForAppContainerChanges function is used to register for the delivery of notifications regarding changes to an app container.
     * @param {Integer} flags Type: <b>DWORD</b>
     * 
     * A bitmask value of control flags which specify when to receive notifications. May contain one or more of the following flags. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INET_FIREWALL_AC_NONE"></a><a id="inet_firewall_ac_none"></a><dl>
     * <dt><b>INET_FIREWALL_AC_NONE</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No notifications will be delivered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INET_FIREWALL_AC_PACKAGE_ID_ONLY_"></a><a id="inet_firewall_ac_package_id_only_"></a><dl>
     * <dt><b>INET_FIREWALL_AC_PACKAGE_ID_ONLY </b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifications will be delivered when an app container is created with a package identifier.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INET_FIREWALL_AC_BINARY"></a><a id="inet_firewall_ac_binary"></a><dl>
     * <dt><b>INET_FIREWALL_AC_BINARY</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifications will be delivered when  an app container is created with a binary path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="INET_FIREWALL_AC_MAX"></a><a id="inet_firewall_ac_max"></a><dl>
     * <dt><b>INET_FIREWALL_AC_MAX</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Maximum value for testing purposes.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<PAC_CHANGES_CALLBACK_FN>} callback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/nc-networkisolation-pac_changes_callback_fn">PAC_CHANGES_CALLBACK_FN</a></b>
     * 
     * Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<Void>} context Type: <b>PVOID</b>
     * 
     * Optional context pointer. This pointer is passed to the <i>callback</i> function along with details of the change.
     * @param {Pointer<HANDLE>} registrationObject Type: <b>HANDLE*</b>
     * 
     * Handle to the newly created registration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationregisterforappcontainerchanges
     * @since windows8.0
     */
    static NetworkIsolationRegisterForAppContainerChanges(flags, callback, context, registrationObject) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationRegisterForAppContainerChanges", "uint", flags, "ptr", callback, "ptr", context, "ptr", registrationObject, "uint")
        return result
    }

    /**
     * The NetworkIsolationUnregisterForAppContainerChanges function is used to cancel an app container change registration and stop receiving notifications.
     * @param {Pointer<HANDLE>} registrationObject Type: <b>HANDLE</b>
     * 
     * Handle to the previously created registration.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationunregisterforappcontainerchanges
     * @since windows8.0
     */
    static NetworkIsolationUnregisterForAppContainerChanges(registrationObject) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationUnregisterForAppContainerChanges", "ptr", registrationObject, "uint")
        return result
    }

    /**
     * Enumerates all of the rules related to app containers.
     * @param {Pointer<IEnumVARIANT>} newEnum Type: <b>IEnumVARIANT**</b>
     * 
     * Enumerator interface of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/nn-netfw-inetfwrule3">INetFwRule3</a> object that represents the rules enforcing app containers.
     * @returns {Integer} Type: <b>HRESULT</b>
     * 
     * If this function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationenumerateappcontainerrules
     * @since windows8.0
     */
    static NetworkIsolationEnumerateAppContainerRules(newEnum) {
        result := DllCall("Firewallapi.dll\NetworkIsolationEnumerateAppContainerRules", "ptr", newEnum, "int")
        return result
    }

    /**
     * The NetworkIsolationFreeAppContainers function is used to release memory resources allocated to one or more app containers.
     * @param {Pointer<INET_FIREWALL_APP_CONTAINER>} pPublicAppCs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ns-netfw-inet_firewall_app_container">PINET_FIREWALL_APP_CONTAINER</a></b>
     * 
     * The app container memory resources to be freed.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns **ERROR_SUCCESS**.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationfreeappcontainers
     * @since windows8.0
     */
    static NetworkIsolationFreeAppContainers(pPublicAppCs) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationFreeAppContainers", "ptr", pPublicAppCs, "uint")
        return result
    }

    /**
     * The NetworkIsolationEnumAppContainers function enumerates all of the app containers that have been created in the system.
     * @remarks
     * If no app containers are installed on the system, ERROR_SUCCESS will still be returned (and <i>ppPublicAppCs</i> will be empty).  If ppPublicAppCs is not empty, <a href="https://docs.microsoft.com/en-us/windows/win32/api/netfw/nf-netfw-networkisolationfreeappcontainers">NetworkIsolationFreeAppContainers</a> should be used to free the memory when you are done using it.
     * @param {Integer} Flags Type: <b>DWORD</b>
     * 
     * May be set to <b>NETISO_FLAG_FORCE_COMPUTE_BINARIES</b> to ensure that all binaries are computed before the app container is returned. This flag should be set if the caller requires up-to-date and complete information on app container binaries. If this flag is not set, returned data may be stale or incomplete.
     * 
     * 
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/netfw/ne-netfw-netiso_flag">NETISO_FLAG</a> for more information.
     * @param {Pointer<UInt32>} pdwNumPublicAppCs Type: <b>DWORD*</b>
     * 
     * The number of app containers in the <b>ppPublicAppCs</b> member.
     * @param {Pointer<INET_FIREWALL_APP_CONTAINER>} ppPublicAppCs Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/netfw/ns-netfw-inet_firewall_app_container">PINET_FIREWALL_APP_CONTAINER</a>*</b>
     * 
     * The list of app container structure elements.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise. 
     * 
     * ERROR_OUTOFMEMORY will be returned if memory is unavailable.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationenumappcontainers
     * @since windows8.0
     */
    static NetworkIsolationEnumAppContainers(Flags, pdwNumPublicAppCs, ppPublicAppCs) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationEnumAppContainers", "uint", Flags, "ptr", pdwNumPublicAppCs, "ptr", ppPublicAppCs, "uint")
        return result
    }

    /**
     * The NetworkIsolationGetAppContainerConfig function is used to retrieve configuration information about one or more app containers.
     * @remarks
     * Note that it is the calling program's responsibility to free the memory associated with the PSID_AND_ATTRIBUTES structure. The following code sample shows how to call this function. The FreeAppContainerConfig function shows how to free all of the associated memory.
     * 
     * 
     * ```cpp
     * @param {Pointer<UInt32>} pdwNumPublicAppCs Type: <b>DWORD*</b>
     * 
     * The number of app containers in the <b>appContainerSids</b> member.
     * @param {Pointer<SID_AND_ATTRIBUTES>} appContainerSids Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">PSID_AND_ATTRIBUTES</a>*</b>
     * 
     * The security identifiers (SIDs) of app containers that are allowed to send loopback traffic. Used for debugging purposes.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationgetappcontainerconfig
     * @since windows8.0
     */
    static NetworkIsolationGetAppContainerConfig(pdwNumPublicAppCs, appContainerSids) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationGetAppContainerConfig", "ptr", pdwNumPublicAppCs, "ptr", appContainerSids, "uint")
        return result
    }

    /**
     * The NetworkIsolationSetAppContainerConfig function is used to set the configuration of one or more app containers.
     * @remarks
     * Note that it is the calling program's responsibility to first call the <b>NetworkIsolationGetAppContainerConfig</b> function in order to retrieve and preserve the app container SIDs already configured to send loopback traffic.
     * @param {Integer} dwNumPublicAppCs Type: <b>DWORD</b>
     * 
     * The number of app containers in the <b>appContainerSids</b> member.
     * @param {Pointer<SID_AND_ATTRIBUTES>} appContainerSids Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">PSID_AND_ATTRIBUTES</a></b>
     * 
     * The security identifiers (SIDs) of app containers that are allowed to send loopback traffic. Used for debugging purposes.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationsetappcontainerconfig
     * @since windows8.0
     */
    static NetworkIsolationSetAppContainerConfig(dwNumPublicAppCs, appContainerSids) {
        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationSetAppContainerConfig", "uint", dwNumPublicAppCs, "ptr", appContainerSids, "uint")
        return result
    }

    /**
     * The NetworkIsolationDiagnoseConnectFailureAndGetInfo function gets information about a network isolation connection failure due to a missing capability.
     * @param {Pointer<PWSTR>} wszServerName Type: <b>LPCWSTR</b>
     * 
     * Name (or IP address literal string) of the server to which a connection was attempted.
     * @param {Pointer<Int32>} netIsoError Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/networkisolation/ne-networkisolation-netiso_error_type">NETISO_ERROR_TYPE</a>*</b>
     * 
     * The error that has occurred, indicating which network capability was missing and thus caused the failure.
     * @returns {Integer} Type: <b>DWORD</b>
     * 
     * Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationdiagnoseconnectfailureandgetinfo
     * @since windows8.0
     */
    static NetworkIsolationDiagnoseConnectFailureAndGetInfo(wszServerName, netIsoError) {
        wszServerName := wszServerName is String? StrPtr(wszServerName) : wszServerName

        result := DllCall("api-ms-win-net-isolation-l1-1-0.dll\NetworkIsolationDiagnoseConnectFailureAndGetInfo", "ptr", wszServerName, "ptr", netIsoError, "uint")
        return result
    }

    /**
     * Gets the Enterprise ID based on Network Isolation endpoints in the context of the Windows Information Protection (WIP) or the Windows Defender Application Guard (WDAG) scenarios.
     * @param {Pointer<PWSTR>} wszServerName The name of the Enterprise Data Protection Server.
     * @param {Integer} dwFlags A bitmask value of control flags which specify the context of the API call.  May contain one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETISO_GEID_DEFAULT"></a><a id="netiso_geid_default"></a><dl>
     * <dt><b>NETISO_GEID_DEFAULT</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default API behavior.
     * Returns the Enterprise ID for Enterprise resources.
     * Returns NULL for Personal resources.
     * For Neutral resources, returns Enterprise ID if it is called from an Enterprise context, or returns NULL if it is called from a Personal context.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETISO_GEID_FOR_WDAG"></a><a id="netiso_geid_for_wdag"></a><dl>
     * <dt><b>NETISO_GEID_FOR_WDAG</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used in the context of the Windows Defender Application Guard (WDAG) scenario.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETISO_GEID_FOR_NEUTRAL_AWARE"></a><a id="netiso_geid_for_neutral_aware"></a><dl>
     * <dt><b>NETISO_GEID_FOR_NEUTRAL_AWARE</b></dt>
     * <dt>0x02</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Used by applications that are aware of neutral resources.
     * For Neutral resources the API will return L”*”.
     * For Enterprise resources the API will return the Enterprise ID.
     * For Personal resources the API will return NULL.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NETISO_GEID_FORCE_TO_CHECK"></a><a id="netiso_geid_force_to_check"></a><dl>
     * <dt><b>NETISO_GEID_FORCE_TO_CHECK</b></dt>
     * <dt>0x04</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Forces API to check the resource even in cases when neither Windows Information Protection nor Windows Defender Application Guard are enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} context Optional context pointer.
     * @param {Pointer<PNETISO_EDP_ID_CALLBACK_FN>} callback Function pointer that will be invoked when a notification is ready for delivery.
     * @param {Pointer<HANDLE>} hOperation The handle for the Enterprise Data Protection Server endpoints.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationgetenterpriseidasync
     * @since windows10.0.10240
     */
    static NetworkIsolationGetEnterpriseIdAsync(wszServerName, dwFlags, context, callback, hOperation) {
        wszServerName := wszServerName is String? StrPtr(wszServerName) : wszServerName

        result := DllCall("Firewallapi.dll\NetworkIsolationGetEnterpriseIdAsync", "ptr", wszServerName, "uint", dwFlags, "ptr", context, "ptr", callback, "ptr", hOperation, "uint")
        return result
    }

    /**
     * This API is used for closing the handle returned by NetworkIsolationGetEnterpriseIdAsync as well as for synchronizing the operation.
     * @param {Pointer<HANDLE>} hOperation The handle to release.
     * @param {Integer} bWaitForOperation Indicates whether to wait for synchronization.
     * @returns {Integer} Returns ERROR_SUCCESS if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-networkisolationgetenterpriseidclose
     * @since windows10.0.10240
     */
    static NetworkIsolationGetEnterpriseIdClose(hOperation, bWaitForOperation) {
        result := DllCall("Firewallapi.dll\NetworkIsolationGetEnterpriseIdClose", "ptr", hOperation, "int", bWaitForOperation, "uint")
        return result
    }

;@endregion Methods
}
