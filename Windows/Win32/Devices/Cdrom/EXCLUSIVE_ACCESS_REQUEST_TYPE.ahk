#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class EXCLUSIVE_ACCESS_REQUEST_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ExclusiveAccessQueryState => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExclusiveAccessLockDevice => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExclusiveAccessUnlockDevice => 2
}
