#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
class HCS_NOTIFICATION_FLAGS extends Win32Enum {

    /**
     * Native name: HcsNotificationFlagSuccess
     * @type {Integer (Int32)}
     */
    static FlagSuccess => 0

    /**
     * Native name: HcsNotificationFlagFailure
     * @type {Integer (Int32)}
     */
    static FlagFailure => -2147483648
}
