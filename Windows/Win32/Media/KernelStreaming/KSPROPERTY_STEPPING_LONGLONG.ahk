#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\KSPROPERTY_BOUNDS_LONGLONG.ahk" { KSPROPERTY_BOUNDS_LONGLONG }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_STEPPING_LONGLONG {
    #StructPack 8

    SteppingDelta : Int64

    Bounds : KSPROPERTY_BOUNDS_LONGLONG

}
