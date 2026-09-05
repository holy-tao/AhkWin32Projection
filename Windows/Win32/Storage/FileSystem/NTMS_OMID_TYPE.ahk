#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NTMS_OMID_TYPE extends Win32Enum {

    /**
     * Native name: NTMS_OMID_TYPE_FILESYSTEM_INFO
     * @type {Integer (UInt32)}
     */
    static FILESYSTEM_INFO => 2

    /**
     * Native name: NTMS_OMID_TYPE_RAW_LABEL
     * @type {Integer (UInt32)}
     */
    static RAW_LABEL => 1
}
