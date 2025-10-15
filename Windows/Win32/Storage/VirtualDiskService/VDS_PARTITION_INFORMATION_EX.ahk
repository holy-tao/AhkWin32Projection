#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\VDS_PARTITION_INFO_MBR.ahk
#Include .\VDS_PARTITION_INFO_GPT.ahk

/**
 * This structure is reserved for system use.
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_partition_information_ex
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_PARTITION_INFORMATION_EX extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwPartitionStyle {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ullStartingOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ullPartitionLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwPartitionNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {BOOLEAN}
     */
    bRewritePartition{
        get {
            if(!this.HasProp("__bRewritePartition"))
                this.__bRewritePartition := BOOLEAN(this.ptr + 28)
            return this.__bRewritePartition
        }
    }

    /**
     * @type {VDS_PARTITION_INFO_MBR}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := VDS_PARTITION_INFO_MBR(this.ptr + 32)
            return this.__Mbr
        }
    }

    /**
     * @type {VDS_PARTITION_INFO_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := VDS_PARTITION_INFO_GPT(this.ptr + 32)
            return this.__Gpt
        }
    }
}
