#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSPROPERTY_BOUNDS_LONG.ahk" { KSPROPERTY_BOUNDS_LONG }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_STEPPING_LONG {
    #StructPack 4

    SteppingDelta : UInt32

    Reserved : UInt32

    Bounds : KSPROPERTY_BOUNDS_LONG

}
