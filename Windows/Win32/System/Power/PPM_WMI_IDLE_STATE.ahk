#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_WMI_IDLE_STATE {
    #StructPack 4

    Latency : UInt32

    Power : UInt32

    TimeCheck : UInt32

    PromotePercent : Int8

    DemotePercent : Int8

    StateType : Int8

    Reserved : Int8

    StateFlags : UInt32

    Context : UInt32

    IdleHandler : UInt32

    Reserved1 : UInt32

}
