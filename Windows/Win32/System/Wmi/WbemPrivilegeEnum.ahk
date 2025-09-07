#Requires AutoHotkey v2.0.0 64-bit

/**
 * Define privileges. These constants are used with SWbemSecurity to grant the privileges required for some operations.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemprivilegeenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemPrivilegeEnum{

    /**
     * Required to create a primary token.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeCreateToken => 1

    /**
     * Required to assign the primary token of a process.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegePrimaryToken => 2

    /**
     * Required to lock physical pages in memory.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeLockMemory => 3

    /**
     * Required to increase the quota assigned to a process.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeIncreaseQuota => 4

    /**
     * Required to create a machine account.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeMachineAccount => 5

    /**
     * Identifies its holder as part of the trusted computer base. Some trusted, protected subsystems are granted this privilege.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeTcb => 6

    /**
     * Required to perform a number of security-related functions, such as controlling and viewing audit messages. This privilege identifies its holder as a security operator.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeSecurity => 7

    /**
     * Required to take ownership of an object without being granted discretionary access. This privilege allows the owner value to be set only to those values that the holder may legitimately assign as the owner of an object.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeTakeOwnership => 8

    /**
     * Required to load or unload a device driver.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeLoadDriver => 9

    /**
     * Required to gather profiling information for the entire system.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeSystemProfile => 10

    /**
     * Required to modify the system time.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeSystemtime => 11

    /**
     * Required to gather profiling information for a single process.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeProfileSingleProcess => 12

    /**
     * Required to increase the base priority of a process.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeIncreaseBasePriority => 13

    /**
     * Required to create a paging file.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeCreatePagefile => 14

    /**
     * Required to create a permanent object.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeCreatePermanent => 15

    /**
     * Required to perform backup operations.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeBackup => 16

    /**
     * Required to perform restore operations. This privilege enables you to set any valid user or group security identifier (SID)  as the owner of an object.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeRestore => 17

    /**
     * Required to shut down a local system.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeShutdown => 18

    /**
     * Required to debug a process.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeDebug => 19

    /**
     * Required to generate audit-log entries.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeAudit => 20

    /**
     * Required to modify the nonvolatile RAM of systems that use this type of memory to store configuration information.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeSystemEnvironment => 21

    /**
     * Required to receive notifications of changes to files or directories. This privilege also causes the system to skip all traversal access checks. It is enabled by default for all users.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeChangeNotify => 22

    /**
     * Required to shut down a system using a network request.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeRemoteShutdown => 23

    /**
     * Required to remove a computer from a docking station.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeUndock => 24

    /**
     * Required to synchronize directory service data.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeSyncAgent => 25

    /**
     * Required to enable computer and user accounts to be trusted for delegation.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeEnableDelegation => 26

    /**
     * Required to perform volume maintenance tasks.
     * @type {Integer (Int32)}
     */
    static wbemPrivilegeManageVolume => 27
}
