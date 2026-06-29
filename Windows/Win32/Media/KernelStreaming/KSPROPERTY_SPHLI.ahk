#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KS_COLCON.ahk" { KS_COLCON }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_SPHLI {
    #StructPack 4

    HLISS : UInt16

    Reserved : UInt16

    StartPTM : UInt32

    EndPTM : UInt32

    StartX : UInt16

    StartY : UInt16

    StopX : UInt16

    StopY : UInt16

    ColCon : KS_COLCON

}
