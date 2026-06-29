#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BACKLIGHT_REDUCTION_GAMMA_RAMP.ahk" { BACKLIGHT_REDUCTION_GAMMA_RAMP }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PANEL_GET_BACKLIGHT_REDUCTION {
    #StructPack 2

    BacklightUsersetting : UInt16

    BacklightEffective : UInt16

    GammaRamp : BACKLIGHT_REDUCTION_GAMMA_RAMP

}
