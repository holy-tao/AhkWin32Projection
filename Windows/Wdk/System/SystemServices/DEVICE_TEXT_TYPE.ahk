#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_TEXT_TYPE extends Win32Enum {

    /**
     * Native name: DeviceTextDescription
     * @type {Integer (Int32)}
     */
    static Description => 0

    /**
     * Native name: DeviceTextLocationInformation
     * @type {Integer (Int32)}
     */
    static LocationInformation => 1
}
