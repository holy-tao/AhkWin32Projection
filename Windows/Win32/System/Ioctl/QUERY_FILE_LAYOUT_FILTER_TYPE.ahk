#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class QUERY_FILE_LAYOUT_FILTER_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_CLUSTERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_FILEID => 2

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_FILTER_TYPE_STORAGE_RESERVE_ID => 3

    /**
     * @type {Integer (Int32)}
     */
    static QUERY_FILE_LAYOUT_NUM_FILTER_TYPES => 4
}
