#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GAMMA_RAMP_RGB.ahk" { GAMMA_RAMP_RGB }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GAMMA_RAMP_DXGI_1 {
    #StructPack 4

    Scale : GAMMA_RAMP_RGB

    Offset : GAMMA_RAMP_RGB

    GammaCurve : GAMMA_RAMP_RGB[1025]

}
