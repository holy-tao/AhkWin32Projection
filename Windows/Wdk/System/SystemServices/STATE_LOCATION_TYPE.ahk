#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class STATE_LOCATION_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static LocationTypeRegistry => 0

    /**
     * @type {Integer (Int32)}
     */
    static LocationTypeFileSystem => 1

    /**
     * @type {Integer (Int32)}
     */
    static LocationTypeMaximum => 2
}
