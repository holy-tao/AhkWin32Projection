#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DEVICE_DIRECTORY_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DeviceDirectoryData => 0
}
