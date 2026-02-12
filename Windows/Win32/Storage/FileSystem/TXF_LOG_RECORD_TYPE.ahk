#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The record is a <a href="https://docs.microsoft.com/windows/desktop/api/txfw32/ns-txfw32-txf_log_record_affected_file">TXF_LOG_RECORD_AFFECTED_FILE</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/txfw32/ns-txfw32-txf_log_record_base
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
