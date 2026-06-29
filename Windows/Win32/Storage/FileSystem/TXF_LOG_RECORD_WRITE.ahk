#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TXF_ID.ahk" { TXF_ID }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the record for a write operation.
 * @remarks
 * If the write operation goes beyond the end of the file, the file is being extended.
 * @see https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_write
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TXF_LOG_RECORD_WRITE {
    #StructPack 8

    /**
     * The version identifier for the replication record.
     */
    Version : UInt16

    /**
     * The record type. This member is set to <b>TXF_LOG_RECORD_TYPE_WRITE</b>.
     */
    RecordType : UInt16

    /**
     * The length of this record, in bytes.
     */
    RecordLength : UInt32

    /**
     * Reserved.
     */
    Flags : UInt32

    /**
     * The TxF file identifier for the file associated with this record. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/txfw32/ns-txfw32-txf_id">TXF_ID</a>.
     */
    TxfFileId : TXF_ID

    /**
     * The KTM transaction <b>GUID</b> for this update.
     */
    KtmGuid : Guid

    /**
     * The starting location of the write operation, as an offset from the beginning of the file.
     */
    ByteOffsetInFile : Int64

    /**
     * The number of bytes written.
     */
    NumBytesWritten : UInt32

    /**
     * The offset of the data (bytes written) from the beginning of this record.
     */
    ByteOffsetInStructure : UInt32

    /**
     * The length of the file name, in bytes.
     */
    FileNameLength : UInt32

    /**
     * The offset of the file name from the beginning of this record.
     */
    FileNameByteOffsetInStructure : UInt32

}
