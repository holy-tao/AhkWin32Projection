#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the reasons a restart of the system is needed.
 * @see https://learn.microsoft.com/windows/win32/api/restartmanager/ne-restartmanager-rm_reboot_reason
 * @namespace Windows.Win32.System.RestartManager
 */
class RM_REBOOT_REASON extends Win32Enum {

    /**
     * A system restart is not required.
     * Native name: RmRebootReasonNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The current user does not have
     *                                             sufficient privileges to shut down one or more processes.
     * Native name: RmRebootReasonPermissionDenied
     * @type {Integer (Int32)}
     */
    static PermissionDenied => 1

    /**
     * One or more processes are
     *                                             running in another Terminal Services session.
     * Native name: RmRebootReasonSessionMismatch
     * @type {Integer (Int32)}
     */
    static SessionMismatch => 2

    /**
     * A system restart is needed because one or more processes to be shut down are critical processes.
     * Native name: RmRebootReasonCriticalProcess
     * @type {Integer (Int32)}
     */
    static CriticalProcess => 4

    /**
     * A system restart is needed because one or more services to be shut down are critical services.
     * Native name: RmRebootReasonCriticalService
     * @type {Integer (Int32)}
     */
    static CriticalService => 8

    /**
     * A system restart is needed because the current process must be shut down.
     * Native name: RmRebootReasonDetectedSelf
     * @type {Integer (Int32)}
     */
    static DetectedSelf => 16
}
