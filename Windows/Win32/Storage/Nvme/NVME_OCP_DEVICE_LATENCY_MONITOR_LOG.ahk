#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LATENCY_MONITOR_FEATURE_STATUS.ahk
#Include .\ACTIVE_LATENCY_CONFIGURATION.ahk
#Include .\BUCKET_COUNTER.ahk
#Include .\LATENCY_STAMP.ahk
#Include .\MEASURED_LATENCY.ahk

/**
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_OCP_DEVICE_LATENCY_MONITOR_LOG extends Win32Struct
{
    static sizeof => 504

    static packingSize => 1

    /**
     * @type {LATENCY_MONITOR_FEATURE_STATUS}
     */
    FeatureStatus{
        get {
            if(!this.HasProp("__FeatureStatus"))
                this.__FeatureStatus := LATENCY_MONITOR_FEATURE_STATUS(this.ptr + 0)
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
                this.__ActiveLatencyConfig := ACTIVE_LATENCY_CONFIGURATION(this.ptr + 10)
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
                this.__ActiveBucketCounter0 := BUCKET_COUNTER(this.ptr + 32)
            return this.__ActiveBucketCounter0
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter1{
        get {
            if(!this.HasProp("__ActiveBucketCounter1"))
                this.__ActiveBucketCounter1 := BUCKET_COUNTER(this.ptr + 48)
            return this.__ActiveBucketCounter1
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter2{
        get {
            if(!this.HasProp("__ActiveBucketCounter2"))
                this.__ActiveBucketCounter2 := BUCKET_COUNTER(this.ptr + 64)
            return this.__ActiveBucketCounter2
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    ActiveBucketCounter3{
        get {
            if(!this.HasProp("__ActiveBucketCounter3"))
                this.__ActiveBucketCounter3 := BUCKET_COUNTER(this.ptr + 80)
            return this.__ActiveBucketCounter3
        }
    }

    /**
     * @type {LATENCY_STAMP}
     */
    ActiveLatencyStamp{
        get {
            if(!this.HasProp("__ActiveLatencyStamp"))
                this.__ActiveLatencyStamp := LATENCY_STAMP(this.ptr + 96)
            return this.__ActiveLatencyStamp
        }
    }

    /**
     * @type {MEASURED_LATENCY}
     */
    ActiveMeasuredLatency{
        get {
            if(!this.HasProp("__ActiveMeasuredLatency"))
                this.__ActiveMeasuredLatency := MEASURED_LATENCY(this.ptr + 192)
            return this.__ActiveMeasuredLatency
        }
    }

    /**
     * @type {Integer}
     */
    ActiveLatencyStampUnits {
        get => NumGet(this, 216, "ushort")
        set => NumPut("ushort", value, this, 216)
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
                this.__StaticBucketCounter0 := BUCKET_COUNTER(this.ptr + 240)
            return this.__StaticBucketCounter0
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter1{
        get {
            if(!this.HasProp("__StaticBucketCounter1"))
                this.__StaticBucketCounter1 := BUCKET_COUNTER(this.ptr + 256)
            return this.__StaticBucketCounter1
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter2{
        get {
            if(!this.HasProp("__StaticBucketCounter2"))
                this.__StaticBucketCounter2 := BUCKET_COUNTER(this.ptr + 272)
            return this.__StaticBucketCounter2
        }
    }

    /**
     * @type {BUCKET_COUNTER}
     */
    StaticBucketCounter3{
        get {
            if(!this.HasProp("__StaticBucketCounter3"))
                this.__StaticBucketCounter3 := BUCKET_COUNTER(this.ptr + 288)
            return this.__StaticBucketCounter3
        }
    }

    /**
     * @type {LATENCY_STAMP}
     */
    StaticLatencyStamp{
        get {
            if(!this.HasProp("__StaticLatencyStamp"))
                this.__StaticLatencyStamp := LATENCY_STAMP(this.ptr + 304)
            return this.__StaticLatencyStamp
        }
    }

    /**
     * @type {MEASURED_LATENCY}
     */
    StaticMeasuredLatency{
        get {
            if(!this.HasProp("__StaticMeasuredLatency"))
                this.__StaticMeasuredLatency := MEASURED_LATENCY(this.ptr + 400)
            return this.__StaticMeasuredLatency
        }
    }

    /**
     * @type {Integer}
     */
    StaticLatencyStampUnits {
        get => NumGet(this, 424, "ushort")
        set => NumPut("ushort", value, this, 424)
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
     * @type {Integer}
     */
    DebugLogTriggerEnable {
        get => NumGet(this, 448, "ushort")
        set => NumPut("ushort", value, this, 448)
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
        get => NumGet(this, 452, "uint")
        set => NumPut("uint", value, this, 452)
    }

    /**
     * @type {Integer}
     */
    DebugLogPointer {
        get => NumGet(this, 460, "ushort")
        set => NumPut("ushort", value, this, 460)
    }

    /**
     * @type {Integer}
     */
    DebugCounterTriggerSource {
        get => NumGet(this, 462, "ushort")
        set => NumPut("ushort", value, this, 462)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 464, "char")
        set => NumPut("char", value, this, 464)
    }

    /**
     * @type {Integer}
     */
    AsUchar {
        get => NumGet(this, 464, "char")
        set => NumPut("char", value, this, 464)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved4{
        get {
            if(!this.HasProp("__Reserved4ProxyArray"))
                this.__Reserved4ProxyArray := Win32FixedArray(this.ptr + 465, 29, Primitive, "char")
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
