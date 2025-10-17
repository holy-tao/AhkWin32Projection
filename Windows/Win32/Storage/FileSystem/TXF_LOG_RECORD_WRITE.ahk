#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TXF_ID.ahk

/**
 * Contains the record for a write operation.
 * @remarks
 * 
  * If the write operation goes beyond the end of the file, the file is being extended.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//txfw32/ns-txfw32-txf_log_record_write
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TXF_LOG_RECORD_WRITE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The version identifier for the replication record.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The record type. This member is set to <b>TXF_LOG_RECORD_TYPE_WRITE</b>.
     * @type {Integer}
     */
    RecordType {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The length of this record, in bytes.
     * @type {Integer}
     */
    RecordLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The TxF file identifier for the file associated with this record. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/txfw32/ns-txfw32-txf_id">TXF_ID</a>.
     * @type {TXF_ID}
     */
    TxfFileId{
        get {
            if(!this.HasProp("__TxfFileId"))
                this.__TxfFileId := TXF_ID(16, this)
            return this.__TxfFileId
        }
    }

    /**
     * The KTM transaction <b>GUID</b> for this update.
     * @type {Pointer<Guid>}
     */
    KtmGuid {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The starting location of the write operation, as an offset from the beginning of the file.
     * @type {Integer}
     */
    ByteOffsetInFile {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The number of bytes written.
     * @type {Integer}
     */
    NumBytesWritten {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The offset of the data (bytes written) from the beginning of this record.
     * @type {Integer}
     */
    ByteOffsetInStructure {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The length of the file name, in bytes.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The offset of the file name from the beginning of this record.
     * @type {Integer}
     */
    FileNameByteOffsetInStructure {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
