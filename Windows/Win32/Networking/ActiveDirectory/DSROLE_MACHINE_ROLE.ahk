#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the MachineRole member of the DSROLE_PRIMARY_DOMAIN_INFO_BASIC structure to specify the computer role.
 * @see https://docs.microsoft.com/windows/win32/api//dsrole/ne-dsrole-dsrole_machine_role
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSROLE_MACHINE_ROLE{

    /**
     * The computer is a workstation that is not a member of a domain.
     * @type {Integer (Int32)}
     */
    static DsRole_RoleStandaloneWorkstation => 0

    /**
     * The computer is a workstation that is a member of a domain.
     * @type {Integer (Int32)}
     */
    static DsRole_RoleMemberWorkstation => 1

    /**
     * The computer is a server that is not a member of a domain.
     * @type {Integer (Int32)}
     */
    static DsRole_RoleStandaloneServer => 2

    /**
     * The computer is a server that is a member of a domain.
     * @type {Integer (Int32)}
     */
    static DsRole_RoleMemberServer => 3

    /**
     * The computer is a backup domain controller.
     * @type {Integer (Int32)}
     */
    static DsRole_RoleBackupDomainController => 4

    /**
     * The computer is a primary domain controller.
     * @type {Integer (Int32)}
     */
    static DsRole_RolePrimaryDomainController => 5
}
