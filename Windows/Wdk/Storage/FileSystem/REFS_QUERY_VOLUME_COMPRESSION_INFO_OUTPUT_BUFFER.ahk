#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\REFS_COMPRESSION_FORMATS.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_QUERY_VOLUME_COMPRESSION_INFO_OUTPUT_BUFFER extends Win32Struct {
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {REFS_COMPRESSION_FORMATS}
     */
    DefaultCompressionFormat {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DefaultCompressionLevel {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DefaultCompressionChunkSizeBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    VolumeClusterSizeBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    TotalVolumeClusters {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    TotalAllocatedClusters {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TotalCompressibleClustersAllocated {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TotalCompressibleClustersInUse {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TotalCompressedClusters {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 56, 6, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
