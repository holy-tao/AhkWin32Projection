#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class IO_QUERY_DEVICE_DATA_FORMAT extends Win32Enum {

    /**
     * Native name: IoQueryDeviceIdentifier
     * @type {Integer (Int32)}
     */
    static Identifier => 0

    /**
     * Native name: IoQueryDeviceConfigurationData
     * @type {Integer (Int32)}
     */
    static ConfigurationData => 1

    /**
     * Native name: IoQueryDeviceComponentInformation
     * @type {Integer (Int32)}
     */
    static ComponentInformation => 2

    /**
     * Native name: IoQueryDeviceMaxData
     * @type {Integer (Int32)}
     */
    static MaxData => 3
}
