#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
class EXCLUSIVE_ACCESS_REQUEST_TYPE extends Win32Enum {

    /**
     * Native name: ExclusiveAccessQueryState
     * @type {Integer (Int32)}
     */
    static QueryState => 0

    /**
     * Native name: ExclusiveAccessLockDevice
     * @type {Integer (Int32)}
     */
    static LockDevice => 1

    /**
     * Native name: ExclusiveAccessUnlockDevice
     * @type {Integer (Int32)}
     */
    static UnlockDevice => 2
}
