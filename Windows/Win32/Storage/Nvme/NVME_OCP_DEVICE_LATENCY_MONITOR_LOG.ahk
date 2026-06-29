#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BUCKET_COUNTER.ahk" { BUCKET_COUNTER }
#Import ".\LATENCY_MONITOR_FEATURE_STATUS.ahk" { LATENCY_MONITOR_FEATURE_STATUS }
#Import ".\DEBUG_BIT_FIELD.ahk" { DEBUG_BIT_FIELD }
#Import ".\LATENCY_STAMP_UNITS.ahk" { LATENCY_STAMP_UNITS }
#Import ".\MEASURED_LATENCY.ahk" { MEASURED_LATENCY }
#Import ".\LATENCY_STAMP.ahk" { LATENCY_STAMP }
#Import ".\ACTIVE_LATENCY_CONFIGURATION.ahk" { ACTIVE_LATENCY_CONFIGURATION }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVME_OCP_DEVICE_LATENCY_MONITOR_LOG {
    #StructPack 8


    struct _DebugLogStampUnits {
        /**
         * This bitfield backs the following members:
         * - BasedOnTimestamp
         * - Reserved
         */
        _bitfield : Int8


        /**
         * @type {Integer}
         */
        BasedOnTimestamp {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
        static __New() {
            DefineProp(this.Prototype, 'AsUchar', { type: Int8, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    FeatureStatus : LATENCY_MONITOR_FEATURE_STATUS

    Reserved0 : Int8

    ActiveBucketTimer : UInt16

    ActiveBucketTimerThreshold : UInt16

    ActiveThresholdA : Int8

    ActiveThresholdB : Int8

    ActiveThresholdC : Int8

    ActiveThresholdD : Int8

    ActiveLatencyConfig : ACTIVE_LATENCY_CONFIGURATION

    ActiveLatencyMinimumWindow : Int8

    Reserved1 : Int8[19]

    ActiveBucketCounter0 : BUCKET_COUNTER

    ActiveBucketCounter1 : BUCKET_COUNTER

    ActiveBucketCounter2 : BUCKET_COUNTER

    ActiveBucketCounter3 : BUCKET_COUNTER

    ActiveLatencyStamp : LATENCY_STAMP

    ActiveMeasuredLatency : MEASURED_LATENCY

    ActiveLatencyStampUnits : LATENCY_STAMP_UNITS

    Reserved2 : Int8[22]

    StaticBucketCounter0 : BUCKET_COUNTER

    StaticBucketCounter1 : BUCKET_COUNTER

    StaticBucketCounter2 : BUCKET_COUNTER

    StaticBucketCounter3 : BUCKET_COUNTER

    StaticLatencyStamp : LATENCY_STAMP

    StaticMeasuredLatency : MEASURED_LATENCY

    StaticLatencyStampUnits : LATENCY_STAMP_UNITS

    Reserved3 : Int8[22]

    DebugLogTriggerEnable : DEBUG_BIT_FIELD

    DebugLogMeasuredLatency : UInt16

    DebugLogLatencyStamp : Int64

    DebugLogPointer : UInt16

    DebugCounterTriggerSource : DEBUG_BIT_FIELD

    DebugLogStampUnits : NVME_OCP_DEVICE_LATENCY_MONITOR_LOG._DebugLogStampUnits

    Reserved4 : Int8[29]

    LogPageVersionNumber : UInt16

    LogPageGUID : Guid

}
