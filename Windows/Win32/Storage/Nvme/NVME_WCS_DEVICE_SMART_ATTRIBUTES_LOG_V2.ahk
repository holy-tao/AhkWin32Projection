#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_WCS_DEVICE_SMART_ATTRIBUTES_LOG_V2 extends Win32Struct
{
    static sizeof => 504

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    MediaUnitsWritten{
        get {
            if(!this.HasProp("__MediaUnitsWrittenProxyArray"))
                this.__MediaUnitsWrittenProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__MediaUnitsWrittenProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    MediaUnitsRead{
        get {
            if(!this.HasProp("__MediaUnitsReadProxyArray"))
                this.__MediaUnitsReadProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__MediaUnitsReadProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    RawCount{
        get {
            if(!this.HasProp("__RawCountProxyArray"))
                this.__RawCountProxyArray := Win32FixedArray(this.ptr + 32, 6, Primitive, "char")
            return this.__RawCountProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Normalized{
        get {
            if(!this.HasProp("__NormalizedProxyArray"))
                this.__NormalizedProxyArray := Win32FixedArray(this.ptr + 38, 2, Primitive, "char")
            return this.__NormalizedProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    XORRecoveryCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    UnrecoverableReadErrorCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SoftECCErrorCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    DetectedCounts {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CorrectedCounts {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    PercentageSystemDataUsed {
        get => NumGet(this, 80, "char")
        set => NumPut("char", value, this, 80)
    }

    /**
     * @type {Array<Byte>}
     */
    RefreshCount{
        get {
            if(!this.HasProp("__RefreshCountProxyArray"))
                this.__RefreshCountProxyArray := Win32FixedArray(this.ptr + 81, 7, Primitive, "char")
            return this.__RefreshCountProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    MaximumCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    MinimumCount {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    EventCount {
        get => NumGet(this, 96, "char")
        set => NumPut("char", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 97, "char")
        set => NumPut("char", value, this, 97)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 98, 6, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    PCIeCorrectableErrorCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    IncompleteShutdownCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    PercentageFreeBlocks {
        get => NumGet(this, 120, "char")
        set => NumPut("char", value, this, 120)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 121, 7, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    CapacitorHealth {
        get => NumGet(this, 128, "ushort")
        set => NumPut("ushort", value, this, 128)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 130, 6, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UnalignedIOCount {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    SecurityVersionNumber {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    NUSE {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Array<Byte>}
     */
    PLPStartCount{
        get {
            if(!this.HasProp("__PLPStartCountProxyArray"))
                this.__PLPStartCountProxyArray := Win32FixedArray(this.ptr + 160, 16, Primitive, "char")
            return this.__PLPStartCountProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    EnduranceEstimate{
        get {
            if(!this.HasProp("__EnduranceEstimateProxyArray"))
                this.__EnduranceEstimateProxyArray := Win32FixedArray(this.ptr + 176, 16, Primitive, "char")
            return this.__EnduranceEstimateProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 192, 302, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 494, "ushort")
        set => NumPut("ushort", value, this, 494)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }
}
