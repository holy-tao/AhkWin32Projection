#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LATENCY_MONITOR_FEATURE_STATUS.ahk
#Include .\ACTIVE_LATENCY_CONFIGURATION.ahk
#Include .\BUCKET_COUNTER.ahk
#Include .\LATENCY_STAMP.ahk
#Include .\MEASURED_LATENCY.ahk
#Include .\LATENCY_STAMP_UNITS.ahk
#Include .\DEBUG_BIT_FIELD.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_OCP_DEVICE_LATENCY_MONITOR_LOG extends Win32Struct
{
    static sizeof => 512

    static packingSize => 8

    /**
     * @type {LATENCY_MONITOR_FEATURE_STATUS}
     */
    FeatureStatus{
        get {
            if(!this.HasProp("__FeatureStatus"))
                this.__FeatureStatus := LATENCY_MONITOR_FEATURE_STATUS(0, this)
            return this.__FeatureStatus
        }
    }

    /**
     * @type {Integer}
     */
    Reserved0 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    ActiveBucketTimer {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    ActiveBucketTimerThreshold {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ActiveThresholdA {
        get => NumGet(this, 6, "char")
        set => NumPut("char", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    ActiveThresholdB {
        get => NumGet(this, 7, "char")
        set => NumPut("char", value, this, 7)
    }

    /**
     * @type {Integer}
     */
    ActiveThresholdC {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ActiveThresholdD {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {ACTIVE_LATENCY_CONFIGURATION}
     */
    ActiveLatencyConfig{
        get {
            if(!this.HasProp("__ActiveLatencyConfig"))
                this.__ActiveLatencyConfig := ACTIVE_LATENCY_CONFIGURATION(10, this)
            return this.__ActiveLatencyConfig
        }
    }

    /**
     * @type {Integer}
     */
    ActiveLatencyMinimumWindow {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 13, 19, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter0{
        get {
            if(!this.HasProp("__ActiveBucketCounter0"))
                this.__ActiveBucketCounter0 := BUCKET_COUNTER(32, this)
            return this.__ActiveBucketCounter0
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter1{
        get {
            if(!this.HasProp("__ActiveBucketCounter1"))
                this.__ActiveBucketCounter1 := BUCKET_COUNTER(48, this)
            return this.__ActiveBucketCounter1
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter2{
        get {
            if(!this.HasProp("__ActiveBucketCounter2"))
                this.__ActiveBucketCounter2 := BUCKET_COUNTER(64, this)
            return this.__ActiveBucketCounter2
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter3{
        get {
            if(!this.HasProp("__ActiveBucketCounter3"))
                this.__ActiveBucketCounter3 := BUCKET_COUNTER(80, this)
            return this.__ActiveBucketCounter3
        }
    }

    /**
     * @type {LATENCY_STAMP}
     */
    ActiveLatencyStamp{
        get {
            if(!this.HasProp("__ActiveLatencyStamp"))
                this.__ActiveLatencyStamp := LATENCY_STAMP(96, this)
            return this.__ActiveLatencyStamp
        }
    }

    /**
     * @type {MEASURED_LATENCY}
     */
    ActiveMeasuredLatency{
        get {
            if(!this.HasProp("__ActiveMeasuredLatency"))
                this.__ActiveMeasuredLatency := MEASURED_LATENCY(192, this)
            return this.__ActiveMeasuredLatency
        }
    }

    /**
     * @type {LATENCY_STAMP_UNITS}
     */
    ActiveLatencyStampUnits{
        get {
            if(!this.HasProp("__ActiveLatencyStampUnits"))
                this.__ActiveLatencyStampUnits := LATENCY_STAMP_UNITS(216, this)
            return this.__ActiveLatencyStampUnits
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved2{
        get {
            if(!this.HasProp("__Reserved2ProxyArray"))
                this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 218, 22, Primitive, "char")
            return this.__Reserved2ProxyArray
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter0{
        get {
            if(!this.HasProp("__StaticBucketCounter0"))
                this.__StaticBucketCounter0 := BUCKET_COUNTER(240, this)
            return this.__StaticBucketCounter0
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter1{
        get {
            if(!this.HasProp("__StaticBucketCounter1"))
                this.__StaticBucketCounter1 := BUCKET_COUNTER(256, this)
            return this.__StaticBucketCounter1
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter2{
        get {
            if(!this.HasProp("__StaticBucketCounter2"))
                this.__StaticBucketCounter2 := BUCKET_COUNTER(272, this)
            return this.__StaticBucketCounter2
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter3{
        get {
            if(!this.HasProp("__StaticBucketCounter3"))
                this.__StaticBucketCounter3 := BUCKET_COUNTER(288, this)
            return this.__StaticBucketCounter3
        }
    }

    /**
     * @type {LATENCY_STAMP}
     */
    StaticLatencyStamp{
        get {
            if(!this.HasProp("__StaticLatencyStamp"))
                this.__StaticLatencyStamp := LATENCY_STAMP(304, this)
            return this.__StaticLatencyStamp
        }
    }

    /**
     * @type {MEASURED_LATENCY}
     */
    StaticMeasuredLatency{
        get {
            if(!this.HasProp("__StaticMeasuredLatency"))
                this.__StaticMeasuredLatency := MEASURED_LATENCY(400, this)
            return this.__StaticMeasuredLatency
        }
    }

    /**
     * @type {LATENCY_STAMP_UNITS}
     */
    StaticLatencyStampUnits{
        get {
            if(!this.HasProp("__StaticLatencyStampUnits"))
                this.__StaticLatencyStampUnits := LATENCY_STAMP_UNITS(424, this)
            return this.__StaticLatencyStampUnits
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 426, 22, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {DEBUG_BIT_FIELD}
     */
    DebugLogTriggerEnable{
        get {
            if(!this.HasProp("__DebugLogTriggerEnable"))
                this.__DebugLogTriggerEnable := DEBUG_BIT_FIELD(448, this)
            return this.__DebugLogTriggerEnable
        }
    }

    /**
     * @type {Integer}
     */
    DebugLogMeasuredLatency {
        get => NumGet(this, 450, "ushort")
        set => NumPut("ushort", value, this, 450)
    }

    /**
     * @type {Integer}
     */
    DebugLogLatencyStamp {
        get => NumGet(this, 456, "uint")
        set => NumPut("uint", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    DebugLogPointer {
        get => NumGet(this, 464, "ushort")
        set => NumPut("ushort", value, this, 464)
    }

    /**
     * @type {DEBUG_BIT_FIELD}
     */
    DebugCounterTriggerSource{
        get {
            if(!this.HasProp("__DebugCounterTriggerSource"))
                this.__DebugCounterTriggerSource := DEBUG_BIT_FIELD(466, this)
            return this.__DebugCounterTriggerSource
        }
    }

    /**
     * This bitfield backs the following members:
     * - BasedOnTimestamp
     * - Reserved
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 468, "char")
        set => NumPut("char", value, this, 468)
    }

    /**
     * @type {Integer}
     */
    BasedOnTimestamp {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 468, "char")
        set => NumPut("char", value, this, 468)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 469, 29, Primitive, "char")
            return this.__Reserved4ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    LogPageVersionNumber {
        get => NumGet(this, 498, "ushort")
        set => NumPut("ushort", value, this, 498)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LogPageGUID {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }
}
