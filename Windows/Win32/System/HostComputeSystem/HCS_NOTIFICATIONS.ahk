#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_NOTIFICATIONS extends Win32Enum {

    /**
     * Native name: HcsNotificationInvalid
     * @type {Integer (Int32)}
     */
    static NotificationInvalid => 0

    /**
     * Native name: HcsNotificationSystemExited
     * @type {Integer (Int32)}
     */
    static NotificationSystemExited => 1

    /**
     * Native name: HcsNotificationSystemCreateCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemCreateCompleted => 2

    /**
     * Native name: HcsNotificationSystemStartCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemStartCompleted => 3

    /**
     * Native name: HcsNotificationSystemPauseCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemPauseCompleted => 4

    /**
     * Native name: HcsNotificationSystemResumeCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemResumeCompleted => 5

    /**
     * Native name: HcsNotificationSystemCrashReport
     * @type {Integer (Int32)}
     */
    static NotificationSystemCrashReport => 6

    /**
     * Native name: HcsNotificationSystemSiloJobCreated
     * @type {Integer (Int32)}
     */
    static NotificationSystemSiloJobCreated => 7

    /**
     * Native name: HcsNotificationSystemSaveCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemSaveCompleted => 8

    /**
     * Native name: HcsNotificationSystemRdpEnhancedModeStateChanged
     * @type {Integer (Int32)}
     */
    static NotificationSystemRdpEnhancedModeStateChanged => 9

    /**
     * Native name: HcsNotificationSystemShutdownFailed
     * @type {Integer (Int32)}
     */
    static NotificationSystemShutdownFailed => 10

    /**
     * Native name: HcsNotificationSystemShutdownCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemShutdownCompleted => 10

    /**
     * Native name: HcsNotificationSystemGetPropertiesCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemGetPropertiesCompleted => 11

    /**
     * Native name: HcsNotificationSystemModifyCompleted
     * @type {Integer (Int32)}
     */
    static NotificationSystemModifyCompleted => 12

    /**
     * Native name: HcsNotificationSystemCrashInitiated
     * @type {Integer (Int32)}
     */
    static NotificationSystemCrashInitiated => 13

    /**
     * Native name: HcsNotificationSystemGuestConnectionClosed
     * @type {Integer (Int32)}
     */
    static NotificationSystemGuestConnectionClosed => 14

    /**
     * Native name: HcsNotificationSystemOperationCompletion
     * @type {Integer (Int32)}
     */
    static NotificationSystemOperationCompletion => 15

    /**
     * Native name: HcsNotificationSystemPassThru
     * @type {Integer (Int32)}
     */
    static NotificationSystemPassThru => 16

    /**
     * Native name: HcsNotificationOperationProgressUpdate
     * @type {Integer (Int32)}
     */
    static NotificationOperationProgressUpdate => 256

    /**
     * Native name: HcsNotificationProcessExited
     * @type {Integer (Int32)}
     */
    static NotificationProcessExited => 65536

    /**
     * Native name: HcsNotificationServiceDisconnect
     * @type {Integer (Int32)}
     */
    static NotificationServiceDisconnect => 16777216

    /**
     * Native name: HcsNotificationFlagsReserved
     * @type {Integer (Int32)}
     */
    static NotificationFlagsReserved => -268435456
}
