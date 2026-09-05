#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class BATTERY_TYPE extends Win32Enum {

    /**
     * Native name: BATTERY_TYPE_DISCONNECTED
     * @type {Integer (Byte)}
     */
    static DISCONNECTED => 0x00

    /**
     * Native name: BATTERY_TYPE_WIRED
     * @type {Integer (Byte)}
     */
    static WIRED => 0x01

    /**
     * Native name: BATTERY_TYPE_ALKALINE
     * @type {Integer (Byte)}
     */
    static ALKALINE => 0x02

    /**
     * Native name: BATTERY_TYPE_NIMH
     * @type {Integer (Byte)}
     */
    static NIMH => 0x03

    /**
     * Native name: BATTERY_TYPE_UNKNOWN
     * @type {Integer (Byte)}
     */
    static UNKNOWN => 0xFF
}
