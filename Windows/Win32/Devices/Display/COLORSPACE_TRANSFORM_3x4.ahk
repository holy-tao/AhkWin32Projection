#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GAMMA_RAMP_RGB.ahk" { GAMMA_RAMP_RGB }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_3x4 {
    #StructPack 4

    ColorMatrix3x4 : Float32[12]

    ScalarMultiplier : Float32

    LookupTable1D : GAMMA_RAMP_RGB[4096]

}
