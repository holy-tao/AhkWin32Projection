#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class IO_QUERY_DEVICE_DATA_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceIdentifier => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceConfigurationData => 1

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceComponentInformation => 2

    /**
     * @type {Integer (Int32)}
     */
    static IoQueryDeviceMaxData => 3
}
