#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the reasons a restart of the system is needed.
 * @see https://docs.microsoft.com/windows/win32/api//restartmanager/ne-restartmanager-rm_reboot_reason
 * @namespace Windows.Win32.System.RestartManager
 * @version v4.0.30319
 */
class RM_REBOOT_REASON extends Win32Enum{

    /**
     * A system restart is not required.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonNone => 0

    /**
     * The current user does not have
     *                                             sufficient privileges to shut down one or more processes.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonPermissionDenied => 1

    /**
     * One or more processes are
     *                                             running in another Terminal Services session.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonSessionMismatch => 2

    /**
     * A system restart is needed because one or more processes to be shut down are critical processes.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonCriticalProcess => 4

    /**
     * A system restart is needed because one or more services to be shut down are critical services.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonCriticalService => 8

    /**
     * A system restart is needed because the current process must be shut down.
     * @type {Integer (Int32)}
     */
    static RmRebootReasonDetectedSelf => 16
}
