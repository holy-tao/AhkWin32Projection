#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_EVENT_SUBTYPE extends Win32Enum {

    /**
     * Native name: CxlDeviceEventSubtype_NotReported
     * @type {Integer (Int32)}
     */
    static NotReported => 0

    /**
     * Native name: CxlDeviceEventSubtype_InvalidConfigurationData
     * @type {Integer (Int32)}
     */
    static InvalidConfigurationData => 1

    /**
     * Native name: CxlDeviceEventSubtype_UnsupportedConfigurationData
     * @type {Integer (Int32)}
     */
    static UnsupportedConfigurationData => 2

    /**
     * Native name: CxlDeviceEventSubtype_UnsuportedMemoryMediaFru
     * @type {Integer (Int32)}
     */
    static UnsuportedMemoryMediaFru => 3
}
