#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VDS_PARTITION_INFO_MBR.ahk
#Include .\VDS_PARTITION_INFO_GPT.ahk

/**
 * This structure is reserved for system use. (VDS_PARTITION_INFORMATION_EX)
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_partition_information_ex
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
    bRewritePartition {
        get => NumGet(this, 28, "char")
        set => NumPut("char", value, this, 28)
    }

    /**
     * @type {VDS_PARTITION_INFO_MBR}
     */
    Mbr{
        get {
            if(!this.HasProp("__Mbr"))
                this.__Mbr := VDS_PARTITION_INFO_MBR(32, this)
            return this.__Mbr
        }
    }

    /**
     * @type {VDS_PARTITION_INFO_GPT}
     */
    Gpt{
        get {
            if(!this.HasProp("__Gpt"))
                this.__Gpt := VDS_PARTITION_INFO_GPT(32, this)
            return this.__Gpt
        }
    }
}
