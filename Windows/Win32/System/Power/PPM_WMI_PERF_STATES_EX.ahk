#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPM_WMI_PERF_STATE.ahk" { PPM_WMI_PERF_STATE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_WMI_PERF_STATES_EX {
    #StructPack 8

    Count : UInt32

    MaxFrequency : UInt32

    CurrentState : UInt32

    MaxPerfState : UInt32

    MinPerfState : UInt32

    LowestPerfState : UInt32

    ThermalConstraint : UInt32

    BusyAdjThreshold : Int8

    PolicyType : Int8

    Type : Int8

    Reserved : Int8

    TimerInterval : UInt32

    TargetProcessors : IntPtr

    PStateHandler : UInt32

    PStateContext : UInt32

    TStateHandler : UInt32

    TStateContext : UInt32

    FeedbackHandler : UInt32

    Reserved1 : UInt32

    Reserved2 : Int64

    State : PPM_WMI_PERF_STATE[1]

}
