#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the identifiers that identify the log file metadata properties of a channel or log file.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_log_property_id
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_LOG_PROPERTY_ID extends Win32Enum {

    /**
     * Identifies the property that contains the time that the channel or log file was created. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * Native name: EvtLogCreationTime
     * @type {Integer (Int32)}
     */
    static CreationTime => 0

    /**
     * Identifies the property that contains the last time that the channel or log file was accessed. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * Native name: EvtLogLastAccessTime
     * @type {Integer (Int32)}
     */
    static LastAccessTime => 1

    /**
     * Identifies the property that contains the last time that the channel or log file was written to. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * Native name: EvtLogLastWriteTime
     * @type {Integer (Int32)}
     */
    static LastWriteTime => 2

    /**
     * Identifies the property that contains the size of the file, in bytes. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * Native name: EvtLogFileSize
     * @type {Integer (Int32)}
     */
    static FileSize => 3

    /**
     * Identifies the property that contains the file attributes (for details on the file attributes, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesexa">GetFileAttributesEx</a> function). The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EvtLogAttributes
     * @type {Integer (Int32)}
     */
    static Attributes => 4

    /**
     * Identifies the property that contains the number of records in the channel or log file. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * Native name: EvtLogNumberOfLogRecords
     * @type {Integer (Int32)}
     */
    static NumberOfLogRecords => 5

    /**
     * Identifies the property that contains the record number of the oldest event in the channel or log file. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * Native name: EvtLogOldestRecordNumber
     * @type {Integer (Int32)}
     */
    static OldestRecordNumber => 6

    /**
     * Identifies the property that you use to determine whether the channel or log file is full. The variant type for this property is <b>EvtVarTypeBoolean</b>. The channel is full if another event cannot be written to the channel (for example, if the channel is sequential and maximum size is reached). The property will always be false if the channel is circular or the sequential log is automatically backed up.
     * Native name: EvtLogFull
     * @type {Integer (Int32)}
     */
    static Full => 7
}
