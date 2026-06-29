#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_PERFSTATE_DOMAIN_EVENT {
    #StructPack 8

    State : UInt32

    Latency : UInt32

    Speed : UInt32

    Processors : Int64

}
