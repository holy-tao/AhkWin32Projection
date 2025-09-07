#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_NOTIFICATIONS{

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemExited => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemCreateCompleted => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemStartCompleted => 3

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemPauseCompleted => 4

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemResumeCompleted => 5

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemCrashReport => 6

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemSiloJobCreated => 7

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemSaveCompleted => 8

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemRdpEnhancedModeStateChanged => 9

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemShutdownFailed => 10

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemShutdownCompleted => 10

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemGetPropertiesCompleted => 11

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemModifyCompleted => 12

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemCrashInitiated => 13

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemGuestConnectionClosed => 14

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemOperationCompletion => 15

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationSystemPassThru => 16

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationOperationProgressUpdate => 256

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationProcessExited => 65536

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationServiceDisconnect => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationFlagsReserved => -268435456
}
