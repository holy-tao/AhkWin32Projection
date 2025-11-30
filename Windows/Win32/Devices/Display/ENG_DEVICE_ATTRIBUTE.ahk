#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class ENG_DEVICE_ATTRIBUTE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QDA_RESERVED => 0

    /**
     * @type {Integer (Int32)}
     */
    static QDA_ACCELERATION_LEVEL => 1
}
