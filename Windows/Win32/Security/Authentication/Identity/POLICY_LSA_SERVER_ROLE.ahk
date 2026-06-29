#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate the role of an LSA server.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-policy_lsa_server_role
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_LSA_SERVER_ROLE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates a backup LSA server.
     * @type {Integer (Int32)}
     */
    static PolicyServerRoleBackup => 2

    /**
     * Indicates a primary LSA server, a workstation, or a standalone computer.
     * @type {Integer (Int32)}
     */
    static PolicyServerRolePrimary => 3
}
