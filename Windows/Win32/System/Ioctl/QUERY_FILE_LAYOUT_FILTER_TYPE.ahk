#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class QUERY_FILE_LAYOUT_FILTER_TYPE extends Win32Enum {

    /**
     * Native name: QUERY_FILE_LAYOUT_FILTER_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: QUERY_FILE_LAYOUT_FILTER_TYPE_CLUSTERS
     * @type {Integer (Int32)}
     */
    static CLUSTERS => 1

    /**
     * Native name: QUERY_FILE_LAYOUT_FILTER_TYPE_FILEID
     * @type {Integer (Int32)}
     */
    static FILEID => 2

    /**
     * Native name: QUERY_FILE_LAYOUT_FILTER_TYPE_STORAGE_RESERVE_ID
     * @type {Integer (Int32)}
     */
    static STORAGE_RESERVE_ID => 3

    /**
     * Native name: QUERY_FILE_LAYOUT_NUM_FILTER_TYPES
     * @type {Integer (Int32)}
     */
    static NUM_FILTER_TYPES => 4
}
