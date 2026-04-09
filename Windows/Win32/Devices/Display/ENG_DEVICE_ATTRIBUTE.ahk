#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 */
class ENG_DEVICE_ATTRIBUTE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static QDA_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static QDA_ACCELERATION_LEVEL => 1
}
