#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class USER_OBJECT_INFORMATION_INDEX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UOI_FLAGS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UOI_HEAPSIZE => 5

    /**
     * @type {Integer (Int32)}
     */
    static UOI_IO => 6

    /**
     * @type {Integer (Int32)}
     */
    static UOI_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static UOI_TYPE => 3

    /**
     * @type {Integer (Int32)}
     */
    static UOI_USER_SID => 4
}
