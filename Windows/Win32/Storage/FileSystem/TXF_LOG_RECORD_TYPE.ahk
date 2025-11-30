#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TXF_LOG_RECORD_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_AFFECTED_FILE => 4

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_TRUNCATE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static TXF_LOG_RECORD_TYPE_WRITE => 1
}
