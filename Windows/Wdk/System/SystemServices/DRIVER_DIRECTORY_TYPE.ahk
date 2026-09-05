#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class DRIVER_DIRECTORY_TYPE extends Win32Enum {

    /**
     * Native name: DriverDirectoryImage
     * @type {Integer (Int32)}
     */
    static Image => 0

    /**
     * Native name: DriverDirectoryData
     * @type {Integer (Int32)}
     */
    static Data => 1

    /**
     * Native name: DriverDirectorySharedData
     * @type {Integer (Int32)}
     */
    static SharedData => 2
}
