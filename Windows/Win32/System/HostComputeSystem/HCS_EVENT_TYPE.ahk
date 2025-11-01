#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_TYPE
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_EVENT_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemExited => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemCrashInitiated => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemCrashReport => 3

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemRdpEnhancedModeStateChanged => 4

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemSiloJobCreated => 5

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventSystemGuestConnectionClosed => 6

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventProcessExited => 65536

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventOperationCallback => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventServiceDisconnect => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventGroupVmLifecycle => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventGroupLiveMigration => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static HcsEventGroupOperationInfo => -1073741823
}
