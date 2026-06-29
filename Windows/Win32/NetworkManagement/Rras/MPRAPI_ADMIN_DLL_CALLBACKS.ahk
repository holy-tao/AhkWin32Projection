#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPRAPI_ADMIN_DLL_CALLBACKS structure is used by the MprAdminInitializeDllEx function to register the callback function pointers.
 * @remarks
 * The following restrictions apply to the callback functions in the <b>MPRAPI_ADMIN_DLL_CALLBACKS</b> structure:
 * 
 * <ul>
 * <li>Both <b>lpfnMprAdminGetIpv6AddressForUser</b> and <b>lpfnMprAdminReleaseIpV6AddressForUser</b> must be implemented, or neither are implemented.</li>
 * <li>Both <b>lpfnMprAdminGetIpAddressForUser</b> and <b>lpfnMprAdminReleaseIpAddress</b> must be implemented, or neither are implemented.</li>
 * <li>Either <b>lpfnRasAdminLinkHangupNotification</b> or <b>lpfnRasAdminAcceptNewLink</b> must be implemented.</li>
 * <li>Either <b>lpfnRasAdminAcceptNewConnectionEx</b> or <b>lpfnRasAdminConnectionHangupNotificationEx</b> must be implemented.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mprapi_admin_dll_callbacks
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPRAPI_ADMIN_DLL_CALLBACKS {
    #StructPack 8

    /**
     * A value that represents the version of this structure.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_ADMIN_DLL_VERSION_1"></a><a id="mprapi_admin_dll_version_1"></a><dl>
     * <dt><b>MPRAPI_ADMIN_DLL_VERSION_1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structure and the callback function pointers that use it as a parameter are not supported by this structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_ADMIN_DLL_VERSION_2"></a><a id="mprapi_admin_dll_version_2"></a><dl>
     * <dt><b>MPRAPI_ADMIN_DLL_VERSION_2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structure and the callback function pointers that use it as a parameter are supported by this structure.
     * 
     * </td>
     * </tr>
     * </table>
     */
    revision : Int8

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetipaddressforuser">MprAdminGetIpAddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINGETIPADDRESSFORUSER)(WCHAR *, WCHAR *, DWORD *, BOOL *);
     * 
     * ```
     */
    lpfnMprAdminGetIpAddressForUser : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminreleaseipaddress">MprAdminReleaseIpAddress</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINRELEASEIPADRESS)(WCHAR *, WCHAR *, DWORD *);
     * 
     * ```
     */
    lpfnMprAdminReleaseIpAddress : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetipv6addressforuser">MprAdminGetIpv6AddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINGETIPV6ADDRESSFORUSER)(WCHAR *, WCHAR *, IN6_ADDR *, BOOL *);
     * 
     * ```
     */
    lpfnMprAdminGetIpv6AddressForUser : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminreleaseipv6addressforuser">MprAdminReleaseIpv6AddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINRELEASEIPV6ADDRESSFORUSER)(WCHAR *, WCHAR *, IN6_ADDR *);
     * 
     * ```
     */
    lpfnMprAdminReleaseIpV6AddressForUser : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptnewlink">MprAdminAcceptNewLink</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTNEWLINK)(RAS_PORT_0 *, RAS_PORT_1 *);
     * 
     * ```
     */
    lpfnRasAdminAcceptNewLink : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminlinkhangupnotification">MprAdminLinkHangupNotification</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINLINKHANGUPNOTIFICATION)(RAS_PORT_0 *, RAS_PORT_1 *);
     * 
     * ```
     */
    lpfnRasAdminLinkHangupNotification : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminterminatedll">MprAdminTerminateDll</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINTERMINATEDLL)();
     * 
     * ```
     */
    lpfnRasAdminTerminateDll : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptnewconnectionex">MprAdminAcceptNewConnectionEx</a>  callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTNEWCONNECTIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     */
    lpfnRasAdminAcceptNewConnectionEx : IntPtr

    lpfnRasAdminAcceptEndpointChangeEx : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptreauthenticationex">MprAdminAcceptReauthenticationEx</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTREAUTHENTICATIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     */
    lpfnRasAdminAcceptReauthenticationEx : IntPtr

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionhangupnotificationex">MprAdminConnectionHangupNotificationEx</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     */
    lpfnRasAdminConnectionHangupNotificationEx : IntPtr

    lpfnRASValidatePreAuthenticatedConnectionEx : IntPtr

}
