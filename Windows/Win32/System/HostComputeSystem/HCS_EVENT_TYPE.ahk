#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCS_EVENT_TYPE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/HCS_EVENT_TYPE
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_EVENT_TYPE extends Win32Enum {

    /**
     * Native name: HcsEventInvalid
     * @type {Integer (Int32)}
     */
    static Invalid => 0

    /**
     * Native name: HcsEventSystemExited
     * @type {Integer (Int32)}
     */
    static SystemExited => 1

    /**
     * Native name: HcsEventSystemCrashInitiated
     * @type {Integer (Int32)}
     */
    static SystemCrashInitiated => 2

    /**
     * Native name: HcsEventSystemCrashReport
     * @type {Integer (Int32)}
     */
    static SystemCrashReport => 3

    /**
     * Native name: HcsEventSystemRdpEnhancedModeStateChanged
     * @type {Integer (Int32)}
     */
    static SystemRdpEnhancedModeStateChanged => 4

    /**
     * Native name: HcsEventSystemSiloJobCreated
     * @type {Integer (Int32)}
     */
    static SystemSiloJobCreated => 5

    /**
     * Native name: HcsEventSystemGuestConnectionClosed
     * @type {Integer (Int32)}
     */
    static SystemGuestConnectionClosed => 6

    /**
     * Native name: HcsEventProcessExited
     * @type {Integer (Int32)}
     */
    static ProcessExited => 65536

    /**
     * Native name: HcsEventOperationCallback
     * @type {Integer (Int32)}
     */
    static OperationCallback => 16777216

    /**
     * Native name: HcsEventServiceDisconnect
     * @type {Integer (Int32)}
     */
    static ServiceDisconnect => 33554432

    /**
     * Native name: HcsEventGroupVmLifecycle
     * @type {Integer (Int32)}
     */
    static GroupVmLifecycle => -2147483646

    /**
     * Native name: HcsEventGroupLiveMigration
     * @type {Integer (Int32)}
     */
    static GroupLiveMigration => -2147483645

    /**
     * Native name: HcsEventGroupOperationInfo
     * @type {Integer (Int32)}
     */
    static GroupOperationInfo => -1073741823
}
