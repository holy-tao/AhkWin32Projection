#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TXF_LOG_RECORD_TYPE.ahk" { TXF_LOG_RECORD_TYPE }

/**
 * Contains the basic record information.
 * @see https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_base
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TXF_LOG_RECORD_BASE {
    #StructPack 4

    /**
     * The version identifier for the replication record.
     */
    Version : UInt16

    RecordType : TXF_LOG_RECORD_TYPE

    /**
     * The length of this record, in bytes.
     */
    RecordLength : UInt32

}
