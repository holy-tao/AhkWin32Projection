#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class STATE_LOCATION_TYPE extends Win32Enum {

    /**
     * Native name: LocationTypeRegistry
     * @type {Integer (Int32)}
     */
    static Registry => 0

    /**
     * Native name: LocationTypeFileSystem
     * @type {Integer (Int32)}
     */
    static FileSystem => 1

    /**
     * Native name: LocationTypeMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 2
}
