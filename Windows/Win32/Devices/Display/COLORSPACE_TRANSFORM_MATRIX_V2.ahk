#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GAMMA_RAMP_RGB.ahk" { GAMMA_RAMP_RGB }
#Import ".\COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk" { COLORSPACE_TRANSFORM_STAGE_CONTROL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM_MATRIX_V2 {
    #StructPack 4

    StageControlLookupTable1DDegamma : COLORSPACE_TRANSFORM_STAGE_CONTROL

    LookupTable1DDegamma : GAMMA_RAMP_RGB[4096]

    StageControlColorMatrix3x3 : COLORSPACE_TRANSFORM_STAGE_CONTROL

    ColorMatrix3x3 : Float32[9]

    StageControlLookupTable1DRegamma : COLORSPACE_TRANSFORM_STAGE_CONTROL

    LookupTable1DRegamma : GAMMA_RAMP_RGB[4096]

}
