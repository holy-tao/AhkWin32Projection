#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class RAW_INPUT_DEVICE_INFO_COMMAND extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RIDI_PREPARSEDDATA => 536870917

    /**
     * @type {Integer (UInt32)}
     */
    static RIDI_DEVICENAME => 536870919

    /**
     * @type {Integer (UInt32)}
     */
    static RIDI_DEVICEINFO => 536870923
}
