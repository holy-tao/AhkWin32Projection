#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with the DSROLE_UPGRADE_STATUS_INFO structure to indicate the role of a server.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ne-dsrole-dsrole_server_state
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_SERVER_STATE extends Win32Enum{

    /**
     * The server role is unknown.
     * @type {Integer (Int32)}
     */
    static DsRoleServerUnknown => 0

    /**
     * The server was, or is, a primary domain controller.
     * @type {Integer (Int32)}
     */
    static DsRoleServerPrimary => 1

    /**
     * The server was, or is, a backup domain controller.
     * @type {Integer (Int32)}
     */
    static DsRoleServerBackup => 2
}
