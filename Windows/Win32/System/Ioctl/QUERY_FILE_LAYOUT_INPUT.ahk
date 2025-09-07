#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSTER_RANGE.ahk
#Include .\FILE_REFERENCE_RANGE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class QUERY_FILE_LAYOUT_INPUT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    FilterEntryCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfPairs {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    FilterType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<CLUSTER_RANGE>}
     */
    ClusterRanges{
        get {
            if(!this.HasProp("__ClusterRangesProxyArray"))
                this.__ClusterRangesProxyArray := Win32FixedArray(this.ptr + 16, 8, CLUSTER_RANGE, "")
            return this.__ClusterRangesProxyArray
        }
    }

    /**
     * @type {Array<FILE_REFERENCE_RANGE>}
     */
    FileReferenceRanges{
        get {
            if(!this.HasProp("__FileReferenceRangesProxyArray"))
                this.__FileReferenceRangesProxyArray := Win32FixedArray(this.ptr + 16, 8, FILE_REFERENCE_RANGE, "")
            return this.__FileReferenceRangesProxyArray
        }
    }

    /**
     * @type {Array<Int32>}
     */
    StorageReserveIds{
        get {
            if(!this.HasProp("__StorageReserveIdsProxyArray"))
                this.__StorageReserveIdsProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "int")
            return this.__StorageReserveIdsProxyArray
        }
    }
}
