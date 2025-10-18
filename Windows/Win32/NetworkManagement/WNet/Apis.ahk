#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class WNet {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WNGETCON_CONNECTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WNGETCON_DISCONNECTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_SPEC_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_SPEC_VERSION51 => 327681

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_NET_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DRIVER_VERSION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_USER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_USR_GETUSER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CONNECTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_ADDCONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_CANCELCONNECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_GETCONNECTIONS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_ADDCONNECTION3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_ADDCONNECTION4 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_CANCELCONNECTION2 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_GETPERFORMANCE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CON_DEFER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DIALOG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_DEVICEMODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_PROPERTYDIALOG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_SEARCHDIALOG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_FORMATNETWORKNAME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_PERMISSIONEDITOR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_GETRESOURCEPARENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_DLG_GETRESOURCEINFORMATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ADMIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ADM_GETDIRECTORYTYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ADM_DIRECTORYNOTIFY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ENUMERATION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ENUM_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ENUM_LOCAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ENUM_CONTEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_ENUM_SHAREABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_START => 12

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_WAIT_FOR_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNNC_CONNECTION_FLAGS => 13

    /**
     * @type {Integer (UInt32)}
     */
    static WNTYPE_DRIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNTYPE_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNTYPE_PRINTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static WNTYPE_COMM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNSRCH_REFRESH_FIRST_LEVEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNDT_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static WNDT_NETWORK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WN_NETWORK_CLASS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WN_CREDENTIAL_CLASS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WN_PRIMARY_AUTHENT_CLASS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WN_SERVICE_CLASS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WN_VALID_LOGON_ACCOUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WN_NT_PASSWORD_CHANGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_PRE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NOTIFY_POST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERMC_PERM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERMC_AUDIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNPERMC_OWNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCE_RECENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCETYPE_RESERVED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCETYPE_UNKNOWN => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_NOLOCALDEVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_SIBLING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEUSAGE_RESERVED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_NETWORK => 6

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_ROOT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_SHAREADMIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_DIRECTORY => 9

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_NDSCONTAINER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NETPROPERTY_PERSISTENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNFMT_INENUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WNFMT_CONNECTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static WNCON_FORNETCARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNCON_NOTROUTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WNCON_SLOWLINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static WNCON_DYNAMIC => 8
;@endregion Constants

;@region Methods
    /**
     * The WNetAddConnection function enables the calling application to connect a local device to a network resource. A successful connection is persistent, meaning that the system automatically restores the connection during subsequent logon operations.
     * @param {PSTR} lpRemoteName A pointer to a constant <b>null</b>-terminated string that specifies the network resource to connect to.
     * @param {PSTR} lpPassword A pointer to a constant <b>null</b>-terminated string that specifies the password to be used to make a connection. This parameter is usually the password associated with the current user.
     * 
     * If this parameter is <b>NULL</b>, the default password is used. If the string is empty, no password is used.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PSTR} lpLocalName A pointer to a constant <b>null</b>-terminated string that specifies the name of a local device to be redirected, such as "F:" or "LPT1". The string is treated in a case-insensitive manner. If the string is <b>NULL</b>, a connection to the network resource is made without redirecting the local device.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified in the <i>lpLocalName</i> parameter is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device type and the resource type do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>lpLocalName</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>lpRemoteName</i> parameter is not valid or cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry for the device specified in the <i>lpLocalName</i> parameter is already in the user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed because a network component is not started or because a specified name cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnectiona
     * @since windows5.0
     */
    static WNetAddConnectionA(lpRemoteName, lpPassword, lpLocalName) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName

        result := DllCall("MPR.dll\WNetAddConnectionA", "ptr", lpRemoteName, "ptr", lpPassword, "ptr", lpLocalName, "uint")
        return result
    }

    /**
     * The WNetAddConnection function enables the calling application to connect a local device to a network resource. A successful connection is persistent, meaning that the system automatically restores the connection during subsequent logon operations.
     * @param {PWSTR} lpRemoteName A pointer to a constant <b>null</b>-terminated string that specifies the network resource to connect to.
     * @param {PWSTR} lpPassword A pointer to a constant <b>null</b>-terminated string that specifies the password to be used to make a connection. This parameter is usually the password associated with the current user.
     * 
     * If this parameter is <b>NULL</b>, the default password is used. If the string is empty, no password is used.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PWSTR} lpLocalName A pointer to a constant <b>null</b>-terminated string that specifies the name of a local device to be redirected, such as "F:" or "LPT1". The string is treated in a case-insensitive manner. If the string is <b>NULL</b>, a connection to the network resource is made without redirecting the local device.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified in the <i>lpLocalName</i> parameter is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device type and the resource type do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>lpLocalName</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified in the <i>lpRemoteName</i> parameter is not valid or cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry for the device specified in the <i>lpLocalName</i> parameter is already in the user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed because a network component is not started or because a specified name cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnectionw
     * @since windows5.0
     */
    static WNetAddConnectionW(lpRemoteName, lpPassword, lpLocalName) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName

        result := DllCall("MPR.dll\WNetAddConnectionW", "ptr", lpRemoteName, "ptr", lpPassword, "ptr", lpLocalName, "uint")
        return result
    }

    /**
     * The WNetAddConnection2 function makes a connection to a network resource and can redirect a local device to the network resource.
     * @param {Pointer<NETRESOURCEA>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure that specifies details of the proposed connection, such as information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <b>NETRESOURCE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of network resource to connect to. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member points to a nonempty string, this member can be equal to RESOURCETYPE_DISK or RESOURCETYPE_PRINT.
     * 
     * If <b>lpLocalName</b> is <b>NULL</b>, or if it points to an empty string, <b>dwType</b> can be equal to RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the name of a local device to redirect, such as "F:" or "LPT1". The string is treated in a case-insensitive manner.
     * 
     * If the string is empty, or if <b>lpLocalName</b> is <b>NULL</b>, the function makes a connection to the network resource without redirecting a local device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network provider to connect to. 
     * 
     * 
     * 
     * 
     * If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member.
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know the network provider you want to use. Otherwise, let the operating system determine which provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetAddConnection2</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure.
     * @param {PSTR} lpPassword A pointer to a constant <b>null</b>-terminated string that specifies a password to be used in making the network connection.
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by the <i>lpUserName</i> parameter.
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PSTR} lpUserName A pointer to a constant <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserName</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserName</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {Integer} dwFlags A set of connection options. The possible values for the connection options are defined in the <i>Winnetwk.h</i> header file. 
     * The following values can currently be used.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should be remembered. 
     * 
     * 
     * 
     * 
     * If this bit flag is set, the operating system automatically attempts to restore the connection when the user logs on. 
     * 
     * The operating system remembers only successful connections that redirect local devices. It does not remember connections that are unsuccessful or deviceless connections. (A deviceless connection occurs when the <b>lpLocalName</b> member is <b>NULL</b> or points to an empty string.)
     * 
     * If this bit flag is clear, the operating system does not try to restore the connection when the user logs on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_RECENT"></a><a id="connect_update_recent"></a><dl>
     * <dt><b>CONNECT_UPDATE_RECENT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should not be put in the recent connection list. 
     * 
     * 
     * If this flag is set and the connection is successfully added, the network resource connection will be put in the recent connection list only if it has a redirected local device associated with it. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_TEMPORARY"></a><a id="connect_temporary"></a><dl>
     * <dt><b>CONNECT_TEMPORARY</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should not be remembered. 
     * 
     * 
     * If this flag is set, the operating system will not attempt to restore the connection when the user logs on again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_INTERACTIVE"></a><a id="connect_interactive"></a><dl>
     * <dt><b>CONNECT_INTERACTIVE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system may interact with the user for authentication purposes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_PROMPT"></a><a id="connect_prompt"></a><dl>
     * <dt><b>CONNECT_PROMPT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag instructs the system not to use any default settings for user names or passwords without offering the user the opportunity to supply an alternative. This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_REDIRECT"></a><a id="connect_redirect"></a><dl>
     * <dt><b>CONNECT_REDIRECT</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag forces the redirection of a local device when making the connection.
     * 
     * If the <b>lpLocalName</b> member of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> specifies a local device to redirect, this flag has no effect, because the operating system still attempts to redirect the specified device. When the operating system automatically chooses a local device, the <b>dwType</b> member must not be equal to RESOURCETYPE_ANY.
     * 
     * If this flag is not set, a local device is automatically chosen for redirection only if the network requires a local device to be redirected.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>When the system automatically assigns network drive letters, letters are assigned beginning with Z:, then Y:, and ending with C:. This reduces collision between per-logon drive letters (such as network drive letters) and global drive letters (such as disk drives). Note that earlier versions of Windows assigned drive letters beginning with C: and ending with Z:.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CURRENT_MEDIA"></a><a id="connect_current_media"></a><dl>
     * <dt><b>CONNECT_CURRENT_MEDIA</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, then the operating system does  not start to use a new media to try to establish the connection (initiate a new dial up connection, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_COMMANDLINE"></a><a id="connect_commandline"></a><dl>
     * <dt><b>CONNECT_COMMANDLINE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system prompts the user for authentication using the command line instead of a graphical user interface (GUI). This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * <b>Windows XP:  </b>This value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CMD_SAVECRED"></a><a id="connect_cmd_savecred"></a><dl>
     * <dt><b>CONNECT_CMD_SAVECRED</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential should be saved by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is ignored unless CONNECT_INTERACTIVE is also set. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows XP:  </b>This value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CRED_RESET"></a><a id="connect_cred_reset"></a><dl>
     * <dt><b>CONNECT_CRED_RESET</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential is reset by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows Vista:  </b>This value is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of local device and the type of network resource do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device name is not valid. This error is returned if the <b>lpLocalName</b> member of the <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a device that is not redirectable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This value is returned if the <b>lpRemoteName</b> member of the <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a resource that is not acceptable to any network resource provider, either because the resource name is empty, not valid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified network provider name is not valid. This error is returned if the <b>lpProvider</b> member of the <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value that does not match any network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified user name is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The router or provider is busy, possibly initializing. The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device name has a remembered connection to another network resource. This error is returned if an entry for the device specified by <b>lpLocalName</b> member of the <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value that is already in the user profile for a different connection than that specified in the
     *         <i>lpNetResource</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to access an invalid address. This error is returned if the <i>dwFlags</i> parameter specifies a value of CONNECT_REDIRECT, but the <b>lpLocalName</b> member  of the  <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter was unspecified.
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
     * A parameter is incorrect. This error is returned if the <b>dwType</b> member of the  <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value other than RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY. This error is also returned if the <i>dwFlags</i> parameter specifies an incorrect or unknown value. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_LOGON_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A logon failure because of an unknown user name or a bad password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No network provider accepted the given network path. This error is returned if no network provider recognized the <b>lpRemoteName</b> member of the <a href="/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnection2a
     * @since windows5.0
     */
    static WNetAddConnection2A(lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("MPR.dll\WNetAddConnection2A", "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The WNetAddConnection2 function makes a connection to a network resource and can redirect a local device to the network resource.
     * @param {Pointer<NETRESOURCEW>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies details of the proposed connection, such as information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <b>NETRESOURCE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of network resource to connect to. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member points to a nonempty string, this member can be equal to RESOURCETYPE_DISK or RESOURCETYPE_PRINT.
     * 
     * If <b>lpLocalName</b> is <b>NULL</b>, or if it points to an empty string, <b>dwType</b> can be equal to RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the name of a local device to redirect, such as "F:" or "LPT1". The string is treated in a case-insensitive manner.
     * 
     * If the string is empty, or if <b>lpLocalName</b> is <b>NULL</b>, the function makes a connection to the network resource without redirecting a local device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network provider to connect to. 
     * 
     * 
     * 
     * 
     * If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member.
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know the network provider you want to use. Otherwise, let the operating system determine which provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetAddConnection2</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure.
     * @param {PWSTR} lpPassword A pointer to a constant <b>null</b>-terminated string that specifies a password to be used in making the network connection.
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by the <i>lpUserName</i> parameter.
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PWSTR} lpUserName A pointer to a constant <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserName</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserName</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {Integer} dwFlags A set of connection options. The possible values for the connection options are defined in the <i>Winnetwk.h</i> header file. 
     * The following values can currently be used.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should be remembered. 
     * 
     * 
     * 
     * 
     * If this bit flag is set, the operating system automatically attempts to restore the connection when the user logs on. 
     * 
     * The operating system remembers only successful connections that redirect local devices. It does not remember connections that are unsuccessful or deviceless connections. (A deviceless connection occurs when the <b>lpLocalName</b> member is <b>NULL</b> or points to an empty string.)
     * 
     * If this bit flag is clear, the operating system does not try to restore the connection when the user logs on.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_RECENT"></a><a id="connect_update_recent"></a><dl>
     * <dt><b>CONNECT_UPDATE_RECENT</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should not be put in the recent connection list. 
     * 
     * 
     * If this flag is set and the connection is successfully added, the network resource connection will be put in the recent connection list only if it has a redirected local device associated with it. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_TEMPORARY"></a><a id="connect_temporary"></a><dl>
     * <dt><b>CONNECT_TEMPORARY</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should not be remembered. 
     * 
     * 
     * If this flag is set, the operating system will not attempt to restore the connection when the user logs on again.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_INTERACTIVE"></a><a id="connect_interactive"></a><dl>
     * <dt><b>CONNECT_INTERACTIVE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system may interact with the user for authentication purposes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_PROMPT"></a><a id="connect_prompt"></a><dl>
     * <dt><b>CONNECT_PROMPT</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag instructs the system not to use any default settings for user names or passwords without offering the user the opportunity to supply an alternative. This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_REDIRECT"></a><a id="connect_redirect"></a><dl>
     * <dt><b>CONNECT_REDIRECT</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag forces the redirection of a local device when making the connection.
     * 
     * If the <b>lpLocalName</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> specifies a local device to redirect, this flag has no effect, because the operating system still attempts to redirect the specified device. When the operating system automatically chooses a local device, the <b>dwType</b> member must not be equal to RESOURCETYPE_ANY.
     * 
     * If this flag is not set, a local device is automatically chosen for redirection only if the network requires a local device to be redirected.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>When the system automatically assigns network drive letters, letters are assigned beginning with Z:, then Y:, and ending with C:. This reduces collision between per-logon drive letters (such as network drive letters) and global drive letters (such as disk drives). Note that earlier versions of Windows assigned drive letters beginning with C: and ending with Z:.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CURRENT_MEDIA"></a><a id="connect_current_media"></a><dl>
     * <dt><b>CONNECT_CURRENT_MEDIA</b></dt>
     * <dt>0x00000200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, then the operating system does  not start to use a new media to try to establish the connection (initiate a new dial up connection, for example).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_COMMANDLINE"></a><a id="connect_commandline"></a><dl>
     * <dt><b>CONNECT_COMMANDLINE</b></dt>
     * <dt>0x00000800</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system prompts the user for authentication using the command line instead of a graphical user interface (GUI). This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * <b>Windows XP:  </b>This value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CMD_SAVECRED"></a><a id="connect_cmd_savecred"></a><dl>
     * <dt><b>CONNECT_CMD_SAVECRED</b></dt>
     * <dt>0x00001000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential should be saved by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is ignored unless CONNECT_INTERACTIVE is also set. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows XP:  </b>This value is supported on Windows XP and later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CRED_RESET"></a><a id="connect_cred_reset"></a><dl>
     * <dt><b>CONNECT_CRED_RESET</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential is reset by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows Vista:  </b>This value is supported on Windows Vista and later.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value can be one of the following error codes or one of the 
     * <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of local device and the type of network resource do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified device name is not valid. This error is returned if the <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a device that is not redirectable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This value is returned if the <b>lpRemoteName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a resource that is not acceptable to any network resource provider, either because the resource name is empty, not valid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified network provider name is not valid. This error is returned if the <b>lpProvider</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value that does not match any network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_USERNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified user name is not valid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The router or provider is busy, possibly initializing. The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device name has a remembered connection to another network resource. This error is returned if an entry for the device specified by <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value that is already in the user profile for a different connection than that specified in the
     *         <i>lpNetResource</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to access an invalid address. This error is returned if the <i>dwFlags</i> parameter specifies a value of CONNECT_REDIRECT, but the <b>lpLocalName</b> member  of the  <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter was unspecified.
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
     * A parameter is incorrect. This error is returned if the <b>dwType</b> member of the  <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter specifies a value other than RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY. This error is also returned if the <i>dwFlags</i> parameter specifies an incorrect or unknown value. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_LOGON_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A logon failure because of an unknown user name or a bad password.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No network provider accepted the given network path. This error is returned if no network provider recognized the <b>lpRemoteName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the <i>lpNetResource</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Other</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnection2w
     * @since windows5.0
     */
    static WNetAddConnection2W(lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("MPR.dll\WNetAddConnection2W", "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The WNetAddConnection3 function makes a connection to a network resource. The function can redirect a local device to the network resource.
     * @param {HWND} hwndOwner A handle to a window that the provider of network resources can use as an owner window for dialog boxes. Use this parameter if you set the CONNECT_INTERACTIVE value in the <i>dwFlags</i> parameter.
     * 
     * The <i>hwndOwner</i> parameter can be <b>NULL</b>. If it is, a call to 
     * <b>WNetAddConnection3</b> is equivalent to calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> function.
     * @param {Pointer<NETRESOURCEA>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies details of the proposed connection, such as information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of network resource to connect to. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member points to a nonempty string, this member can be equal to RESOURCETYPE_DISK or RESOURCETYPE_PRINT.
     * 
     * If <b>lpLocalName</b> is <b>NULL</b>, or if it points to an empty string, <b>dwType</b> can be equal to RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the name of a local device to redirect, such as "F:" or "LPT1". The string is treated in a case-insensitive manner.
     * 
     * If the string is empty or if <b>lpLocalName</b> is <b>NULL</b>, the function makes a connection to the network resource without redirecting a local device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network provider to connect to.
     * 
     * If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member.
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know which network provider you want to use. Otherwise, let the operating system determine which network provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetAddConnection3</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure.
     * @param {PSTR} lpPassword A pointer to a <b>null</b>-terminated string that specifies a password to be used in making the network connection. 
     * 
     * 
     * 
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by the <i>lpUserName</i> parameter.
     * 						
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PSTR} lpUserName A pointer to a <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserName</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserName</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {Integer} dwFlags A set of connection options. The following values are currently defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_INTERACTIVE"></a><a id="connect_interactive"></a><dl>
     * <dt><b>CONNECT_INTERACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system may interact with the user for authentication purposes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_PROMPT"></a><a id="connect_prompt"></a><dl>
     * <dt><b>CONNECT_PROMPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag instructs the system not to use any default settings for user names or passwords without offering the user the opportunity to supply an alternative. This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_REDIRECT"></a><a id="connect_redirect"></a><dl>
     * <dt><b>CONNECT_REDIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag forces the redirection of a local device when making the connection. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> specifies a local device to redirect, this flag has no effect, because the operating system still attempts to redirect the specified device. When the operating system automatically chooses a local device, the <b>dwType</b> member must not be equal to RESOURCETYPE_ANY.
     * 
     * If this flag is not set, a local device is automatically chosen for redirection only if the network requires a local device to be redirected.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>When the system automatically assigns network drive letters, letters are assigned beginning with Z:, then Y:, and ending with C:. This reduces collision between per-logon drive letters (such as network drive letters) and global drive letters (such as disk drives). Note that earlier versions of Windows assigned drive letters beginning with C: and ending with Z:.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should be remembered.
     * 
     * If this bit flag is set, the operating system automatically attempts to restore the connection when the user logs on.
     * 
     * The operating system remembers only successful connections that redirect local devices. It does not remember connections that are unsuccessful or deviceless connections. (A deviceless connection occurs when the <b>lpLocalName</b> member is <b>NULL</b> or when it points to an empty string.)
     * 
     * If this bit flag is clear, the operating system does not automatically restore the connection at logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_COMMANDLINE"></a><a id="connect_commandline"></a><dl>
     * <dt><b>CONNECT_COMMANDLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system prompts the user for authentication using the command line instead of a graphical user interface (GUI). This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * <b>Windows 2000/NT and Windows Me/98/95:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CMD_SAVECRED"></a><a id="connect_cmd_savecred"></a><dl>
     * <dt><b>CONNECT_CMD_SAVECRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential should be saved by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows 2000/NT and Windows Me/98/95:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of local device and the type of network resource do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <b>lpLocalName</b> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpRemoteName</b> member is not acceptable to any network resource provider, either because the resource name is invalid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpProvider</b> member does not match any provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The router or provider is busy, possibly initializing. The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry for the device specified by the <b>lpLocalName</b> member is already in the user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed because a network component is not started or because a specified name cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnection3a
     * @since windows5.0
     */
    static WNetAddConnection3A(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetAddConnection3A", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * The WNetAddConnection3 function makes a connection to a network resource. The function can redirect a local device to the network resource.
     * @param {HWND} hwndOwner A handle to a window that the provider of network resources can use as an owner window for dialog boxes. Use this parameter if you set the CONNECT_INTERACTIVE value in the <i>dwFlags</i> parameter.
     * 
     * The <i>hwndOwner</i> parameter can be <b>NULL</b>. If it is, a call to 
     * <b>WNetAddConnection3</b> is equivalent to calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetaddconnection2a">WNetAddConnection2</a> function.
     * @param {Pointer<NETRESOURCEW>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies details of the proposed connection, such as information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of network resource to connect to. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member points to a nonempty string, this member can be equal to RESOURCETYPE_DISK or RESOURCETYPE_PRINT.
     * 
     * If <b>lpLocalName</b> is <b>NULL</b>, or if it points to an empty string, <b>dwType</b> can be equal to RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the name of a local device to redirect, such as "F:" or "LPT1". The string is treated in a case-insensitive manner.
     * 
     * If the string is empty or if <b>lpLocalName</b> is <b>NULL</b>, the function makes a connection to the network resource without redirecting a local device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a <b>null</b>-terminated string that specifies the network provider to connect to.
     * 
     * If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member.
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know which network provider you want to use. Otherwise, let the operating system determine which network provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetAddConnection3</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure.
     * @param {PWSTR} lpPassword A pointer to a <b>null</b>-terminated string that specifies a password to be used in making the network connection. 
     * 
     * 
     * 
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by the <i>lpUserName</i> parameter.
     * 						
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {PWSTR} lpUserName A pointer to a <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserName</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserName</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * 
     * <b>Windows Me/98/95:  </b>This parameter must be <b>NULL</b> or an empty string.
     * @param {Integer} dwFlags A set of connection options. The following values are currently defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_INTERACTIVE"></a><a id="connect_interactive"></a><dl>
     * <dt><b>CONNECT_INTERACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system may interact with the user for authentication purposes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_PROMPT"></a><a id="connect_prompt"></a><dl>
     * <dt><b>CONNECT_PROMPT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag instructs the system not to use any default settings for user names or passwords without offering the user the opportunity to supply an alternative. This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_REDIRECT"></a><a id="connect_redirect"></a><dl>
     * <dt><b>CONNECT_REDIRECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This flag forces the redirection of a local device when making the connection. 
     * 
     * 
     * 
     * 
     * If the <b>lpLocalName</b> member of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> specifies a local device to redirect, this flag has no effect, because the operating system still attempts to redirect the specified device. When the operating system automatically chooses a local device, the <b>dwType</b> member must not be equal to RESOURCETYPE_ANY.
     * 
     * If this flag is not set, a local device is automatically chosen for redirection only if the network requires a local device to be redirected.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>When the system automatically assigns network drive letters, letters are assigned beginning with Z:, then Y:, and ending with C:. This reduces collision between per-logon drive letters (such as network drive letters) and global drive letters (such as disk drives). Note that earlier versions of Windows assigned drive letters beginning with C: and ending with Z:.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource connection should be remembered.
     * 
     * If this bit flag is set, the operating system automatically attempts to restore the connection when the user logs on.
     * 
     * The operating system remembers only successful connections that redirect local devices. It does not remember connections that are unsuccessful or deviceless connections. (A deviceless connection occurs when the <b>lpLocalName</b> member is <b>NULL</b> or when it points to an empty string.)
     * 
     * If this bit flag is clear, the operating system does not automatically restore the connection at logon.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_COMMANDLINE"></a><a id="connect_commandline"></a><dl>
     * <dt><b>CONNECT_COMMANDLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the operating system prompts the user for authentication using the command line instead of a graphical user interface (GUI). This flag is ignored unless CONNECT_INTERACTIVE is also set.
     * 
     * <b>Windows 2000/NT and Windows Me/98/95:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_CMD_SAVECRED"></a><a id="connect_cmd_savecred"></a><dl>
     * <dt><b>CONNECT_CMD_SAVECRED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, and the operating system prompts for a credential, the credential should be saved by the credential manager. If the credential manager is disabled for the caller's logon session, or if the network provider does not support saving credentials, this flag is ignored. This flag is also ignored unless you set the CONNECT_COMMANDLINE flag.
     * 
     * <b>Windows 2000/NT and Windows Me/98/95:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The type of local device and the type of network resource do not match.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <b>lpLocalName</b> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpRemoteName</b> member is not acceptable to any network resource provider, either because the resource name is invalid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpProvider</b> member does not match any provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The router or provider is busy, possibly initializing. The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_ALREADY_REMEMBERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An entry for the device specified by the <b>lpLocalName</b> member is already in the user profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation cannot be performed because a network component is not started or because a specified name cannot be used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetaddconnection3w
     * @since windows5.0
     */
    static WNetAddConnection3W(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetAddConnection3W", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEA>} lpNetResource 
     * @param {Pointer} pAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @returns {Integer} 
     */
    static WNetAddConnection4A(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetAddConnection4A", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer} pAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @returns {Integer} 
     */
    static WNetAddConnection4W(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetAddConnection4W", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "uint")
        return result
    }

    /**
     * The WNetCancelConnection function cancels an existing network connection.
     * @param {PSTR} lpName Pointer to a constant null-terminated string that specifies the name of either the redirected local device or the remote network resource to disconnect from. 
     * 
     * 
     * 
     * 
     * When this parameter specifies a redirected local device, the function cancels only the specified device redirection. If the parameter specifies a remote network resource, only the connections to remote networks without devices are canceled.
     * @param {BOOL} fForce Specifies whether or not the disconnection should occur if there are open files or jobs on the connection. If this parameter is <b>FALSE</b>, the function fails if there are open files or jobs.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is in use by an active process and cannot be disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>lpName</i> parameter is not a redirected device, or the system is not currently connected to the device specified by the parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files, and the <i>fForce</i> parameter is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetcancelconnectiona
     * @since windows5.0
     */
    static WNetCancelConnectionA(lpName, fForce) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("MPR.dll\WNetCancelConnectionA", "ptr", lpName, "int", fForce, "uint")
        return result
    }

    /**
     * The WNetCancelConnection function cancels an existing network connection.
     * @param {PWSTR} lpName Pointer to a constant null-terminated string that specifies the name of either the redirected local device or the remote network resource to disconnect from. 
     * 
     * 
     * 
     * 
     * When this parameter specifies a redirected local device, the function cancels only the specified device redirection. If the parameter specifies a remote network resource, only the connections to remote networks without devices are canceled.
     * @param {BOOL} fForce Specifies whether or not the disconnection should occur if there are open files or jobs on the connection. If this parameter is <b>FALSE</b>, the function fails if there are open files or jobs.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is in use by an active process and cannot be disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>lpName</i> parameter is not a redirected device, or the system is not currently connected to the device specified by the parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files, and the <i>fForce</i> parameter is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetcancelconnectionw
     * @since windows5.0
     */
    static WNetCancelConnectionW(lpName, fForce) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("MPR.dll\WNetCancelConnectionW", "ptr", lpName, "int", fForce, "uint")
        return result
    }

    /**
     * The WNetCancelConnection2 function cancels an existing network connection. You can also call the function to remove remembered network connections that are not currently connected.
     * @param {PSTR} lpName Pointer to a constant <b>null</b>-terminated string that specifies the name of either the redirected local device or the remote network resource to disconnect from. 
     * 
     * 
     * 
     * 
     * If  this parameter specifies a redirected local device, the function cancels only the specified device redirection. If the parameter specifies a remote network resource, all connections without devices are canceled.
     * @param {Integer} dwFlags Connection type. The following values are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not update information about the connection. 
     * 
     * 
     * 
     * 
     * If the connection was marked as persistent in the registry, the system continues to restore the connection at the next logon. If the connection was not marked as persistent, the function ignores the setting of the CONNECT_UPDATE_PROFILE flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system updates the user profile with the information that the connection is no longer a persistent one. 
     * 
     * 
     * 
     * 
     * The system will not restore this connection during subsequent logon operations. (Disconnecting resources using remote names has no effect on persistent connections.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fForce Specifies whether the disconnection should occur if there are open files or jobs on the connection. If this parameter is <b>FALSE</b>, the function fails if there are open files or jobs.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is in use by an active process and cannot be disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>lpName</i> parameter is not a redirected device, or the system is not currently connected to the device specified by the parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files, and the <i>fForce</i> parameter is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetcancelconnection2a
     * @since windows5.0
     */
    static WNetCancelConnection2A(lpName, dwFlags, fForce) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("MPR.dll\WNetCancelConnection2A", "ptr", lpName, "uint", dwFlags, "int", fForce, "uint")
        return result
    }

    /**
     * The WNetCancelConnection2 function cancels an existing network connection. You can also call the function to remove remembered network connections that are not currently connected.
     * @param {PWSTR} lpName Pointer to a constant <b>null</b>-terminated string that specifies the name of either the redirected local device or the remote network resource to disconnect from. 
     * 
     * 
     * 
     * 
     * If  this parameter specifies a redirected local device, the function cancels only the specified device redirection. If the parameter specifies a remote network resource, all connections without devices are canceled.
     * @param {Integer} dwFlags Connection type. The following values are defined. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="0"></a><dl>
     * <dt><b>0</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system does not update information about the connection. 
     * 
     * 
     * 
     * 
     * If the connection was marked as persistent in the registry, the system continues to restore the connection at the next logon. If the connection was not marked as persistent, the function ignores the setting of the CONNECT_UPDATE_PROFILE flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_UPDATE_PROFILE"></a><a id="connect_update_profile"></a><dl>
     * <dt><b>CONNECT_UPDATE_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system updates the user profile with the information that the connection is no longer a persistent one. 
     * 
     * 
     * 
     * 
     * The system will not restore this connection during subsequent logon operations. (Disconnecting resources using remote names has no effect on persistent connections.)
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BOOL} fForce Specifies whether the disconnection should occur if there are open files or jobs on the connection. If this parameter is <b>FALSE</b>, the function fails if there are open files or jobs.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user profile is in an incorrect format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANNOT_OPEN_PROFILE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is unable to open the user profile to process persistent connections.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEVICE_IN_USE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is in use by an active process and cannot be disconnected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The name specified by the <i>lpName</i> parameter is not a redirected device, or the system is not currently connected to the device specified by the parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files, and the <i>fForce</i> parameter is <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetcancelconnection2w
     * @since windows5.0
     */
    static WNetCancelConnection2W(lpName, dwFlags, fForce) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("MPR.dll\WNetCancelConnection2W", "ptr", lpName, "uint", dwFlags, "int", fForce, "uint")
        return result
    }

    /**
     * The WNetGetConnection function retrieves the name of the network resource associated with a local device.
     * @param {PSTR} lpLocalName Pointer to a constant null-terminated string that specifies the name of the local device to get the network name for.
     * @param {PSTR} lpRemoteName Pointer to a null-terminated  string  that receives the remote name used to make the connection.
     * @param {Pointer<UInt32>} lpnLength Pointer to a variable that specifies the size of the buffer pointed to by the <i>lpRemoteName</i> parameter, in characters. If the function fails because the buffer is not large enough, this parameter returns the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string pointed to by the <i>lpLocalName</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by <i>lpLocalName</i> is not a redirected device. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small. The <i>lpnLength</i> parameter points to a variable that contains the required buffer size. More entries are available with subsequent calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_UNAVAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not currently connected, but it is a persistent connection. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetconnectiona
     * @since windows5.0
     */
    static WNetGetConnectionA(lpLocalName, lpRemoteName, lpnLength) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        result := DllCall("MPR.dll\WNetGetConnectionA", "ptr", lpLocalName, "ptr", lpRemoteName, "uint*", lpnLength, "uint")
        return result
    }

    /**
     * The WNetGetConnection function retrieves the name of the network resource associated with a local device.
     * @param {PWSTR} lpLocalName Pointer to a constant null-terminated string that specifies the name of the local device to get the network name for.
     * @param {PWSTR} lpRemoteName Pointer to a null-terminated  string  that receives the remote name used to make the connection.
     * @param {Pointer<UInt32>} lpnLength Pointer to a variable that specifies the size of the buffer pointed to by the <i>lpRemoteName</i> parameter, in characters. If the function fails because the buffer is not large enough, this parameter returns the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string pointed to by the <i>lpLocalName</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by <i>lpLocalName</i> is not a redirected device. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small. The <i>lpnLength</i> parameter points to a variable that contains the required buffer size. More entries are available with subsequent calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_UNAVAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not currently connected, but it is a persistent connection. For more information, see the following Remarks section.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetconnectionw
     * @since windows5.0
     */
    static WNetGetConnectionW(lpLocalName, lpRemoteName, lpnLength) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        result := DllCall("MPR.dll\WNetGetConnectionW", "ptr", lpLocalName, "ptr", lpRemoteName, "uint*", lpnLength, "uint")
        return result
    }

    /**
     * The WNetUseConnection function makes a connection to a network resource. The function can redirect a local device to a network resource.
     * @param {HWND} hwndOwner Handle to a window that the provider of network resources can use as an owner window for dialog boxes. Use this parameter if you set the CONNECT_INTERACTIVE value in the <i>dwFlags</i> parameter.
     * @param {Pointer<NETRESOURCEA>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies details of the proposed connection. The structure contains information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <b>NETRESOURCE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the type of resource to connect to. 
     * 
     * 
     * 
     * 
     * It is most efficient to specify a resource type in this member, such as RESOURCETYPE_DISK or RESOURCETYPE_PRINT. However, if the <b>lpLocalName</b> member is <b>NULL</b>, or if it points to an empty string and CONNECT_REDIRECT is not set, <b>dwType</b> can be RESOURCETYPE_ANY.
     * 
     * This method works only if the function does not automatically choose a device to redirect to the network resource.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the name of a local device to be redirected, such as "F:" or "LPT1". The string is treated in a case-insensitive manner. 
     * 
     * 
     * 
     * 
     * If the string is empty, or if <b>lpLocalName</b> is <b>NULL</b>, a connection to the network occurs without redirection.
     * 
     * If the CONNECT_REDIRECT value is set in the <i>dwFlags</i> parameter, or if the network requires a redirected local device, the function chooses a local device to redirect and returns the name of the device in the <i>lpAccessName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and it must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the network provider to connect to. If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member. 
     * 
     * 
     * 
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know the network provider you want to use. Otherwise, let the operating system determine which provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetUseConnection</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure. For more information, see the descriptions following for the <i>dwFlags</i> parameter.
     * @param {PSTR} lpPassword Pointer to a constant <b>null</b>-terminated string that specifies a password to be used in making the network connection. 
     * 
     * 
     * 
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by <i>lpUserID</i>.
     * 						
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * @param {PSTR} lpUserId Pointer to a constant <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserID</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserID</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * @param {Integer} dwFlags 
     * @param {PSTR} lpAccessName Pointer to a buffer that receives system requests on the connection. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is specified, and the <b>lpLocalName</b> member of the 
     * <b>NETRESOURCE</b> structure specifies a local device, this buffer receives the local device name. If <b>lpLocalName</b> does not specify a device and the network requires a local device redirection, or if the CONNECT_REDIRECT value is set, this buffer receives the name of the redirected local device.
     * 
     * Otherwise, the name copied into the buffer is that of a remote resource. If specified, this buffer must be at least as large as the string pointed to by the <b>lpRemoteName</b> member.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a variable that specifies the size of the <i>lpAccessName</i> buffer, in characters. If the call fails because the buffer is not large enough, the function returns the required buffer size in this location. For more information, see the descriptions of the <i>lpAccessName</i> parameter and the ERROR_MORE_DATA error code in the Return Values section.
     * @param {Pointer<UInt32>} lpResult Pointer to a variable that receives additional information about the connection. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_LOCALDRIVE"></a><a id="connect_localdrive"></a><dl>
     * <dt><b>CONNECT_LOCALDRIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the connection was made using a local device redirection. If the <i>lpAccessName</i> parameter points to a buffer, the local device name is copied to the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <b>lpLocalName</b> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpRemoteName</b> member is not acceptable to any network resource provider because the resource name is invalid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpProvider</b> member does not match any provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed in a pointer to a buffer that could not be accessed.
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
     * This error is a result of one of the following conditions: 
     * 
     * 
     * 
     * 
     * <ol>
     * <li>The <b>lpRemoteName</b> member is <b>NULL</b>. In addition, <i>lpAccessName</i> is not <b>NULL</b>, but <i>lpBufferSize</i> is either <b>NULL</b> or points to zero.</li>
     * <li>The <b>dwType</b> member is neither RESOURCETYPE_DISK nor RESOURCETYPE_PRINT. In addition, either CONNECT_REDIRECT is set in <i>dwFlags</i> and <b>lpLocalName</b> is <b>NULL</b>, or the connection is to a network that requires the redirecting of a local device.</li>
     * </ol>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpAccessName</i> buffer is too small. 
     * 
     * 
     * 
     * 
     * If a local device is redirected, the buffer needs to be large enough to contain the local device name. Otherwise, the buffer needs to be large enough to contain either the string pointed to by <b>lpRemoteName</b>, or the name of the connectable resource whose alias is pointed to by <b>lpRemoteName</b>. If this error is returned, then no connection has been made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system cannot automatically choose a local redirection because all the valid local devices are in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed, either because a network component is not started, or because the specified resource name is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetuseconnectiona
     * @since windows5.0
     */
    static WNetUseConnectionA(hwndOwner, lpNetResource, lpPassword, lpUserId, dwFlags, lpAccessName, lpBufferSize, lpResult) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserId := lpUserId is String ? StrPtr(lpUserId) : lpUserId
        lpAccessName := lpAccessName is String ? StrPtr(lpAccessName) : lpAccessName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetUseConnectionA", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserId, "uint", dwFlags, "ptr", lpAccessName, "uint*", lpBufferSize, "uint*", lpResult, "uint")
        return result
    }

    /**
     * The WNetUseConnection function makes a connection to a network resource. The function can redirect a local device to a network resource.
     * @param {HWND} hwndOwner Handle to a window that the provider of network resources can use as an owner window for dialog boxes. Use this parameter if you set the CONNECT_INTERACTIVE value in the <i>dwFlags</i> parameter.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies details of the proposed connection. The structure contains information about the network resource, the local device, and the network resource provider. 
     * 
     * 
     * 
     * 
     * You must specify the following members of the 
     * <b>NETRESOURCE</b> structure.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the type of resource to connect to. 
     * 
     * 
     * 
     * 
     * It is most efficient to specify a resource type in this member, such as RESOURCETYPE_DISK or RESOURCETYPE_PRINT. However, if the <b>lpLocalName</b> member is <b>NULL</b>, or if it points to an empty string and CONNECT_REDIRECT is not set, <b>dwType</b> can be RESOURCETYPE_ANY.
     * 
     * This method works only if the function does not automatically choose a device to redirect to the network resource.
     * 
     * Although this member is required, its information may be ignored by the network service provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the name of a local device to be redirected, such as "F:" or "LPT1". The string is treated in a case-insensitive manner. 
     * 
     * 
     * 
     * 
     * If the string is empty, or if <b>lpLocalName</b> is <b>NULL</b>, a connection to the network occurs without redirection.
     * 
     * If the CONNECT_REDIRECT value is set in the <i>dwFlags</i> parameter, or if the network requires a redirected local device, the function chooses a local device to redirect and returns the name of the device in the <i>lpAccessName</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the network resource to connect to. The string can be up to MAX_PATH characters in length, and it must follow the network provider's naming conventions.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pointer to a <b>null</b>-terminated string that specifies the network provider to connect to. If <b>lpProvider</b> is <b>NULL</b>, or if it points to an empty string, the operating system attempts to determine the correct provider by parsing the string pointed to by the <b>lpRemoteName</b> member. 
     * 
     * 
     * 
     * 
     * If this member is not <b>NULL</b>, the operating system attempts to make a connection only to the named network provider.
     * 
     * You should set this member only if you know the network provider you want to use. Otherwise, let the operating system determine which provider the network name maps to.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The 
     * <b>WNetUseConnection</b> function ignores the other members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure. For more information, see the descriptions following for the <i>dwFlags</i> parameter.
     * @param {PWSTR} lpPassword Pointer to a constant <b>null</b>-terminated string that specifies a password to be used in making the network connection. 
     * 
     * 
     * 
     * 
     * If <i>lpPassword</i> is <b>NULL</b>, the function uses the current default password associated with the user specified by <i>lpUserID</i>.
     * 						
     * 
     * If <i>lpPassword</i> points to an empty string, the function does not use a password.
     * 
     * If the connection fails because of an invalid password and the CONNECT_INTERACTIVE value is set in the <i>dwFlags</i> parameter, the function displays a dialog box asking the user to type the password.
     * @param {PWSTR} lpUserId Pointer to a constant <b>null</b>-terminated string that specifies a user name for making the connection. 
     * 
     * 
     * 
     * 
     * If <i>lpUserID</i> is <b>NULL</b>, the function uses the default user name. (The user context for the process provides the default user name.)
     * 
     * The <i>lpUserID</i> parameter is specified when users want to connect to a network resource for which they have been assigned a user name or account other than the default user name or account.
     * 
     * The user-name string represents a 
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a>. It may be specific to a network provider.
     * @param {Integer} dwFlags 
     * @param {PWSTR} lpAccessName Pointer to a buffer that receives system requests on the connection. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is specified, and the <b>lpLocalName</b> member of the 
     * <b>NETRESOURCE</b> structure specifies a local device, this buffer receives the local device name. If <b>lpLocalName</b> does not specify a device and the network requires a local device redirection, or if the CONNECT_REDIRECT value is set, this buffer receives the name of the redirected local device.
     * 
     * Otherwise, the name copied into the buffer is that of a remote resource. If specified, this buffer must be at least as large as the string pointed to by the <b>lpRemoteName</b> member.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a variable that specifies the size of the <i>lpAccessName</i> buffer, in characters. If the call fails because the buffer is not large enough, the function returns the required buffer size in this location. For more information, see the descriptions of the <i>lpAccessName</i> parameter and the ERROR_MORE_DATA error code in the Return Values section.
     * @param {Pointer<UInt32>} lpResult Pointer to a variable that receives additional information about the connection. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CONNECT_LOCALDRIVE"></a><a id="connect_localdrive"></a><dl>
     * <dt><b>CONNECT_LOCALDRIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is set, the connection was made using a local device redirection. If the <i>lpAccessName</i> parameter points to a buffer, the local device name is copied to the buffer.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ALREADY_ASSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <b>lpLocalName</b> member is already connected to a network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by <b>lpLocalName</b> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpRemoteName</b> member is not acceptable to any network resource provider because the resource name is invalid, or because the named resource cannot be located.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value specified by the <b>lpProvider</b> member does not match any provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user through a dialog box from one of the network resource providers, or by a called resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed in a pointer to a buffer that could not be accessed.
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
     * This error is a result of one of the following conditions: 
     * 
     * 
     * 
     * 
     * <ol>
     * <li>The <b>lpRemoteName</b> member is <b>NULL</b>. In addition, <i>lpAccessName</i> is not <b>NULL</b>, but <i>lpBufferSize</i> is either <b>NULL</b> or points to zero.</li>
     * <li>The <b>dwType</b> member is neither RESOURCETYPE_DISK nor RESOURCETYPE_PRINT. In addition, either CONNECT_REDIRECT is set in <i>dwFlags</i> and <b>lpLocalName</b> is <b>NULL</b>, or the connection is to a network that requires the redirecting of a local device.</li>
     * </ol>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid and the CONNECT_INTERACTIVE flag is not set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpAccessName</i> buffer is too small. 
     * 
     * 
     * 
     * 
     * If a local device is redirected, the buffer needs to be large enough to contain the local device name. Otherwise, the buffer needs to be large enough to contain either the string pointed to by <b>lpRemoteName</b>, or the name of the connectable resource whose alias is pointed to by <b>lpRemoteName</b>. If this error is returned, then no connection has been made.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operating system cannot automatically choose a local redirection because all the valid local devices are in use.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed, either because a network component is not started, or because the specified resource name is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetuseconnectionw
     * @since windows5.0
     */
    static WNetUseConnectionW(hwndOwner, lpNetResource, lpPassword, lpUserId, dwFlags, lpAccessName, lpBufferSize, lpResult) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserId := lpUserId is String ? StrPtr(lpUserId) : lpUserId
        lpAccessName := lpAccessName is String ? StrPtr(lpAccessName) : lpAccessName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetUseConnectionW", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserId, "uint", dwFlags, "ptr", lpAccessName, "uint*", lpBufferSize, "uint*", lpResult, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEA>} lpNetResource 
     * @param {Pointer} pAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @param {PSTR} lpAccessName 
     * @param {Pointer<UInt32>} lpBufferSize 
     * @param {Pointer<UInt32>} lpResult 
     * @returns {Integer} 
     */
    static WNetUseConnection4A(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions, lpAccessName, lpBufferSize, lpResult) {
        lpAccessName := lpAccessName is String ? StrPtr(lpAccessName) : lpAccessName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetUseConnection4A", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "ptr", lpAccessName, "uint*", lpBufferSize, "uint*", lpResult, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer} pAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @param {PWSTR} lpAccessName 
     * @param {Pointer<UInt32>} lpBufferSize 
     * @param {Pointer<UInt32>} lpResult 
     * @returns {Integer} 
     */
    static WNetUseConnection4W(hwndOwner, lpNetResource, pAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions, lpAccessName, lpBufferSize, lpResult) {
        lpAccessName := lpAccessName is String ? StrPtr(lpAccessName) : lpAccessName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("MPR.dll\WNetUseConnection4W", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", pAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "ptr", lpAccessName, "uint*", lpBufferSize, "uint*", lpResult, "uint")
        return result
    }

    /**
     * The WNetConnectionDialog function starts a general browsing dialog box for connecting to network resources. The function requires a handle to the owner window for the dialog box.
     * @param {HWND} hwnd Handle to the owner window for the dialog box.
     * @param {Integer} dwType Resource type to allow connections to. This parameter can be the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCETYPE_DISK"></a><a id="resourcetype_disk"></a><dl>
     * <dt><b>RESOURCETYPE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Connections to disk resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. If the user cancels the dialog box, the function returns –1.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to start the dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetconnectiondialog
     * @since windows5.0
     */
    static WNetConnectionDialog(hwnd, dwType) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MPR.dll\WNetConnectionDialog", "ptr", hwnd, "uint", dwType, "uint")
        return result
    }

    /**
     * The WNetDisconnectDialog function starts a general browsing dialog box for disconnecting from network resources. The function requires a handle to the owner window for the dialog box.
     * @param {HWND} hwnd Handle to the owner window for the dialog box.
     * @param {Integer} dwType Resource type to disconnect from. This parameter can have the following value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCETYPE_DISK"></a><a id="resourcetype_disk"></a><dl>
     * <dt><b>RESOURCETYPE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disconnects from disk resources.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. If the user cancels the dialog box, the return value is –1.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to start the dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetdisconnectdialog
     * @since windows5.0
     */
    static WNetDisconnectDialog(hwnd, dwType) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := DllCall("MPR.dll\WNetDisconnectDialog", "ptr", hwnd, "uint", dwType, "uint")
        return result
    }

    /**
     * The WNetConnectionDialog1 function brings up a general browsing dialog for connecting to network resources. The function requires a CONNECTDLGSTRUCT to establish the dialog box parameters.
     * @param {Pointer<CONNECTDLGSTRUCTA>} lpConnDlgStruct Pointer to a 
     * <b>CONNECTDLGSTRUCT</b> structure. The structure establishes the browsing dialog parameters.
     * @returns {Integer} If the user cancels the dialog box, the function returns –1. If the function is successful, it returns NO_ERROR. Also, if the call is successful, the <b>dwDevNum</b> member of the 
     * <b>CONNECTDLGSTRUCT</b> structure contains the number of the connected device.
     * 
     * Typically this dialog returns an error only if the user cannot enter a dialog session. This is because errors that occur after a dialog session are reported to the user directly. If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
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
     * Both the CONNDLG_RO_PATH and the CONNDLG_USE_MRU dialog box options are set. (Dialog box options are specified by the <b>dwFlags</b> member of the 
     * <a href="/windows/desktop/api/winnetwk/ns-winnetwk-connectdlgstructa">CONNECTDLGSTRUCT</a> structure.) 
     * 
     * 
     * 
     * 
     * -or-
     * 
     * Both the CONNDLG_PERSIST and the CONNDLG_NOT_PERSIST dialog box options are set.
     * 
     * -or-
     * 
     * The CONNDLG_RO_PATH dialog box option is set and the <b>lpRemoteName</b> member of the 
     * <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure does not point to a remote network. (The 
     * <b>CONNECTDLGSTRUCT</b> structure points to a 
     * <b>NETRESOURCE</b> structure.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwType</b> member of the 
     * <b>NETRESOURCE</b> structure is not set to RESOURCETYPE_DISK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network provider is busy (possibly initializing). The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to display the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetconnectiondialog1a
     * @since windows5.0
     */
    static WNetConnectionDialog1A(lpConnDlgStruct) {
        result := DllCall("MPR.dll\WNetConnectionDialog1A", "ptr", lpConnDlgStruct, "uint")
        return result
    }

    /**
     * The WNetConnectionDialog1 function brings up a general browsing dialog for connecting to network resources. The function requires a CONNECTDLGSTRUCT to establish the dialog box parameters.
     * @param {Pointer<CONNECTDLGSTRUCTW>} lpConnDlgStruct Pointer to a 
     * <b>CONNECTDLGSTRUCT</b> structure. The structure establishes the browsing dialog parameters.
     * @returns {Integer} If the user cancels the dialog box, the function returns –1. If the function is successful, it returns NO_ERROR. Also, if the call is successful, the <b>dwDevNum</b> member of the 
     * <b>CONNECTDLGSTRUCT</b> structure contains the number of the connected device.
     * 
     * Typically this dialog returns an error only if the user cannot enter a dialog session. This is because errors that occur after a dialog session are reported to the user directly. If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
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
     * Both the CONNDLG_RO_PATH and the CONNDLG_USE_MRU dialog box options are set. (Dialog box options are specified by the <b>dwFlags</b> member of the 
     * <a href="/windows/desktop/api/winnetwk/ns-winnetwk-connectdlgstructa">CONNECTDLGSTRUCT</a> structure.) 
     * 
     * 
     * 
     * 
     * -or-
     * 
     * Both the CONNDLG_PERSIST and the CONNDLG_NOT_PERSIST dialog box options are set.
     * 
     * -or-
     * 
     * The CONNDLG_RO_PATH dialog box option is set and the <b>lpRemoteName</b> member of the 
     * <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure does not point to a remote network. (The 
     * <b>CONNECTDLGSTRUCT</b> structure points to a 
     * <b>NETRESOURCE</b> structure.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>dwType</b> member of the 
     * <b>NETRESOURCE</b> structure is not set to RESOURCETYPE_DISK.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network provider is busy (possibly initializing). The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to display the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetconnectiondialog1w
     * @since windows5.0
     */
    static WNetConnectionDialog1W(lpConnDlgStruct) {
        result := DllCall("MPR.dll\WNetConnectionDialog1W", "ptr", lpConnDlgStruct, "uint")
        return result
    }

    /**
     * The WNetDisconnectDialog1 function attempts to disconnect a network resource.
     * @param {Pointer<DISCDLGSTRUCTA>} lpConnDlgStruct Pointer to a 
     * <b>DISCDLGSTRUCT</b> structure. The structure specifies the behavior for the disconnect attempt.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. If the user cancels the dialog box, the return value is –1.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the system prompted the user for a decision about disconnecting, the user elected not to disconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to disconnect because the user is actively using the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network provider is busy (possibly initializing). The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to start the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetdisconnectdialog1a
     * @since windows5.0
     */
    static WNetDisconnectDialog1A(lpConnDlgStruct) {
        result := DllCall("MPR.dll\WNetDisconnectDialog1A", "ptr", lpConnDlgStruct, "uint")
        return result
    }

    /**
     * The WNetDisconnectDialog1 function attempts to disconnect a network resource.
     * @param {Pointer<DISCDLGSTRUCTW>} lpConnDlgStruct Pointer to a 
     * <b>DISCDLGSTRUCT</b> structure. The structure specifies the behavior for the disconnect attempt.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR. If the user cancels the dialog box, the return value is –1.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When the system prompted the user for a decision about disconnecting, the user elected not to disconnect.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to disconnect because the user is actively using the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network provider is busy (possibly initializing). The caller should retry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
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
     * There is insufficient memory to start the dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetdisconnectdialog1w
     * @since windows5.0
     */
    static WNetDisconnectDialog1W(lpConnDlgStruct) {
        result := DllCall("MPR.dll\WNetDisconnectDialog1W", "ptr", lpConnDlgStruct, "uint")
        return result
    }

    /**
     * The WNetOpenEnum function starts an enumeration of network resources or existing connections. You can continue the enumeration by calling the WNetEnumResource function.
     * @param {Integer} dwScope 
     * @param {Integer} dwType 
     * @param {Integer} dwUsage 
     * @param {Pointer<NETRESOURCEA>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the container to enumerate. If the <i>dwScope</i> parameter is not RESOURCE_GLOBALNET, this parameter must be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the root of the network is assumed. (The system organizes a network as a hierarchy; the root is the topmost container in the network.)
     * 
     * If this parameter is not <b>NULL</b>, it must point to a 
     * <b>NETRESOURCE</b> structure. This structure can be filled in by the application or it can be returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. The 
     * <b>NETRESOURCE</b> structure must specify a container resource; that is, the RESOURCEUSAGE_CONTAINER value must be specified in the <i>dwUsage</i> parameter.
     * 
     * To enumerate all network resources, an application can begin the enumeration by calling 
     * <b>WNetOpenEnum</b> with the <i>lpNetResource</i> parameter set to <b>NULL</b>, and then use the returned handle to call 
     * <b>WNetEnumResource</b> to enumerate resources. If one of the resources in the 
     * <b>NETRESOURCE</b> array returned by the 
     * <b>WNetEnumResource</b> function is a container resource, you can call 
     * <b>WNetOpenEnum</b> to open the resource for further enumeration.
     * @param {Pointer<HANDLE>} lphEnum Pointer to an enumeration handle that can be used in a subsequent call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpNetResource</i> parameter does not point to a container.
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
     * Either the <i>dwScope</i> or the <i>dwType</i> parameter is invalid, or there is an invalid combination of parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote network resource name supplied in the <b>NETRESOURCE</b> structure resolved to an invalid network address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetopenenuma
     * @since windows5.0
     */
    static WNetOpenEnumA(dwScope, dwType, dwUsage, lpNetResource, lphEnum) {
        result := DllCall("MPR.dll\WNetOpenEnumA", "uint", dwScope, "uint", dwType, "uint", dwUsage, "ptr", lpNetResource, "ptr", lphEnum, "uint")
        return result
    }

    /**
     * The WNetOpenEnum function starts an enumeration of network resources or existing connections. You can continue the enumeration by calling the WNetEnumResource function.
     * @param {Integer} dwScope 
     * @param {Integer} dwType 
     * @param {Integer} dwUsage 
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the container to enumerate. If the <i>dwScope</i> parameter is not RESOURCE_GLOBALNET, this parameter must be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If this parameter is <b>NULL</b>, the root of the network is assumed. (The system organizes a network as a hierarchy; the root is the topmost container in the network.)
     * 
     * If this parameter is not <b>NULL</b>, it must point to a 
     * <b>NETRESOURCE</b> structure. This structure can be filled in by the application or it can be returned by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. The 
     * <b>NETRESOURCE</b> structure must specify a container resource; that is, the RESOURCEUSAGE_CONTAINER value must be specified in the <i>dwUsage</i> parameter.
     * 
     * To enumerate all network resources, an application can begin the enumeration by calling 
     * <b>WNetOpenEnum</b> with the <i>lpNetResource</i> parameter set to <b>NULL</b>, and then use the returned handle to call 
     * <b>WNetEnumResource</b> to enumerate resources. If one of the resources in the 
     * <b>NETRESOURCE</b> array returned by the 
     * <b>WNetEnumResource</b> function is a container resource, you can call 
     * <b>WNetOpenEnum</b> to open the resource for further enumeration.
     * @param {Pointer<HANDLE>} lphEnum Pointer to an enumeration handle that can be used in a subsequent call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a>.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpNetResource</i> parameter does not point to a container.
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
     * Either the <i>dwScope</i> or the <i>dwType</i> parameter is invalid, or there is an invalid combination of parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A remote network resource name supplied in the <b>NETRESOURCE</b> structure resolved to an invalid network address.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetopenenumw
     * @since windows5.0
     */
    static WNetOpenEnumW(dwScope, dwType, dwUsage, lpNetResource, lphEnum) {
        result := DllCall("MPR.dll\WNetOpenEnumW", "uint", dwScope, "uint", dwType, "uint", dwUsage, "ptr", lpNetResource, "ptr", lphEnum, "uint")
        return result
    }

    /**
     * The WNetEnumResource function continues an enumeration of network resources that was started by a call to the WNetOpenEnum function.
     * @param {HANDLE} hEnum Handle that identifies an enumeration instance. This handle must be returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetopenenuma">WNetOpenEnum</a> function.
     * @param {Pointer<UInt32>} lpcCount Pointer to a variable specifying the number of entries requested. If the number requested is –1, the function returns as many entries as possible. 
     * 
     * 
     * 
     * 
     * If the function succeeds, on return the variable pointed to by this parameter contains the number of entries actually read.
     * @param {Pointer} lpBuffer Pointer to the buffer that receives the enumeration results. The results are returned as an array of 
     * <a href="https://docs.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structures. Note that the buffer you allocate must be large enough to hold the structures, plus the strings to which their members point. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * The buffer is valid until the next call using the handle specified by the <i>hEnum</i> parameter. The order of 
     * <b>NETRESOURCE</b> structures in the array is not predictable.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a variable that specifies the size of the <i>lpBuffer</i> parameter, in bytes. If the buffer is too small to receive even one entry, this parameter receives the required size of the buffer.
     * @returns {Integer} If the function succeeds, the return value is one of the following values.
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
     * The enumeration succeeded, and the buffer contains the requested data. The calling application can continue to call 
     * <b>WNetEnumResource</b> to complete the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more entries. The buffer contents are undefined.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available with subsequent calls. For more information, see the following Remarks section.
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
     * The handle specified by the <i>hEnum</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable. (This condition is tested before <i>hEnum</i> is tested for validity.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetenumresourcea
     * @since windows5.0
     */
    static WNetEnumResourceA(hEnum, lpcCount, lpBuffer, lpBufferSize) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("MPR.dll\WNetEnumResourceA", "ptr", hEnum, "uint*", lpcCount, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetEnumResource function continues an enumeration of network resources that was started by a call to the WNetOpenEnum function.
     * @param {HANDLE} hEnum Handle that identifies an enumeration instance. This handle must be returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetopenenuma">WNetOpenEnum</a> function.
     * @param {Pointer<UInt32>} lpcCount Pointer to a variable specifying the number of entries requested. If the number requested is –1, the function returns as many entries as possible. 
     * 
     * 
     * 
     * 
     * If the function succeeds, on return the variable pointed to by this parameter contains the number of entries actually read.
     * @param {Pointer} lpBuffer Pointer to the buffer that receives the enumeration results. The results are returned as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structures. Note that the buffer you allocate must be large enough to hold the structures, plus the strings to which their members point. For more information, see the following Remarks section. 
     * 
     * 
     * 
     * 
     * The buffer is valid until the next call using the handle specified by the <i>hEnum</i> parameter. The order of 
     * <b>NETRESOURCE</b> structures in the array is not predictable.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a variable that specifies the size of the <i>lpBuffer</i> parameter, in bytes. If the buffer is too small to receive even one entry, this parameter receives the required size of the buffer.
     * @returns {Integer} If the function succeeds, the return value is one of the following values.
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
     * The enumeration succeeded, and the buffer contains the requested data. The calling application can continue to call 
     * <b>WNetEnumResource</b> to complete the enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are no more entries. The buffer contents are undefined.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available with subsequent calls. For more information, see the following Remarks section.
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
     * The handle specified by the <i>hEnum</i> parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable. (This condition is tested before <i>hEnum</i> is tested for validity.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetenumresourcew
     * @since windows5.0
     */
    static WNetEnumResourceW(hEnum, lpcCount, lpBuffer, lpBufferSize) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("MPR.dll\WNetEnumResourceW", "ptr", hEnum, "uint*", lpcCount, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetCloseEnum function ends a network resource enumeration started by a call to the WNetOpenEnum function.
     * @param {HANDLE} hEnum Handle that identifies an enumeration instance. This handle must be returned by the 
     * <b>WNetOpenEnum</b> function.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable. (This condition is tested before the handle specified in the <i>hEnum</i> parameter is tested for validity.)
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
     * The <i>hEnum</i> parameter does not specifiy a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetcloseenum
     * @since windows5.0
     */
    static WNetCloseEnum(hEnum) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("MPR.dll\WNetCloseEnum", "ptr", hEnum, "uint")
        return result
    }

    /**
     * The WNetGetResourceParent function returns the parent of a network resource in the network browse hierarchy. Browsing begins at the location of the specified network resource.
     * @param {Pointer<NETRESOURCEA>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource for which the parent name is required. 
     * 
     * 
     * 
     * 
     * Specify the members of the input 
     * <b>NETRESOURCE</b> structure as follows. The caller typically knows the values to provide for the <b>lpProvider</b> and <b>dwType</b> members after previous calls to 
     * <b>WNetGetResourceInformation</b> or 
     * <b>WNetGetResourceParent</b>.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should be filled in if known; otherwise, it should be set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should specify the remote name of the network resource whose parent is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should specify the network provider that owns the resource. This member is required; otherwise, the function could produce incorrect results.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All other members of the 
     * <b>NETRESOURCE</b> structure are ignored.
     * @param {Pointer} lpBuffer Pointer to a buffer to receive a single 
     * <b>NETRESOURCE</b> structure that represents the parent resource. The function returns the <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> members of the structure; all other members are set to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> member points to the remote name for the parent resource. This name uses the same syntax as the one returned from an enumeration by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. The caller can perform a string comparison to determine whether the 
     * <b>WNetGetResourceParent</b> resource is the same as that returned by 
     * <b>WNetEnumResource</b>. If the input resource has no parent on any of the networks, the <b>lpRemoteName</b> member is returned as <b>NULL</b>.
     * 
     * The presence of the RESOURCEUSAGE_CONNECTABLE bit in the <b>dwUsage</b> member indicates that you can connect to the parent resource, but only when it is available on the network.
     * @param {Pointer<UInt32>} lpcbBuffer Pointer to a location that, on entry, specifies the size of the <i>lpBuffer</i> buffer, in bytes. If the buffer is too small to hold the result, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpRemoteName</b> member is not an existing network resource for any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpProvider</b> member does not match any installed network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_AUTHENTICATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the necessary permissions to obtain the name of the parent.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetresourceparenta
     * @since windows5.0
     */
    static WNetGetResourceParentA(lpNetResource, lpBuffer, lpcbBuffer) {
        result := DllCall("MPR.dll\WNetGetResourceParentA", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpcbBuffer, "uint")
        return result
    }

    /**
     * The WNetGetResourceParent function returns the parent of a network resource in the network browse hierarchy. Browsing begins at the location of the specified network resource.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource for which the parent name is required. 
     * 
     * 
     * 
     * 
     * Specify the members of the input 
     * <b>NETRESOURCE</b> structure as follows. The caller typically knows the values to provide for the <b>lpProvider</b> and <b>dwType</b> members after previous calls to 
     * <b>WNetGetResourceInformation</b> or 
     * <b>WNetGetResourceParent</b>.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b><b>dwType</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should be filled in if known; otherwise, it should be set to <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should specify the remote name of the network resource whose parent is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This member should specify the network provider that owns the resource. This member is required; otherwise, the function could produce incorrect results.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All other members of the 
     * <b>NETRESOURCE</b> structure are ignored.
     * @param {Pointer} lpBuffer Pointer to a buffer to receive a single 
     * <b>NETRESOURCE</b> structure that represents the parent resource. The function returns the <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> members of the structure; all other members are set to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> member points to the remote name for the parent resource. This name uses the same syntax as the one returned from an enumeration by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. The caller can perform a string comparison to determine whether the 
     * <b>WNetGetResourceParent</b> resource is the same as that returned by 
     * <b>WNetEnumResource</b>. If the input resource has no parent on any of the networks, the <b>lpRemoteName</b> member is returned as <b>NULL</b>.
     * 
     * The presence of the RESOURCEUSAGE_CONNECTABLE bit in the <b>dwUsage</b> member indicates that you can connect to the parent resource, but only when it is available on the network.
     * @param {Pointer<UInt32>} lpcbBuffer Pointer to a location that, on entry, specifies the size of the <i>lpBuffer</i> buffer, in bytes. If the buffer is too small to hold the result, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have access to the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpRemoteName</b> member is not an existing network resource for any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpProvider</b> member does not match any installed network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_AUTHENTICATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have the necessary permissions to obtain the name of the parent.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetresourceparentw
     * @since windows5.0
     */
    static WNetGetResourceParentW(lpNetResource, lpBuffer, lpcbBuffer) {
        result := DllCall("MPR.dll\WNetGetResourceParentW", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpcbBuffer, "uint")
        return result
    }

    /**
     * When provided with a remote path to a network resource, the WNetGetResourceInformation function identifies the network provider that owns the resource and obtains information about the type of the resource.
     * @param {Pointer<NETRESOURCEA>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource for which information is required. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> member of the structure should specify the remote path name of the resource, typically one typed in by a user. The <b>lpProvider</b> and <b>dwType</b> members should also be filled in if known, because this operation can be memory intensive, especially if you do not specify the <b>dwType</b> member. If you do not know the values for these members, you should set them to <b>NULL</b>. All other members of the 
     * <b>NETRESOURCE</b> structure are ignored.
     * @param {Pointer} lpBuffer Pointer to the buffer to receive the result. On successful return, the first portion of the buffer is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure representing that portion of the input resource path that is accessed through the WNet functions, rather than through system functions specific to the input resource type. (The remainder of the buffer contains the variable-length strings to which the members of the 
     * <b>NETRESOURCE</b> structure point.) 
     * 
     * 
     * 
     * 
     * For example, if the input remote resource path is \\server\share\dir1\dir2, then the output 
     * <b>NETRESOURCE</b> structure contains information about the resource \\server\share. The \dir1\dir2 portion of the path is accessed through the 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-management-functions">file management functions</a>. The <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> members of 
     * <b>NETRESOURCE</b> are returned, with all other members set to <b>NULL</b>.
     * 
     * The <b>lpRemoteName</b> member is returned in the same syntax as the one returned from an enumeration by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. This allows the caller to perform a string comparison to determine whether the resource passed to 
     * <b>WNetGetResourceInformation</b> is the same as the resource returned by a separate call to 
     * <b>WNetEnumResource</b>.
     * @param {Pointer<UInt32>} lpcbBuffer Pointer to a location that, on entry, specifies the size of the <i>lpBuffer</i> buffer, in bytes. The buffer you allocate must be large enough to hold the 
     * <b>NETRESOURCE</b> structure, plus the strings to which its members point. If the buffer is too small for the result, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @param {Pointer<PSTR>} lplpSystem If the function returns successfully, this parameter points to a string in the output buffer that specifies the part of the resource that is accessed through system functions. (This applies only to functions specific to the resource type rather than the WNet functions.) 
     * 
     * 
     * 
     * 
     * For example, if the input remote resource name is \\server\share\dir1\dir2, the <b>lpRemoteName</b> member of the output 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure points to \\server\share. Also, the <i>lplpSystem</i> parameter points to \dir1\dir2. Both strings are stored in the buffer pointed to by the <i>lpBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpRemoteName</b> member is not an existing network resource for any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>dwType</b> member does not match the type of resource specified by the <b>lpRemoteName</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetresourceinformationa
     * @since windows5.0
     */
    static WNetGetResourceInformationA(lpNetResource, lpBuffer, lpcbBuffer, lplpSystem) {
        result := DllCall("MPR.dll\WNetGetResourceInformationA", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpcbBuffer, "ptr", lplpSystem, "uint")
        return result
    }

    /**
     * When provided with a remote path to a network resource, the WNetGetResourceInformation function identifies the network provider that owns the resource and obtains information about the type of the resource.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource for which information is required. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> member of the structure should specify the remote path name of the resource, typically one typed in by a user. The <b>lpProvider</b> and <b>dwType</b> members should also be filled in if known, because this operation can be memory intensive, especially if you do not specify the <b>dwType</b> member. If you do not know the values for these members, you should set them to <b>NULL</b>. All other members of the 
     * <b>NETRESOURCE</b> structure are ignored.
     * @param {Pointer} lpBuffer Pointer to the buffer to receive the result. On successful return, the first portion of the buffer is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure representing that portion of the input resource path that is accessed through the WNet functions, rather than through system functions specific to the input resource type. (The remainder of the buffer contains the variable-length strings to which the members of the 
     * <b>NETRESOURCE</b> structure point.) 
     * 
     * 
     * 
     * 
     * For example, if the input remote resource path is \\server\share\dir1\dir2, then the output 
     * <b>NETRESOURCE</b> structure contains information about the resource \\server\share. The \dir1\dir2 portion of the path is accessed through the 
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-management-functions">file management functions</a>. The <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> members of 
     * <b>NETRESOURCE</b> are returned, with all other members set to <b>NULL</b>.
     * 
     * The <b>lpRemoteName</b> member is returned in the same syntax as the one returned from an enumeration by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetenumresourcea">WNetEnumResource</a> function. This allows the caller to perform a string comparison to determine whether the resource passed to 
     * <b>WNetGetResourceInformation</b> is the same as the resource returned by a separate call to 
     * <b>WNetEnumResource</b>.
     * @param {Pointer<UInt32>} lpcbBuffer Pointer to a location that, on entry, specifies the size of the <i>lpBuffer</i> buffer, in bytes. The buffer you allocate must be large enough to hold the 
     * <b>NETRESOURCE</b> structure, plus the strings to which its members point. If the buffer is too small for the result, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @param {Pointer<PWSTR>} lplpSystem If the function returns successfully, this parameter points to a string in the output buffer that specifies the part of the resource that is accessed through system functions. (This applies only to functions specific to the resource type rather than the WNet functions.) 
     * 
     * 
     * 
     * 
     * For example, if the input remote resource name is \\server\share\dir1\dir2, the <b>lpRemoteName</b> member of the output 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure points to \\server\share. Also, the <i>lplpSystem</i> parameter points to \dir1\dir2. Both strings are stored in the buffer pointed to by the <i>lpBuffer</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>lpRemoteName</b> member is not an existing network resource for any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input <b>dwType</b> member does not match the type of resource specified by the <b>lpRemoteName</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetresourceinformationw
     * @since windows5.0
     */
    static WNetGetResourceInformationW(lpNetResource, lpBuffer, lpcbBuffer, lplpSystem) {
        result := DllCall("MPR.dll\WNetGetResourceInformationW", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpcbBuffer, "ptr", lplpSystem, "uint")
        return result
    }

    /**
     * The WNetGetUniversalName function takes a drive-based path for a network resource and returns an information structure that contains a more universal form of the name.
     * @param {PSTR} lpLocalPath A pointer to a constant null-terminated string that is a drive-based path for a network resource. 
     * 
     * 
     * 
     * 
     * For example, if drive H has been mapped to a network drive share, and the network       resource of interest is a file named Sample.doc in the directory \Win32\Examples on that share, the drive-based path is H:\Win32\Examples\Sample.doc.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to a buffer that receives the structure specified by the <i>dwInfoLevel</i> parameter.
     * @param {Pointer<UInt32>} lpBufferSize A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the <i>lpBuffer</i> parameter.
     * 
     * If the function succeeds, it sets the variable pointed to by <i>lpBufferSize</i> to the number of bytes stored in the buffer. If the function fails because the buffer is too small, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string pointed to by the <i>lpLocalPath</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_UNAVAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no current connection to the remote device, but there is a remembered (persistent) connection to it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Use the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small. The function sets the variable pointed to by the <i>lpBufferSize</i> parameter to the required buffer size. More entries are available with subsequent calls.
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
     * The <i>dwInfoLevel</i> parameter is set to UNIVERSAL_NAME_INFO_LEVEL, but the network provider does not support UNC names. (None of the network providers support this function.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the network providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by the <i>lpLocalPath</i> parameter is not redirected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetuniversalnamea
     * @since windows5.0
     */
    static WNetGetUniversalNameA(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize) {
        lpLocalPath := lpLocalPath is String ? StrPtr(lpLocalPath) : lpLocalPath

        result := DllCall("MPR.dll\WNetGetUniversalNameA", "ptr", lpLocalPath, "uint", dwInfoLevel, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetGetUniversalName function takes a drive-based path for a network resource and returns an information structure that contains a more universal form of the name.
     * @param {PWSTR} lpLocalPath A pointer to a constant null-terminated string that is a drive-based path for a network resource. 
     * 
     * 
     * 
     * 
     * For example, if drive H has been mapped to a network drive share, and the network       resource of interest is a file named Sample.doc in the directory \Win32\Examples on that share, the drive-based path is H:\Win32\Examples\Sample.doc.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to a buffer that receives the structure specified by the <i>dwInfoLevel</i> parameter.
     * @param {Pointer<UInt32>} lpBufferSize A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the <i>lpBuffer</i> parameter.
     * 
     * If the function succeeds, it sets the variable pointed to by <i>lpBufferSize</i> to the number of bytes stored in the buffer. If the function fails because the buffer is too small, this location receives the required buffer size, and the function returns ERROR_MORE_DATA.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string pointed to by the <i>lpLocalPath</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CONNECTION_UNAVAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no current connection to the remote device, but there is a remembered (persistent) connection to it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. Use the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function to obtain a description of the error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by the <i>lpBuffer</i> parameter is too small. The function sets the variable pointed to by the <i>lpBufferSize</i> parameter to the required buffer size. More entries are available with subsequent calls.
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
     * The <i>dwInfoLevel</i> parameter is set to UNIVERSAL_NAME_INFO_LEVEL, but the network provider does not support UNC names. (None of the network providers support this function.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the network providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by the <i>lpLocalPath</i> parameter is not redirected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetuniversalnamew
     * @since windows5.0
     */
    static WNetGetUniversalNameW(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize) {
        lpLocalPath := lpLocalPath is String ? StrPtr(lpLocalPath) : lpLocalPath

        result := DllCall("MPR.dll\WNetGetUniversalNameW", "ptr", lpLocalPath, "uint", dwInfoLevel, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetGetUser function retrieves the current default user name, or the user name used to establish a network connection.
     * @param {PSTR} lpName A pointer to a constant <b>null</b>-terminated string that specifies either the name of a local device that has been redirected to a network resource, or the remote name of a network resource to which a connection has been made without redirecting a local device.
     * 
     * If this parameter is <b>NULL</b> or the empty string, the system returns the name of the current user for the process.
     * @param {PSTR} lpUserName A pointer to a buffer that receives the <b>null</b>-terminated user name.
     * @param {Pointer<UInt32>} lpnLength A pointer to a variable that specifies the size of the <i>lpUserName</i> buffer, in characters. If the call fails because the buffer is not large enough, this variable contains the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by the <i>lpName</i> parameter is not a redirected device or a connected network name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available with subsequent calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetusera
     * @since windows5.0
     */
    static WNetGetUserA(lpName, lpUserName, lpnLength) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("MPR.dll\WNetGetUserA", "ptr", lpName, "ptr", lpUserName, "uint*", lpnLength, "uint")
        return result
    }

    /**
     * The WNetGetUser function retrieves the current default user name, or the user name used to establish a network connection.
     * @param {PWSTR} lpName A pointer to a constant <b>null</b>-terminated string that specifies either the name of a local device that has been redirected to a network resource, or the remote name of a network resource to which a connection has been made without redirecting a local device.
     * 
     * If this parameter is <b>NULL</b> or the empty string, the system returns the name of the current user for the process.
     * @param {PWSTR} lpUserName A pointer to a buffer that receives the <b>null</b>-terminated user name.
     * @param {Pointer<UInt32>} lpnLength A pointer to a variable that specifies the size of the <i>lpUserName</i> buffer, in characters. If the call fails because the buffer is not large enough, this variable contains the required buffer size.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by the <i>lpName</i> parameter is not a redirected device or a connected network name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * More entries are available with subsequent calls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call the 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a> function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None of the providers recognize the local name as having a connection. However, the network is not available for at least one provider to whom the connection may belong.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetuserw
     * @since windows5.0
     */
    static WNetGetUserW(lpName, lpUserName, lpnLength) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("MPR.dll\WNetGetUserW", "ptr", lpName, "ptr", lpUserName, "uint*", lpnLength, "uint")
        return result
    }

    /**
     * The WNetGetProviderName function obtains the provider name for a specific type of network.
     * @param {Integer} dwNetType Network type that is unique to the network. If two networks claim the same type, the function returns the name of the provider loaded first. Only the high word of the network type is used. If a network reports a subtype in the low word, it is ignored. 
     * 
     * 
     * 
     * 
     * You can find a complete list of network types in the header file Winnetwk.h.
     * @param {PSTR} lpProviderName Pointer to a buffer that receives the network provider name.
     * @param {Pointer<UInt32>} lpBufferSize Size of the buffer passed to the function, in characters. If the return value is ERROR_MORE_DATA, <i>lpBufferSize</i> returns the buffer size required (in characters) to hold the provider name. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>The size of the buffer is in bytes, not characters. Also, the buffer must be at least 1 byte long.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to hold the network provider name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpProviderName</i> parameter or the <i>lpBufferSize</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetprovidernamea
     * @since windows5.0
     */
    static WNetGetProviderNameA(dwNetType, lpProviderName, lpBufferSize) {
        lpProviderName := lpProviderName is String ? StrPtr(lpProviderName) : lpProviderName

        result := DllCall("MPR.dll\WNetGetProviderNameA", "uint", dwNetType, "ptr", lpProviderName, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetGetProviderName function obtains the provider name for a specific type of network.
     * @param {Integer} dwNetType Network type that is unique to the network. If two networks claim the same type, the function returns the name of the provider loaded first. Only the high word of the network type is used. If a network reports a subtype in the low word, it is ignored. 
     * 
     * 
     * 
     * 
     * You can find a complete list of network types in the header file Winnetwk.h.
     * @param {PWSTR} lpProviderName Pointer to a buffer that receives the network provider name.
     * @param {Pointer<UInt32>} lpBufferSize Size of the buffer passed to the function, in characters. If the return value is ERROR_MORE_DATA, <i>lpBufferSize</i> returns the buffer size required (in characters) to hold the provider name. 
     * 
     * 
     * 
     * 
     * <b>Windows Me/98/95:  </b>The size of the buffer is in bytes, not characters. Also, the buffer must be at least 1 byte long.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to hold the network provider name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpProviderName</i> parameter or the <i>lpBufferSize</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetprovidernamew
     * @since windows5.0
     */
    static WNetGetProviderNameW(dwNetType, lpProviderName, lpBufferSize) {
        lpProviderName := lpProviderName is String ? StrPtr(lpProviderName) : lpProviderName

        result := DllCall("MPR.dll\WNetGetProviderNameW", "uint", dwNetType, "ptr", lpProviderName, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * The WNetGetNetworkInformation function returns extended information about a specific network provider whose name was returned by a previous network enumeration.
     * @param {PSTR} lpProvider Pointer to a constant null-terminated string that contains the name of the network provider for which information is required.
     * @param {Pointer<NETINFOSTRUCT>} lpNetInfoStruct Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netinfostruct">NETINFOSTRUCT</a> structure. The structure describes characteristics of the network.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpProvider</i> parameter does not match any running network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cbStructure</b> member of the 
     * <b>NETINFOSTRUCT</b> structure does not contain a valid structure size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetnetworkinformationa
     * @since windows5.0
     */
    static WNetGetNetworkInformationA(lpProvider, lpNetInfoStruct) {
        lpProvider := lpProvider is String ? StrPtr(lpProvider) : lpProvider

        result := DllCall("MPR.dll\WNetGetNetworkInformationA", "ptr", lpProvider, "ptr", lpNetInfoStruct, "uint")
        return result
    }

    /**
     * The WNetGetNetworkInformation function returns extended information about a specific network provider whose name was returned by a previous network enumeration.
     * @param {PWSTR} lpProvider Pointer to a constant null-terminated string that contains the name of the network provider for which information is required.
     * @param {Pointer<NETINFOSTRUCT>} lpNetInfoStruct Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netinfostruct">NETINFOSTRUCT</a> structure. The structure describes characteristics of the network.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_PROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>lpProvider</i> parameter does not match any running network provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cbStructure</b> member of the 
     * <b>NETINFOSTRUCT</b> structure does not contain a valid structure size.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetnetworkinformationw
     * @since windows5.0
     */
    static WNetGetNetworkInformationW(lpProvider, lpNetInfoStruct) {
        lpProvider := lpProvider is String ? StrPtr(lpProvider) : lpProvider

        result := DllCall("MPR.dll\WNetGetNetworkInformationW", "ptr", lpProvider, "ptr", lpNetInfoStruct, "uint")
        return result
    }

    /**
     * The WNetGetLastError function retrieves the most recent extended error code set by a WNet function. The network provider reported this error code; it will not generally be one of the errors included in the SDK header file WinError.h.
     * @param {Pointer<UInt32>} lpError Pointer to a variable that receives the error code reported by the network provider. The error code is specific to the network provider.
     * @param {PSTR} lpErrorBuf Pointer to the buffer that receives the null-terminated string describing the error.
     * @param {Integer} nErrorBufSize Size of the buffer pointed to by the <i>lpErrorBuf</i> parameter, in characters. If the buffer is too small for the error string, the string is truncated but still null-terminated. A buffer of at least 256 characters is recommended.
     * @param {PSTR} lpNameBuf Pointer to the buffer that receives the null-terminated string identifying the network provider that raised the error.
     * @param {Integer} nNameBufSize Size of the buffer pointed to by the <i>lpNameBuf</i> parameter, in characters. If the buffer is too small for the error string, the string is truncated but still null-terminated.
     * @returns {Integer} If the function succeeds, and it obtains the last error that the network provider reported, the return value is NO_ERROR.
     * 
     * If the caller supplies an invalid buffer, the return value is ERROR_INVALID_ADDRESS.
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetlasterrora
     * @since windows5.0
     */
    static WNetGetLastErrorA(lpError, lpErrorBuf, nErrorBufSize, lpNameBuf, nNameBufSize) {
        lpErrorBuf := lpErrorBuf is String ? StrPtr(lpErrorBuf) : lpErrorBuf
        lpNameBuf := lpNameBuf is String ? StrPtr(lpNameBuf) : lpNameBuf

        A_LastError := 0

        result := DllCall("MPR.dll\WNetGetLastErrorA", "uint*", lpError, "ptr", lpErrorBuf, "uint", nErrorBufSize, "ptr", lpNameBuf, "uint", nNameBufSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The WNetGetLastError function retrieves the most recent extended error code set by a WNet function. The network provider reported this error code; it will not generally be one of the errors included in the SDK header file WinError.h.
     * @param {Pointer<UInt32>} lpError Pointer to a variable that receives the error code reported by the network provider. The error code is specific to the network provider.
     * @param {PWSTR} lpErrorBuf Pointer to the buffer that receives the null-terminated string describing the error.
     * @param {Integer} nErrorBufSize Size of the buffer pointed to by the <i>lpErrorBuf</i> parameter, in characters. If the buffer is too small for the error string, the string is truncated but still null-terminated. A buffer of at least 256 characters is recommended.
     * @param {PWSTR} lpNameBuf Pointer to the buffer that receives the null-terminated string identifying the network provider that raised the error.
     * @param {Integer} nNameBufSize Size of the buffer pointed to by the <i>lpNameBuf</i> parameter, in characters. If the buffer is too small for the error string, the string is truncated but still null-terminated.
     * @returns {Integer} If the function succeeds, and it obtains the last error that the network provider reported, the return value is NO_ERROR.
     * 
     * If the caller supplies an invalid buffer, the return value is ERROR_INVALID_ADDRESS.
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-wnetgetlasterrorw
     * @since windows5.0
     */
    static WNetGetLastErrorW(lpError, lpErrorBuf, nErrorBufSize, lpNameBuf, nNameBufSize) {
        lpErrorBuf := lpErrorBuf is String ? StrPtr(lpErrorBuf) : lpErrorBuf
        lpNameBuf := lpNameBuf is String ? StrPtr(lpNameBuf) : lpNameBuf

        A_LastError := 0

        result := DllCall("MPR.dll\WNetGetLastErrorW", "uint*", lpError, "ptr", lpErrorBuf, "uint", nErrorBufSize, "ptr", lpNameBuf, "uint", nNameBufSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Returns information about the expected performance of a connection used to access a network resource.
     * @param {Pointer<NETRESOURCEA>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource. The following members have specific meanings in this context.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a buffer that specifies a local device, such as "F:" or "LPT1", that is redirected to a network resource to be queried. 
     * 
     * 
     * 
     * 
     * If this member is <b>NULL</b> or an empty string, the network resource is specified in the <i>lpRemoteName</i> member. If this flag specifies a local device, <i>lpRemoteName</i> is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a network resource to query. The resource must currently have an established connection. For example, if the resource is a file on a file server, then having the file open will ensure the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Usually set to <b>NULL</b>, but can be a pointer to the owner (provider) of the resource if the network on which the resource resides is known. 
     * 
     * 
     * 
     * 
     * If the <i>lpProvider</i> member is not <b>NULL</b>, the system attempts to return information only about the named network.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<NETCONNECTINFOSTRUCT>} lpNetConnectInfoStruct A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netconnectinfostruct">NETCONNECTINFOSTRUCT</a> structure that receives the data.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource does not supply this information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the  <i>lpNetResource</i> parameter does not specify a redirected device, or the <i>lpRemoteName</i> member does not specify the name of a resource that is currently connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed, either because a network component is not started, or because the specified resource name is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <i>lpLocalName</i> member is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This error is returned if the <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the  <i>lpNetResource</i> parameter was <b>NULL</b> and the <b>lpRemoteName</b> member of the <b>NETRESOURCE</b> structure pointed to by the  <i>lpNetResource</i> was also or <b>NULL</b> or could not recognized by any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to access an invalid address. This error is returned if the <i>lpNetResource</i> or <i>lpNetConnectInfoStruct</i> parameters were <b>NULL</b>. 
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
     * A bad parameter was passed. This error is returned if the <i>lpNetConnectInfoStruct</i> parameter does not point to a 
     * <a href="/windows/desktop/api/winnetwk/ns-winnetwk-netconnectinfostruct">NETCONNECTINFOSTRUCT</a> structure in which the <b>cbStructure</b> member is filled with the proper structure size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-multinetgetconnectionperformancea
     * @since windows5.0
     */
    static MultinetGetConnectionPerformanceA(lpNetResource, lpNetConnectInfoStruct) {
        result := DllCall("MPR.dll\MultinetGetConnectionPerformanceA", "ptr", lpNetResource, "ptr", lpNetConnectInfoStruct, "uint")
        return result
    }

    /**
     * Returns information about the expected performance of a connection used to access a network resource.
     * @param {Pointer<NETRESOURCEW>} lpNetResource A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure that specifies the network resource. The following members have specific meanings in this context.
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b><b>lpLocalName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a buffer that specifies a local device, such as "F:" or "LPT1", that is redirected to a network resource to be queried. 
     * 
     * 
     * 
     * 
     * If this member is <b>NULL</b> or an empty string, the network resource is specified in the <i>lpRemoteName</i> member. If this flag specifies a local device, <i>lpRemoteName</i> is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b><b>lpRemoteName</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer to a network resource to query. The resource must currently have an established connection. For example, if the resource is a file on a file server, then having the file open will ensure the connection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpProvider"></a><a id="lpprovider"></a><a id="LPPROVIDER"></a><dl>
     * <dt><b><b>lpProvider</b></b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Usually set to <b>NULL</b>, but can be a pointer to the owner (provider) of the resource if the network on which the resource resides is known. 
     * 
     * 
     * 
     * 
     * If the <i>lpProvider</i> member is not <b>NULL</b>, the system attempts to return information only about the named network.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<NETCONNECTINFOSTRUCT>} lpNetConnectInfoStruct A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netconnectinfostruct">NETCONNECTINFOSTRUCT</a> structure that receives the data.
     * @returns {Integer} If the function succeeds, the return value is NO_ERROR.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>, such as one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network resource does not supply this information.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the  <i>lpNetResource</i> parameter does not specify a redirected device, or the <i>lpRemoteName</i> member does not specify the name of a resource that is currently connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NET_OR_BAD_PATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation could not be completed, either because a network component is not started, or because the specified resource name is not recognized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_DEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local device specified by the <i>lpLocalName</i> member is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_NET_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network name cannot be found. This error is returned if the <b>lpLocalName</b> member of the <a href="/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure pointed to by the  <i>lpNetResource</i> parameter was <b>NULL</b> and the <b>lpRemoteName</b> member of the <b>NETRESOURCE</b> structure pointed to by the  <i>lpNetResource</i> was also or <b>NULL</b> or could not recognized by any network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_ADDRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt to access an invalid address. This error is returned if the <i>lpNetResource</i> or <i>lpNetConnectInfoStruct</i> parameters were <b>NULL</b>. 
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
     * A bad parameter was passed. This error is returned if the <i>lpNetConnectInfoStruct</i> parameter does not point to a 
     * <a href="/windows/desktop/api/winnetwk/ns-winnetwk-netconnectinfostruct">NETCONNECTINFOSTRUCT</a> structure in which the <b>cbStructure</b> member is filled with the proper structure size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is unavailable.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_EXTENDED_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A network-specific error occurred. To obtain a description of the error, call 
     * <a href="/windows/desktop/api/winnetwk/nf-winnetwk-wnetgetlasterrora">WNetGetLastError</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winnetwk/nf-winnetwk-multinetgetconnectionperformancew
     * @since windows5.0
     */
    static MultinetGetConnectionPerformanceW(lpNetResource, lpNetConnectInfoStruct) {
        result := DllCall("MPR.dll\MultinetGetConnectionPerformanceW", "ptr", lpNetResource, "ptr", lpNetConnectInfoStruct, "uint")
        return result
    }

    /**
     * Connects a local device to a network resource.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure which specifies the network resource to connect to. The following fields must be set in the <b>NETRESOURCE</b> structure you pass in. The <b>NPAddConnection</b> function ignores the other fields.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b>lpRemoteName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the network resource to connect to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b>lpLocalName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the name of a local device to be redirected, such as "F:" or "LPT1". This name is treated as case insensitive and may be an empty string or <b>NULL</b> pointer. If the string is empty or <b>NULL</b>, the function connects to the network resource without making a redirection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b>dwType</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the type of resource to connect to. This can be RESOURCETYPE_DISK, RESOURCETYPE _PRINT, or RESOURCETYPE_ANY. The value RESOURCETYPE _ANY is used if the caller does not care or does not know.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpPassword Pointer to the password to be used in making the connection, normally the password associated with <i>lpUserName</i>. The <b>NULL</b> value may be passed in to cause the function to use the default password. An empty string may be used to indicate no password. When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {PWSTR} lpUserName Pointer to the user name used to make the connection. If <b>NULL</b>, the default user name (that of the currently logged-on user) is applied. This is used when the user wants to connect to a resource but has a different assigned user name or account for that resource.
     * 
     * For example, if you were logged using the user name "MyAccount" and wanted to connect to a network resource that was available only to a second account, where the user name was "MyOtherAccount", you could specify "MyOtherAccount" in <i>lpUserName</i> in order to connect to the resource. You would also specify the password of this second account in <i>lpPassword</i>.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_NETNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <b>lpRemoteName</b> member of the structure passed into <i>lpNetResource</i> is not valid for this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_LOCALNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <b>lpLocalName</b> member of the structure passed into <i>lpNetResource</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified in the <b>lpLocalName</b> member of the structure passed into <i>lpNetResource</i> is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Permission to establish the connection is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npaddconnection
     * @since windows5.1.2600
     */
    static NPAddConnection(lpNetResource, lpPassword, lpUserName) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("davclnt.dll\NPAddConnection", "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint")
        return result
    }

    /**
     * Connects a local device to a network resource.
     * @param {HWND} hwndOwner A handle to a window that should own any messages or dialog boxes. This handle is valid only if CONNECT_INTERACTIVE is set in <i>dwFlags</i>, and the handle should only be used to produce dialog boxes needed for authentication.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure that specifies the network resource to connect to. The following fields must be set when making a connection. The others are ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpRemoteName"></a><a id="lpremotename"></a><a id="LPREMOTENAME"></a><dl>
     * <dt><b>lpRemoteName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the network resource to connect to.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="lpLocalName"></a><a id="lplocalname"></a><a id="LPLOCALNAME"></a><dl>
     * <dt><b>lpLocalName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the name of a local device to be redirected, such as "F:" or "LPT1". This name is treated as case insensitive and may be the empty string or <b>NULL</b> pointer. If the string is empty or <b>NULL</b>, the function connects to the network resource without making a redirection.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="dwType"></a><a id="dwtype"></a><a id="DWTYPE"></a><dl>
     * <dt><b>dwType</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies the type of resource to connect to. This can be RESOURCETYPE_DISK, RESOURCETYPE_PRINT, or RESOURCETYPE_ANY. The value RESOURCETYPE_ANY is used if the caller does not care or does not know.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} lpPassword Pointer to the password to be used in making the connection, normally the password associated with <i>lpUserName</i>. The <b>NULL</b> value may be passed in to cause the function to use the default password. An empty string may be used to indicate no password. When you have finished using the password, clear it from memory by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa366877(v=vs.85)">SecureZeroMemory</a> function. For more information about protecting the password, see <a href="https://docs.microsoft.com/windows/desktop/SecBP/handling-passwords">Handling Passwords</a>.
     * @param {PWSTR} lpUserName Pointer to the user name used to make the connection. If <b>NULL</b>, the default user name (that of the currently logged-on user) is applied. This is used when the user wants to connect to a resource but has a different assigned user name or account for that resource.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, it will return WN_SUCCESS. Otherwise, it will return an error code. This may include one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_NETNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <b>lpRemoteName</b> member of the structure passed into <i>lpNetResource</i> is not valid for this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_LOCALNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of the <b>lpLocalName</b> member of the structure passed into <i>lpNetResource</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified password is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified in the <b>lpLocalName</b> member of the structure passed into <i>lpNetResource</i> is already connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Permission to establish the connection is denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_CANCEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The attempt to make the connection was canceled by the user using a dialog box displayed by the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npaddconnection3
     * @since windows5.1.2600
     */
    static NPAddConnection3(hwndOwner, lpNetResource, lpPassword, lpUserName, dwFlags) {
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("davclnt.dll\NPAddConnection3", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpPassword, "ptr", lpUserName, "uint", dwFlags, "uint")
        return result
    }

    /**
     * 
     * @param {HWND} hwndOwner 
     * @param {Pointer<NETRESOURCEW>} lpNetResource 
     * @param {Pointer} lpAuthBuffer 
     * @param {Integer} cbAuthBuffer 
     * @param {Integer} dwFlags 
     * @param {Pointer} lpUseOptions 
     * @param {Integer} cbUseOptions 
     * @returns {Integer} 
     */
    static NPAddConnection4(hwndOwner, lpNetResource, lpAuthBuffer, cbAuthBuffer, dwFlags, lpUseOptions, cbUseOptions) {
        hwndOwner := hwndOwner is Win32Handle ? NumGet(hwndOwner, "ptr") : hwndOwner

        result := DllCall("NTLANMAN.dll\NPAddConnection4", "ptr", hwndOwner, "ptr", lpNetResource, "ptr", lpAuthBuffer, "uint", cbAuthBuffer, "uint", dwFlags, "ptr", lpUseOptions, "uint", cbUseOptions, "uint")
        return result
    }

    /**
     * Disconnects a network connection.
     * @param {PWSTR} lpName Pointer to the name of either the redirected local device or the remote network resource to disconnect from.
     * @param {BOOL} fForce Indicates whether the disconnect should continue in the event of open files or jobs on the connection. If <b>FALSE</b> is specified, the call will fail if there are open files or jobs.
     * @returns {Integer} If the function succeeds, it will return WN_SUCCESS. Otherwise, it will return an error. This can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpName</i> is not a redirected device or is not currently connected to <i>lpName</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_OPEN_FILES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are open files, and <i>fForce</i> was set to <b>FALSE</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npcancelconnection
     * @since windows5.1.2600
     */
    static NPCancelConnection(lpName, fForce) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("davclnt.dll\NPCancelConnection", "ptr", lpName, "int", fForce, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpName 
     * @param {BOOL} fForce 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    static NPCancelConnection2(lpName, fForce, dwFlags) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        result := DllCall("NTLANMAN.dll\NPCancelConnection2", "ptr", lpName, "int", fForce, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Retrieves information about a connection.
     * @param {PWSTR} lpLocalName Pointer to the name of the local device the caller is interested in. The network provider can assume this name is syntactically valid.
     * @param {PWSTR} lpRemoteName Pointer to a buffer that will receive the remote name used to make the connection. This buffer is allocated by the caller.
     * @param {Pointer<UInt32>} lpnBufferLen Pointer to the size, in characters, of the <i>lpRemoteName</i> buffer. If the call fails because the buffer is not big enough, <i>lpBufferSize</i> is set to the required buffer size.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by <i>lpLocalName</i> is not redirected by this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was too small to receive all of the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetconnection
     * @since windows5.1.2600
     */
    static NPGetConnection(lpLocalName, lpRemoteName, lpnBufferLen) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        result := DllCall("davclnt.dll\NPGetConnection", "ptr", lpLocalName, "ptr", lpRemoteName, "uint*", lpnBufferLen, "uint")
        return result
    }

    /**
     * Retrieves information about a network connection, even if it is currently disconnected.
     * @param {PWSTR} lpLocalName Pointer to the name of the local device the caller is interested in. The provider can assume that this is syntactically valid.
     * @param {Integer} dwLevel Value that specifies whether the network connection is currently connected or disconnected.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNGETCON_CONNECTED"></a><a id="wngetcon_connected"></a><dl>
     * <dt><b>WNGETCON_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection is connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WNGETCON_DISCONNECTED"></a><a id="wngetcon_disconnected"></a><dl>
     * <dt><b>WNGETCON_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network connection is disconnected.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer} lpBuffer Void pointer that receives a buffer that contains the requested information.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to the size, in characters, of the <i>lpBuffer</i> buffer. If the call fails because the buffer is not big enough, <i>lpBufferSize</i> is set to the required buffer size.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS.
     * 					
     * 
     * If the function fails, it should return one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device specified by <i>lpLocalName</i> is not redirected by this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer was too small to receive all of the data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetconnection3
     * @since windows5.1.2600
     */
    static NPGetConnection3(lpLocalName, dwLevel, lpBuffer, lpBufferSize) {
        lpLocalName := lpLocalName is String ? StrPtr(lpLocalName) : lpLocalName

        result := DllCall("NTLANMAN.dll\NPGetConnection3", "ptr", lpLocalName, "uint", dwLevel, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * Retrieves the universal name of a network resource. The NPGetUniversalName function can retrieve this universal name in UNC format or in the older, remote-name format.
     * @param {PWSTR} lpLocalPath Pointer to the local path of an object on a network resource. This is a drive-based path.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer Pointer to a buffer to receive the information the user has requested. The specific structure returned depends on the information level specified in <i>dwInfoLevel</i>.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to the size, in bytes, of the <i>lpBuffer</i> buffer. If the call fails because the buffer is not big enough, this location will be used to return the required buffer size.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which may be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_LOCALNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed into <i>lpLocalPath</i> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed into <i>lpLocalPath</i> is not a redirected device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetuniversalname
     * @since windows5.1.2600
     */
    static NPGetUniversalName(lpLocalPath, dwInfoLevel, lpBuffer, lpBufferSize) {
        lpLocalPath := lpLocalPath is String ? StrPtr(lpLocalPath) : lpLocalPath

        result := DllCall("davclnt.dll\NPGetUniversalName", "ptr", lpLocalPath, "uint", dwInfoLevel, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * Returns information about the expected performance of a connection used to access a network resource. The request can only be for a network resource that is currently connected.
     * @param {PWSTR} lpRemoteName Pointer to the local name or remote name for a connected resource.
     * @param {Pointer<NETCONNECTINFOSTRUCT>} lpNetConnectInfo Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netconnectinfostruct">NETCONNECTINFOSTRUCT</a> structure, which is filled in by the network provider if the provider has a connection to the network resource. All other fields of this structure, except the <b>cbStructure</b> field, are filled with zeros before the MPR passes the request on to the network providers. As a result, the provider has to write only to fields for which it has information available. Also, for rate values, a value of 1 means that the performance is better than can be represented in the unit.
     * 
     * The information returned may be an estimate. If the network cannot obtain information about the resource on the network, it can return information about the network adapter and its associated performance and then set the <b>dwFlags</b> field accordingly.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpRemoteName</i> is not a connected network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetconnectionperformance
     * @since windows5.1.2600
     */
    static NPGetConnectionPerformance(lpRemoteName, lpNetConnectInfo) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName

        result := DllCall("NTLANMAN.dll\NPGetConnectionPerformance", "ptr", lpRemoteName, "ptr", lpNetConnectInfo, "uint")
        return result
    }

    /**
     * Opens an enumeration of network resources or existing connections. The NPOpenEnum function must be called to obtain a valid handle for an enumeration.
     * @param {Integer} dwScope Determines the scope of the enumeration. This can be one of the following. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_CONNECTED"></a><a id="resource_connected"></a><dl>
     * <dt><b>RESOURCE_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All currently connected resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_GLOBALNET"></a><a id="resource_globalnet"></a><dl>
     * <dt><b>RESOURCE_GLOBALNET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All resources on the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCE_CONTEXT"></a><a id="resource_context"></a><dl>
     * <dt><b>RESOURCE_CONTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resources associated with the user's current and default network context (used for a "Network Neighborhood" view). The interpretation of this is left to the provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwType Specifies the type of resources of interest. This is a bitmask, which may be any combination of the following flags. 
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCETYPE_DISK"></a><a id="resourcetype_disk"></a><dl>
     * <dt><b>RESOURCETYPE_DISK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All disk resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCETYPE_PRINT"></a><a id="resourcetype_print"></a><dl>
     * <dt><b>RESOURCETYPE_PRINT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All print resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEUSAGE_ATTACHED"></a><a id="resourceusage_attached"></a><dl>
     * <dt><b>RESOURCEUSAGE_ATTACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specifies that the function should fail if the caller is not authenticated (even if the network permits enumeration without authentication).
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>dwType</i> is 0, or is just RESOURCEUSAGE_ATTACHED, all types of resources are returned. If a provider does not have the capability to distinguish between print and disk resources at the same level, it may return all resources.
     * @param {Integer} dwUsage Specifies the usage of resources of interested. This is a bitmask, which may be any combination of the following flags. 
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEUSAGE_CONNECTABLE"></a><a id="resourceusage_connectable"></a><dl>
     * <dt><b>RESOURCEUSAGE_CONNECTABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All connectable resources
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RESOURCEUSAGE_CONTAINER"></a><a id="resourceusage_container"></a><dl>
     * <dt><b>RESOURCEUSAGE_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All container resources
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The bitmask may be zero to match all of the flags. This parameter may be ignored if <i>dwScope</i> is not set to RESOURCE_GLOBALNET.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to the container to perform the enumeration. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> could have been obtained through a previous <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a> call, or constructed by the caller, or it can be <b>NULL</b>. If it is <b>NULL</b> or if the <b>lpRemoteName</b> field of the <b>NETRESOURCE</b> is <b>NULL</b>, the provider should enumerate the top level of its network. Note that this means a provider cannot use an <b>lpRemoteName</b> of <b>NULL</b> to represent any network resource. A caller would normally start off by calling <b>NPOpenEnum</b> with this parameter set to <b>NULL</b> and then use the returned results for further enumeration. If the calling program knows exactly the provider and remote path to enumerate from, it may build its own <b>NETRESOURCE</b> structure to pass in, filling in the <b>lpProvider</b> and <b>lpRemoteName</b> fields. Note that if <i>dwScope</i> is RESOURCE_CONNECTED or RESOURCE_CONTEXT, this parameter will be <b>NULL</b>.
     * @param {Pointer<HANDLE>} lphEnum Pointer to a handle that can be used by the <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a> function. When you have finished using the handle, release the handle by calling the <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npcloseenum">NPCloseEnum</a> function.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code which may include one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not support the type of enumeration being requested, or the specific network resource cannot be browsed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONTAINER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>lpNetResource</i> does not point to a container.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>dwScope</i>, <i>dwUsage</i>, or <i>dwType</i> or bad combination of parameters is specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npopenenum
     * @since windows5.1.2600
     */
    static NPOpenEnum(dwScope, dwType, dwUsage, lpNetResource, lphEnum) {
        result := DllCall("davclnt.dll\NPOpenEnum", "uint", dwScope, "uint", dwType, "uint", dwUsage, "ptr", lpNetResource, "ptr", lphEnum, "uint")
        return result
    }

    /**
     * Performs an enumeration based on a handle returned by NPOpenEnum.
     * @param {HANDLE} hEnum Handle obtained from an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npopenenum">NPOpenEnum</a> call.
     * @param {Pointer<UInt32>} lpcCount Pointer to the number of entries requested. It may be 0xFFFFFFFF to request as many entries as possible. If the call succeeds, this location will receive the number of entries actually read.
     * @param {Pointer} lpBuffer Pointer to the buffer to receive the enumeration result, which is returned as an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> entries. The buffer is valid until the next call using <i>hEnum</i>.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to the size, in bytes, of the buffer passed to the function call on entry. If the buffer is too small for even one entry, this should contain, on exit, the number of bytes needed to read one entry. This value is  set only if the return code is WN_MORE_DATA.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. The caller may continue to call <b>NPEnumResource</b> to continue the enumeration. Otherwise, it should return one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No more entries. The enumeration was completed successfully. When this occurs, the contents of the return buffer, <i>lpBuffer</i>, are undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small to hold even a single entry.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hEnum</i> is not a valid handle.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present. This condition is checked  before <i>hEnum</i> is tested for validity.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npenumresource
     * @since windows5.1.2600
     */
    static NPEnumResource(hEnum, lpcCount, lpBuffer, lpBufferSize) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("davclnt.dll\NPEnumResource", "ptr", hEnum, "uint*", lpcCount, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * Closes an enumeration.
     * @param {HANDLE} hEnum Handle obtained from an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npopenenum">NPOpenEnum</a> call.
     * @returns {Integer} If the function succeeds, it will return WN_SUCCESS. Otherwise, it will return an error code, which can be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present. This condition is checked  before <i>hEnum</i> is tested for validity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>hEnum</i> is not a valid handle.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npcloseenum
     * @since windows5.1.2600
     */
    static NPCloseEnum(hEnum) {
        hEnum := hEnum is Win32Handle ? NumGet(hEnum, "ptr") : hEnum

        result := DllCall("davclnt.dll\NPCloseEnum", "ptr", hEnum, "uint")
        return result
    }

    /**
     * Returns information about which services are supported on the network.
     * @param {Integer} ndex 
     * @returns {Integer} The <b>NPGetCaps</b> function returns either a constant or a bitmask, depending on the value of the <i>nIndex</i> parameter. A few of the <i>nIndex</i> values cause a constant to be returned. But in most cases, the <i>nIndex</i> parameter specifies which set of services to query, and the returned value is a bitmask that indicates which services in this set are supported. In these cases, a zero return value indicates that none of the services in the set are supported.
     * 
     * The following list shows the values that <i>nIndex</i> may contain, each followed by a description of what is returned for that value.
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetcaps
     * @since windows5.1.2600
     */
    static NPGetCaps(ndex) {
        result := DllCall("davclnt.dll\NPGetCaps", "uint", ndex, "uint")
        return result
    }

    /**
     * Retrieves the value of the current default user name or the user name used to establish a network connection.
     * @param {PWSTR} lpName Pointer to the name of the local device the caller is interested in, or a remote name for a resource that the user has made a connection to. This parameter may be <b>NULL</b> or the empty string if the caller is interested in the name of the user currently logged on to the system. If a remote name for a resource is passed in, and the user is connected to that resource using different names, it is possible that a provider cannot resolve which user name to return. In this case the provider may make an arbitrary choice amongst the possible user names.
     * @param {PWSTR} lpUserName Pointer to a buffer to receive the user name. This should be a name that can be passed into the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection">NPAddConnection</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npaddconnection3">NPAddConnection3</a> function to re-establish the connection with the same user name.
     * @param {Pointer<UInt32>} lpnBufferLen Pointer to the size, in characters, of the <i>lpUserName</i> buffer. If the call fails because the buffer is not big enough, this location will be used to return the required buffer size.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise it should return an error code, which can be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value in the <i>lpName</i> parameter is not the name of a redirected device or a connected remote name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer, <i>lpUserName</i>, is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NO_NETWORK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network is not present.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetuser
     * @since windows5.1.2600
     */
    static NPGetUser(lpName, lpUserName, lpnBufferLen) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpUserName := lpUserName is String ? StrPtr(lpUserName) : lpUserName

        result := DllCall("davclnt.dll\NPGetUser", "ptr", lpName, "ptr", lpUserName, "uint*", lpnBufferLen, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} lpRemotePath 
     * @param {Pointer} lpReadUseOptions 
     * @param {Integer} cbReadUseOptions 
     * @param {Pointer} lpWriteUseOptions 
     * @param {Pointer<UInt32>} lpSizeWriteUseOptions 
     * @returns {Integer} 
     */
    static NPGetPersistentUseOptionsForConnection(lpRemotePath, lpReadUseOptions, cbReadUseOptions, lpWriteUseOptions, lpSizeWriteUseOptions) {
        lpRemotePath := lpRemotePath is String ? StrPtr(lpRemotePath) : lpRemotePath

        result := DllCall("NTLANMAN.dll\NPGetPersistentUseOptionsForConnection", "ptr", lpRemotePath, "ptr", lpReadUseOptions, "uint", cbReadUseOptions, "ptr", lpWriteUseOptions, "uint*", lpSizeWriteUseOptions, "uint")
        return result
    }

    /**
     * Retrieves the parent of a specified network resource in the browse hierarchy.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Pointer to the network resource whose parent name is required. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> could have been obtained from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npgetresourceinformation">NPGetResourceInformation</a>, or constructed by the caller. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> field specifies the remote name of the network resource whose parent is required.
     * 
     * The <b>lpProvider</b> field specifies the provider to call. This must be supplied.
     * 
     * The <b>dwType</b> field is filled in if the calling program knows its value. Otherwise, it is set to <b>NULL</b>.
     * 
     * All other fields in the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> are ignored and are not initialized.
     * @param {Pointer} lpBuffer Pointer to a buffer to receive the result, which is a single <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure representing the parent resource. The <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> fields are returned; all other fields are set to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The output <b>lpRemoteName</b> should be in the same format as that returned from an enumeration by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a>, so that the caller can perform a case-sensitive string comparison to determine whether the parent resource is the same as one returned by <b>NPEnumResource</b>. If the input resource syntactically has a parent, the provider can return it, without determining whether the input resource or its parent actually exist. If a resource has no browse parent on the network, then <b>lpRemoteName</b> is returned as <b>NULL</b>.
     * 
     * The RESOURCEUSAGE_CONNECTABLE bit in the returned <b>dwUsage</b> field does not necessarily indicate that the resource can currently be connected to, only that the resource is connectable when it is available on the network.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a location that specifies the size, in bytes, of the buffer pointed to by the <i>lpBuffer</i> parameter. If the buffer is too small for the result, the function places the required buffer size at this location and returns the error WN_MORE_DATA.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which may be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_NETNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This provider does not own the resource specified by <i>lpNetResource</i> (or the resource is syntactically not valid).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Either <b>dwUsage</b> or <b>dwType</b> is not valid, or there is an incorrect combination of parameters specified (for example, <b>lpRemoteName</b> is syntactically not valid for <b>dwType</b>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_AUTHENTICATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has not been authenticated to the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has been authenticated to the network, but does not have sufficient permissions.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetresourceparent
     * @since windows5.1.2600
     */
    static NPGetResourceParent(lpNetResource, lpBuffer, lpBufferSize) {
        result := DllCall("davclnt.dll\NPGetResourceParent", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpBufferSize, "uint")
        return result
    }

    /**
     * Separates the part of a network resource accessed through the WNet API from the part accessed through APIs specific to the resource type.
     * @param {Pointer<NETRESOURCEW>} lpNetResource Specifies the network resource for which information is required. The <b>lpRemoteName</b> field specifies the remote name of the resource. The calling program should fill in the values for the <b>lpProvider</b> and <b>dwType</b> fields if it knows these values; otherwise, it should set these fields to <b>NULL</b>. All other fields in the <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> are ignored and are not initialized. 
     * 
     * 
     * 
     * 
     * If the <b>lpRemoteName</b> string contains a portion that is accessed through WNet APIs and a portion that is accessed through other system APIs specific to the resource type, the function should return information only about the network portion of the resource (except for <i>lplpSystem</i>, as described later in this topic).
     * 
     * For example, if the resource is "\\server\share\dir1\dir2", where "\\server\share" is accessed through WNet APIs and "\dir1\dir2" is accessed through file system APIs, the provider should verify that it is the right provider for "\\server\share", but need not check whether "\dir1\dir2" actually exists.
     * @param {Pointer} lpBuffer Pointer to the buffer to receive the result. The first field in the result is a single 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/ns-winnetwk-netresourcea">NETRESOURCE</a> structure, and associated strings, representing that portion of the input resource that is accessed through the WNet API, rather than system APIs specific to the resource type. For example, if the input remote resource name was "\\server\share\dir1\dir2", then the output <b>NETRESOURCE</b> contains information about the resource "\\server\share". The <b>lpRemoteName</b>, <b>lpProvider</b>, <b>dwType</b>, <b>dwDisplayType</b>, and <b>dwUsage</b> fields are returned containing values, all other fields being set to <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The <b>lpRemoteName</b> field should be returned in the same format as that returned from an enumeration by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/npapi/nf-npapi-npenumresource">NPEnumResource</a> function, so that the caller can perform a case-sensitive string comparison. This is necessary to determine whether the output network resource is the same as one returned by <b>NPEnumResource</b>.
     * 
     * The provider should not do purely syntactic checking to determine whether it owns the resource. This could produce incorrect results when two networks are running on the client and the provider doing syntactic checking is called first.
     * @param {Pointer<UInt32>} lpBufferSize Pointer to a location that specifies the size, in bytes, of the buffer pointed to by <i>lpBuffer</i>. If the buffer is too small for the result, the function places the required buffer size at this location and returns the error WN_MORE_DATA.
     * @param {Pointer<PWSTR>} lplpSystem On a successful return, a pointer to a <b>null</b>-terminated string in the output buffer specifying that part of the resource that is accessed through system APIs specific to the resource type, rather than through the WNet API. If there is no such part, <i>lplpSystem</i> is set to <b>NULL</b>. For example, if the input remote resource name was "\\server\share\dir", <b>lpRemoteName</b> is returned pointing to "\\server\share" and <i>lplpSystem</i> points to "\dir", both strings being stored in the buffer pointed to by <i>lpBuffer</i>.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS. Otherwise, it should return an error code, which may be one of the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_NETNAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The resource is not recognized by this provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_VALUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid <i>dwUsage</i> or <i>dwType</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_BAD_DEV_TYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller passed in a nonzero <i>dwType</i> that does not match the actual type of the network resource.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_NOT_AUTHENTICATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has not been authenticated to the network.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller has been authenticated to the network but does not have sufficient permissions.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npgetresourceinformation
     * @since windows5.1.2600
     */
    static NPGetResourceInformation(lpNetResource, lpBuffer, lpBufferSize, lplpSystem) {
        result := DllCall("davclnt.dll\NPGetResourceInformation", "ptr", lpNetResource, "ptr", lpBuffer, "uint*", lpBufferSize, "ptr", lplpSystem, "uint")
        return result
    }

    /**
     * Formats a network name in a provider-specific format for display in a control.
     * @param {PWSTR} lpRemoteName Pointer to the network name to format.
     * @param {PWSTR} lpFormattedName Pointer to a string that receives the formatted name.
     * @param {Pointer<UInt32>} lpnLength Pointer to <b>DWORD</b> that specifies the size, in characters, of the <i>lpFormattedName</i> buffer. If the return value of this function is WN_MORE_DATA, <i>lpnLength</i> contains the required buffer size, in characters.
     * @param {Integer} dwFlags 
     * @param {Integer} dwAveCharPerLine Specifies the average number of characters that will fit on a single line where the network name is being presented. Specifically, this value is defined as the width of the control divided by the <b>tmAveCharWidth</b> field of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-textmetrica">TEXTMETRIC</a> structure from the font used for display in the control.
     * @returns {Integer} If the function succeeds, it should return WN_SUCCESS.
     * 					
     * 
     * If the function fails, it should return the following value. All other errors will be ignored, and the unformatted network name will be used.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WN_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The input buffer is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-npformatnetworkname
     * @since windows5.1.2600
     */
    static NPFormatNetworkName(lpRemoteName, lpFormattedName, lpnLength, dwFlags, dwAveCharPerLine) {
        lpRemoteName := lpRemoteName is String ? StrPtr(lpRemoteName) : lpRemoteName
        lpFormattedName := lpFormattedName is String ? StrPtr(lpFormattedName) : lpFormattedName

        result := DllCall("davclnt.dll\NPFormatNetworkName", "ptr", lpRemoteName, "ptr", lpFormattedName, "uint*", lpnLength, "uint", dwFlags, "uint", dwAveCharPerLine, "uint")
        return result
    }

    /**
     * Sets extended error information. Network providers should call this function instead of SetLastError.
     * @remarks
     * 
     * This function is implemented by the Windows operating system and can be called by network providers.
     * 
     * A provider should use this function to report errors that contain provider-specific information. The error information is saved until it is overwritten by another call to <b>WNetSetLastError</b> in the same thread.
     * 
     * The recommended way for a provider function to handle general errors is to use the following statement.
     * 
     * 
     * ```cpp
     * return(providerError);
     * 
     * ```
     * 
     * 
     * In this statement, providerError is a Windows error code, such as one of the return codes listed for the provider API in this document.
     * 
     * For provider-specific errors, a provider should do the following.
     * 
     * 
     * ```cpp
     * //  Set up lpErrorString to be the error to be reported.
     * WNetSetLastError(providerError,
     * lpErrorString,
     * lpProviderName) ;
     * return(ERROR_EXTENDED_ERROR) ;
     * 
     * ```
     * 
     * 
     * In this case, providerError is the provider-specific error code.
     * 
     * Providers do not need to call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> before returning from a provider function. The MPR calls <b>SetLastError</b> to set the Windows error returned from a provider when necessary to satisfy applications.
     * 
     * @param {Integer} err The error that occurred. This is a network-specific error code.
     * @param {PSTR} lpError String that describes the network-specific error.
     * @param {PSTR} lpProviders String that names the network provider that raised the error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-wnetsetlasterrora
     * @since windows5.1.2600
     */
    static WNetSetLastErrorA(err, lpError, lpProviders) {
        lpError := lpError is String ? StrPtr(lpError) : lpError
        lpProviders := lpProviders is String ? StrPtr(lpProviders) : lpProviders

        DllCall("MPR.dll\WNetSetLastErrorA", "uint", err, "ptr", lpError, "ptr", lpProviders)
    }

    /**
     * Sets extended error information. Network providers should call this function instead of SetLastError.
     * @remarks
     * 
     * This function is implemented by the Windows operating system and can be called by network providers.
     * 
     * A provider should use this function to report errors that contain provider-specific information. The error information is saved until it is overwritten by another call to <b>WNetSetLastError</b> in the same thread.
     * 
     * The recommended way for a provider function to handle general errors is to use the following statement.
     * 
     * ```cpp
     * return(providerError);
     * ```
     * 
     * In this statement, providerError is a Windows error code, such as one of the return codes listed for the provider API in this document.
     * 
     * For provider-specific errors, a provider should do the following.
     * 
     * ```cpp
     * //  Set up lpErrorString to be the error to be reported.
     * WNetSetLastError(providerError,
     * lpErrorString,
     * lpProviderName);
     * return(ERROR_EXTENDED_ERROR);
     * ```
     * 
     * In this case, providerError is the provider-specific error code.
     * 
     * Providers do not need to call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> before returning from a provider function. The MPR calls <b>SetLastError</b> to set the Windows error returned from a provider when necessary to satisfy applications.
     * 
     * @param {Integer} err The error that occurred. This is a network-specific error code.
     * @param {PWSTR} lpError String that describes the network-specific error.
     * @param {PWSTR} lpProviders String that names the network provider that raised the error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//npapi/nf-npapi-wnetsetlasterrorw
     */
    static WNetSetLastErrorW(err, lpError, lpProviders) {
        lpError := lpError is String ? StrPtr(lpError) : lpError
        lpProviders := lpProviders is String ? StrPtr(lpProviders) : lpProviders

        DllCall("MPR.dll\WNetSetLastErrorW", "uint", err, "ptr", lpError, "ptr", lpProviders)
    }

;@endregion Methods
}
