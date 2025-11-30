#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the role of an LSA server.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-policy_lsa_server_role
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_LSA_SERVER_ROLE extends Win32Enum{

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
