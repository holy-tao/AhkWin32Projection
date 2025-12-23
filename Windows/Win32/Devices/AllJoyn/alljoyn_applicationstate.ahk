#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_applicationstate extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NOT_CLAIMABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLAIMABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLAIMED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NEED_UPDATE => 3
}
