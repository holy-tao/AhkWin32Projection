#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TXF_LOG_RECORD_TYPE extends Win32Enum {

    /**
     * Native name: TXF_LOG_RECORD_TYPE_AFFECTED_FILE
     * @type {Integer (UInt16)}
     */
    static AFFECTED_FILE => 4

    /**
     * Native name: TXF_LOG_RECORD_TYPE_TRUNCATE
     * @type {Integer (UInt16)}
     */
    static TRUNCATE => 2

    /**
     * Native name: TXF_LOG_RECORD_TYPE_WRITE
     * @type {Integer (UInt16)}
     */
    static WRITE => 1
}
