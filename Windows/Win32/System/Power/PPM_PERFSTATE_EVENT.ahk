#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_PERFSTATE_EVENT {
    #StructPack 4

    State : UInt32

    Status : UInt32

    Latency : UInt32

    Speed : UInt32

    Processor : UInt32

}
