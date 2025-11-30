#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Integrated => 0

    /**
     * @type {Integer (Int32)}
     */
    static External => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceHost => 2
}
