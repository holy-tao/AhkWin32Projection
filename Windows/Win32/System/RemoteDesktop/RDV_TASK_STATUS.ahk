#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the IRDVTaskPluginNotifySink::OnTaskStateChange method to indicate the status of a task.
 * @see https://docs.microsoft.com/windows/win32/api//sessdirpublictypes/ne-sessdirpublictypes-rdv_task_status
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class RDV_TASK_STATUS{

    /**
     * The task state cannot be determined.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_UNKNOWN => 0

    /**
     * Searching for applicable tasks.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_SEARCHING => 1

    /**
     * Downloading tasks.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_DOWNLOADING => 2

    /**
     * Performing tasks.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_APPLYING => 3

    /**
     * Rebooting. The task may or may not be complete.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_REBOOTING => 4

    /**
     * Reboot completed. The task may or may not be complete.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_REBOOTED => 5

    /**
     * Task completed successfully.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_SUCCESS => 6

    /**
     * Task failed.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_FAILED => 7

    /**
     * Task did not finish in the allotted time.
     * @type {Integer (Int32)}
     */
    static RDV_TASK_STATUS_TIMEOUT => 8
}
