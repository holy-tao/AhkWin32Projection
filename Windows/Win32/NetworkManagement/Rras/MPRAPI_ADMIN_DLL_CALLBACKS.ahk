#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class MPRAPI_ADMIN_DLL_CALLBACKS extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

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
     * @type {Integer}
     */
    revision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetipaddressforuser">MprAdminGetIpAddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINGETIPADDRESSFORUSER)(WCHAR *, WCHAR *, DWORD *, BOOL *);
     * 
     * ```
     * @type {Pointer<PMPRADMINGETIPADDRESSFORUSER>}
     */
    lpfnMprAdminGetIpAddressForUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminreleaseipaddress">MprAdminReleaseIpAddress</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINRELEASEIPADRESS)(WCHAR *, WCHAR *, DWORD *);
     * 
     * ```
     * @type {Pointer<PMPRADMINRELEASEIPADRESS>}
     */
    lpfnMprAdminReleaseIpAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradmingetipv6addressforuser">MprAdminGetIpv6AddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINGETIPV6ADDRESSFORUSER)(WCHAR *, WCHAR *, IN6_ADDR *, BOOL *);
     * 
     * ```
     * @type {Pointer<PMPRADMINGETIPV6ADDRESSFORUSER>}
     */
    lpfnMprAdminGetIpv6AddressForUser {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminreleaseipv6addressforuser">MprAdminReleaseIpv6AddressForUser</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINRELEASEIPV6ADDRESSFORUSER)(WCHAR *, WCHAR *, IN6_ADDR *);
     * 
     * ```
     * @type {Pointer<PMPRADMINRELEASEIPV6ADDRESSFORUSER>}
     */
    lpfnMprAdminReleaseIpV6AddressForUser {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptnewlink">MprAdminAcceptNewLink</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTNEWLINK)(RAS_PORT_0 *, RAS_PORT_1 *);
     * 
     * ```
     * @type {Pointer<PMPRADMINACCEPTNEWLINK>}
     */
    lpfnRasAdminAcceptNewLink {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminlinkhangupnotification">MprAdminLinkHangupNotification</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINLINKHANGUPNOTIFICATION)(RAS_PORT_0 *, RAS_PORT_1 *);
     * 
     * ```
     * @type {Pointer<PMPRADMINLINKHANGUPNOTIFICATION>}
     */
    lpfnRasAdminLinkHangupNotification {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminterminatedll">MprAdminTerminateDll</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef DWORD (APIENTRY * PMPRADMINTERMINATEDLL)();
     * 
     * ```
     * @type {Pointer<PMPRADMINTERMINATEDLL>}
     */
    lpfnRasAdminTerminateDll {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptnewconnectionex">MprAdminAcceptNewConnectionEx</a>  callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTNEWCONNECTIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     * @type {Pointer<PMPRADMINACCEPTNEWCONNECTIONEX>}
     */
    lpfnRasAdminAcceptNewConnectionEx {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @type {Pointer<PMPRADMINACCEPTTUNNELENDPOINTCHANGEEX>}
     */
    lpfnRasAdminAcceptEndpointChangeEx {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminacceptreauthenticationex">MprAdminAcceptReauthenticationEx</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef BOOL  (APIENTRY * PMPRADMINACCEPTREAUTHENTICATIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     * @type {Pointer<PMPRADMINACCEPTREAUTHENTICATIONEX>}
     */
    lpfnRasAdminAcceptReauthenticationEx {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A function pointer to an instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/nf-mprapi-mpradminconnectionhangupnotificationex">MprAdminConnectionHangupNotificationEx</a> callback. The callback prototype is defined as:
     * 
     * 
     * ```cpp
     * typedef VOID  (APIENTRY * PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX)(RAS_CONNECTION_EX *);
     * 
     * ```
     * @type {Pointer<PMPRADMINCONNECTIONHANGUPNOTIFICATIONEX>}
     */
    lpfnRasAdminConnectionHangupNotificationEx {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * 
     * @type {Pointer<PMPRADMINRASVALIDATEPREAUTHENTICATEDCONNECTIONEX>}
     */
    lpfnRASValidatePreAuthenticatedConnectionEx {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
