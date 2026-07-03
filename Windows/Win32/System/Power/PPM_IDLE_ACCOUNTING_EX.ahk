#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPM_IDLE_STATE_ACCOUNTING_EX.ahk" { PPM_IDLE_STATE_ACCOUNTING_EX }
#Import ".\PPM_IDLE_STATE_BUCKET_EX.ahk" { PPM_IDLE_STATE_BUCKET_EX }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_IDLE_ACCOUNTING_EX {
    #StructPack 8

    StateCount : UInt32

    TotalTransitions : UInt32

    ResetCount : UInt32

    AbortCount : UInt32

    StartTime : Int64

    State : PPM_IDLE_STATE_ACCOUNTING_EX[1]

}
