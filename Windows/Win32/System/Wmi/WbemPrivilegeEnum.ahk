#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define privileges. These constants are used with SWbemSecurity to grant the privileges required for some operations.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemprivilegeenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemPrivilegeEnum extends Win32Enum {

    /**
     * Required to create a primary token.
     * Native name: wbemPrivilegeCreateToken
     * @type {Integer (Int32)}
     */
    static CreateToken => 1

    /**
     * Required to assign the primary token of a process.
     * Native name: wbemPrivilegePrimaryToken
     * @type {Integer (Int32)}
     */
    static PrimaryToken => 2

    /**
     * Required to lock physical pages in memory.
     * Native name: wbemPrivilegeLockMemory
     * @type {Integer (Int32)}
     */
    static LockMemory => 3

    /**
     * Required to increase the quota assigned to a process.
     * Native name: wbemPrivilegeIncreaseQuota
     * @type {Integer (Int32)}
     */
    static IncreaseQuota => 4

    /**
     * Required to create a machine account.
     * Native name: wbemPrivilegeMachineAccount
     * @type {Integer (Int32)}
     */
    static MachineAccount => 5

    /**
     * Identifies its holder as part of the trusted computer base. Some trusted, protected subsystems are granted this privilege.
     * Native name: wbemPrivilegeTcb
     * @type {Integer (Int32)}
     */
    static Tcb => 6

    /**
     * Required to perform a number of security-related functions, such as controlling and viewing audit messages. This privilege identifies its holder as a security operator.
     * Native name: wbemPrivilegeSecurity
     * @type {Integer (Int32)}
     */
    static Security => 7

    /**
     * Required to take ownership of an object without being granted discretionary access. This privilege allows the owner value to be set only to those values that the holder may legitimately assign as the owner of an object.
     * Native name: wbemPrivilegeTakeOwnership
     * @type {Integer (Int32)}
     */
    static TakeOwnership => 8

    /**
     * Required to load or unload a device driver.
     * Native name: wbemPrivilegeLoadDriver
     * @type {Integer (Int32)}
     */
    static LoadDriver => 9

    /**
     * Required to gather profiling information for the entire system.
     * Native name: wbemPrivilegeSystemProfile
     * @type {Integer (Int32)}
     */
    static SystemProfile => 10

    /**
     * Required to modify the system time.
     * Native name: wbemPrivilegeSystemtime
     * @type {Integer (Int32)}
     */
    static Systemtime => 11

    /**
     * Required to gather profiling information for a single process.
     * Native name: wbemPrivilegeProfileSingleProcess
     * @type {Integer (Int32)}
     */
    static ProfileSingleProcess => 12

    /**
     * Required to increase the base priority of a process.
     * Native name: wbemPrivilegeIncreaseBasePriority
     * @type {Integer (Int32)}
     */
    static IncreaseBasePriority => 13

    /**
     * Required to create a paging file.
     * Native name: wbemPrivilegeCreatePagefile
     * @type {Integer (Int32)}
     */
    static CreatePagefile => 14

    /**
     * Required to create a permanent object.
     * Native name: wbemPrivilegeCreatePermanent
     * @type {Integer (Int32)}
     */
    static CreatePermanent => 15

    /**
     * Required to perform backup operations.
     * Native name: wbemPrivilegeBackup
     * @type {Integer (Int32)}
     */
    static Backup => 16

    /**
     * Required to perform restore operations. This privilege enables you to set any valid user or group security identifier (SID)  as the owner of an object.
     * Native name: wbemPrivilegeRestore
     * @type {Integer (Int32)}
     */
    static Restore => 17

    /**
     * Required to shut down a local system.
     * Native name: wbemPrivilegeShutdown
     * @type {Integer (Int32)}
     */
    static Shutdown => 18

    /**
     * Required to debug a process.
     * Native name: wbemPrivilegeDebug
     * @type {Integer (Int32)}
     */
    static Debug => 19

    /**
     * Required to generate audit-log entries.
     * Native name: wbemPrivilegeAudit
     * @type {Integer (Int32)}
     */
    static Audit => 20

    /**
     * Required to modify the nonvolatile RAM of systems that use this type of memory to store configuration information.
     * Native name: wbemPrivilegeSystemEnvironment
     * @type {Integer (Int32)}
     */
    static SystemEnvironment => 21

    /**
     * Required to receive notifications of changes to files or directories. This privilege also causes the system to skip all traversal access checks. It is enabled by default for all users.
     * Native name: wbemPrivilegeChangeNotify
     * @type {Integer (Int32)}
     */
    static ChangeNotify => 22

    /**
     * Required to shut down a system using a network request.
     * Native name: wbemPrivilegeRemoteShutdown
     * @type {Integer (Int32)}
     */
    static RemoteShutdown => 23

    /**
     * Required to remove a computer from a docking station.
     * Native name: wbemPrivilegeUndock
     * @type {Integer (Int32)}
     */
    static Undock => 24

    /**
     * Required to synchronize directory service data.
     * Native name: wbemPrivilegeSyncAgent
     * @type {Integer (Int32)}
     */
    static SyncAgent => 25

    /**
     * Required to enable computer and user accounts to be trusted for delegation.
     * Native name: wbemPrivilegeEnableDelegation
     * @type {Integer (Int32)}
     */
    static EnableDelegation => 26

    /**
     * Required to perform volume maintenance tasks.
     * Native name: wbemPrivilegeManageVolume
     * @type {Integer (Int32)}
     */
    static ManageVolume => 27
}
