#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class REFS_VOLUME_DATA_BUFFER extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    BytesPerPhysicalSector {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    VolumeSerialNumber {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumberSectors {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    TotalClusters {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    FreeClusters {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    TotalReserved {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    BytesPerSector {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    BytesPerCluster {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    MaximumSizeOfResidentFile {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    FastTierDataFillRatio {
        get => NumGet(this, 72, "ushort")
        set => NumPut("ushort", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    SlowTierDataFillRatio {
        get => NumGet(this, 74, "ushort")
        set => NumPut("ushort", value, this, 74)
    }

    /**
     * @type {Integer}
     */
    DestagesFastTierToSlowTierRate {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    MetadataChecksumType {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 82, 1, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Array<Int64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 88, 8, Primitive, "int64")
            return this.__ReservedProxyArray
        }
    }
}
