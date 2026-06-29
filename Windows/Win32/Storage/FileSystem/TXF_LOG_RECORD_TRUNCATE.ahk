#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TXF_ID.ahk

/**
 * Contains the record for a truncate operation.
 * @see https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_truncate
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TXF_LOG_RECORD_TRUNCATE extends Win32Struct {
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
     * The record type. This member is set to TXF_LOG_RECORD_TYPE_TRUNCATE.
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
    TxfFileId {
        get {
            if(!this.HasProp("__TxfFileId"))
                this.__TxfFileId := TXF_ID(16, this)
            return this.__TxfFileId
        }
    }

    /**
     * The KTM transaction GUID for this update.
     * @type {Guid}
     */
    KtmGuid {
        get {
            if(!this.HasProp("__KtmGuid"))
                this.__KtmGuid := Guid(32, this)
            return this.__KtmGuid
        }
    }

    /**
     * The new size of the file, in bytes.
     * @type {Integer}
     */
    NewFileSize {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
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
