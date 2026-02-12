#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reasons for cancelling a background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskcancellationreason
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskCancellationReason extends Win32Enum{

    /**
     * The background task was canceled by the application. This can happen for one of the following four reasons: 
     * + The task is considered an idle task. This means that the background task is still running, but without doing anything – for example, a JavaScript task that does not call the **close()** function.
     * + The background task uses the [MaintenanceTrigger](maintenancetrigger.md) and the system transitions to DC (battery power).
     * + The app unregisters the background task, in which case the task is cancelled if it is currently running.
     * + The app that registered the background task is uninstalled while the task is running.
     * @type {Integer (Int32)}
     */
    static Abort => 0

    /**
     * The background task was canceled because the application is about to be terminated due to system policy. The application should save any state that will be needed when the application restarts.
     * @type {Integer (Int32)}
     */
    static Terminating => 1

    /**
     * The background task was canceled because the user has logged off the system.
     * @type {Integer (Int32)}
     */
    static LoggingOff => 2

    /**
     * The background task was canceled because the application was updated.
     * @type {Integer (Int32)}
     */
    static ServicingUpdate => 3

    /**
     * The background task was canceled because it was active, but not doing any work.
     * @type {Integer (Int32)}
     */
    static IdleTask => 4

    /**
     * The background task was canceled because the application was uninstalled.
     * @type {Integer (Int32)}
     */
    static Uninstall => 5

    /**
     * The background task was canceled because one or more of its required conditions is no longer met.
     * @type {Integer (Int32)}
     */
    static ConditionLoss => 6

    /**
     * The background task was cancelled because of system policy.
     * @type {Integer (Int32)}
     */
    static SystemPolicy => 7

    /**
     * The background task was cancelled because the device entered the quiet hours period.
     * 
     * > [!NOTE]
     * > **QuietHoursEntered** is no longer available for use as of Windows 10.
     * @type {Integer (Int32)}
     */
    static QuietHoursEntered => 8

    /**
     * The background task was cancelled because it exceeded its allotted time to run.
     * @type {Integer (Int32)}
     */
    static ExecutionTimeExceeded => 9

    /**
     * The background task was cancelled because the system needed additional resources. The background task was cancelled to free up those resources.
     * @type {Integer (Int32)}
     */
    static ResourceRevocation => 10

    /**
     * The background task was cancelled because of the current Energy Saver policy.
     * @type {Integer (Int32)}
     */
    static EnergySaver => 11
}
