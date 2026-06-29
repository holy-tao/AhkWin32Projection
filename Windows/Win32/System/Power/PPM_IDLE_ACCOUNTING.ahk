#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPM_IDLE_STATE_ACCOUNTING.ahk" { PPM_IDLE_STATE_ACCOUNTING }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLE_ACCOUNTING {
    #StructPack 8

    StateCount : UInt32

    TotalTransitions : UInt32

    ResetCount : UInt32

    StartTime : Int64

    State : PPM_IDLE_STATE_ACCOUNTING[1]

}
