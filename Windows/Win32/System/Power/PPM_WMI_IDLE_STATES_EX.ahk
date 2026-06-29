#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPM_WMI_IDLE_STATE.ahk" { PPM_WMI_IDLE_STATE }

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PPM_WMI_IDLE_STATES_EX {
    #StructPack 8

    Type : UInt32

    Count : UInt32

    TargetState : UInt32

    OldState : UInt32

    TargetProcessors : IntPtr

    State : PPM_WMI_IDLE_STATE[1]

}
