#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_TEXT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DeviceTextDescription => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceTextLocationInformation => 1
}
