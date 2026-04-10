#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QUERY_FILE_LAYOUT_FILTER_TYPE.ahk
#Include .\CLUSTER_RANGE.ahk
#Include .\FILE_REFERENCE_RANGE.ahk
#Include .\STORAGE_RESERVE_ID.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class QUERY_FILE_LAYOUT_INPUT extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    class _Filter_e__Union extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {CLUSTER_RANGE}
         */
        ClusterRanges {
            get {
                if(!this.HasProp("__ClusterRangesProxyArray"))
                    this.__ClusterRangesProxyArray := Win32FixedArray(this.ptr + 0, 1, CLUSTER_RANGE, "")
                return this.__ClusterRangesProxyArray
            }
        }

        /**
         * @type {FILE_REFERENCE_RANGE}
         */
        FileReferenceRanges {
            get {
                if(!this.HasProp("__FileReferenceRangesProxyArray"))
                    this.__FileReferenceRangesProxyArray := Win32FixedArray(this.ptr + 0, 1, FILE_REFERENCE_RANGE, "")
                return this.__FileReferenceRangesProxyArray
            }
        }

        /**
         * @type {Array<STORAGE_RESERVE_ID>}
         */
        StorageReserveIds {
            get {
                if(!this.HasProp("__StorageReserveIdsProxyArray"))
                    this.__StorageReserveIdsProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "int")
                return this.__StorageReserveIdsProxyArray
            }
        }
    }

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
     * @type {QUERY_FILE_LAYOUT_FILTER_TYPE}
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
     * @type {_Filter_e__Union}
     */
    Filter {
        get {
            if(!this.HasProp("__Filter"))
                this.__Filter := QUERY_FILE_LAYOUT_INPUT._Filter_e__Union(16, this)
            return this.__Filter
        }
    }
}
