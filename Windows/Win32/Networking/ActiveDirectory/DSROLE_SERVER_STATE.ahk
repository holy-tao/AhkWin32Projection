#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the DSROLE_UPGRADE_STATUS_INFO structure to indicate the role of a server.
 * @see https://learn.microsoft.com/windows/win32/api/dsrole/ne-dsrole-dsrole_server_state
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSROLE_SERVER_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
