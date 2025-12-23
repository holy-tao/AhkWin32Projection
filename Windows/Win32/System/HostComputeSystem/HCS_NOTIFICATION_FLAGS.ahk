#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 * @version v4.0.30319
 */
class HCS_NOTIFICATION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationFlagSuccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationFlagFailure => -2147483648
}
