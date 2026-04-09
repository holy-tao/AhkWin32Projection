#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
class alljoyn_about_announceflag extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UNANNOUNCED => 0

    /**
     * @type {Integer (Int32)}
     */
    static ANNOUNCED => 1
}
