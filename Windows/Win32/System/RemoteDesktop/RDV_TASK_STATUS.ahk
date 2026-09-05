#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with the IRDVTaskPluginNotifySink::OnTaskStateChange method to indicate the status of a task.
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-rdv_task_status
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class RDV_TASK_STATUS extends Win32Enum {

    /**
     * The task state cannot be determined.
     * Native name: RDV_TASK_STATUS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Searching for applicable tasks.
     * Native name: RDV_TASK_STATUS_SEARCHING
     * @type {Integer (Int32)}
     */
    static SEARCHING => 1

    /**
     * Downloading tasks.
     * Native name: RDV_TASK_STATUS_DOWNLOADING
     * @type {Integer (Int32)}
     */
    static DOWNLOADING => 2

    /**
     * Performing tasks.
     * Native name: RDV_TASK_STATUS_APPLYING
     * @type {Integer (Int32)}
     */
    static APPLYING => 3

    /**
     * Rebooting. The task may or may not be complete.
     * Native name: RDV_TASK_STATUS_REBOOTING
     * @type {Integer (Int32)}
     */
    static REBOOTING => 4

    /**
     * Reboot completed. The task may or may not be complete.
     * Native name: RDV_TASK_STATUS_REBOOTED
     * @type {Integer (Int32)}
     */
    static REBOOTED => 5

    /**
     * Task completed successfully.
     * Native name: RDV_TASK_STATUS_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 6

    /**
     * Task failed.
     * Native name: RDV_TASK_STATUS_FAILED
     * @type {Integer (Int32)}
     */
    static FAILED => 7

    /**
     * Task did not finish in the allotted time.
     * Native name: RDV_TASK_STATUS_TIMEOUT
     * @type {Integer (Int32)}
     */
    static TIMEOUT => 8
}
