#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the identifiers that identify the log file metadata properties of a channel or log file.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_log_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_LOG_PROPERTY_ID{

    /**
     * Identifies the property that contains the time that the channel or log file was created. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogCreationTime => 0

    /**
     * Identifies the property that contains the last time that the channel or log file was accessed. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogLastAccessTime => 1

    /**
     * Identifies the property that contains the last time that the channel or log file was written to. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogLastWriteTime => 2

    /**
     * Identifies the property that contains the size of the file, in bytes. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogFileSize => 3

    /**
     * Identifies the property that contains the file attributes (for details on the file attributes, see the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesexa">GetFileAttributesEx</a> function). The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogAttributes => 4

    /**
     * Identifies the property that contains the number of records in the channel or log file. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogNumberOfLogRecords => 5

    /**
     * Identifies the property that contains the record number of the oldest event in the channel or log file. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtLogOldestRecordNumber => 6

    /**
     * Identifies the property that you use to determine whether the channel or log file is full. The variant type for this property is <b>EvtVarTypeBoolean</b>. The channel is full if another event cannot be written to the channel (for example, if the channel is sequential and maximum size is reached). The property will always be false if the channel is circular or the sequential log is automatically backed up.
     * @type {Integer (Int32)}
     */
    static EvtLogFull => 7
}
