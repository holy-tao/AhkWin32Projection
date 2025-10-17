#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BACKLIGHT_REDUCTION_GAMMA_RAMP.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class PANEL_GET_BACKLIGHT_REDUCTION extends Win32Struct
{
    static sizeof => 1544

    static packingSize => 8

    /**
     * @type {Integer}
     */
    BacklightUsersetting {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    BacklightEffective {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {BACKLIGHT_REDUCTION_GAMMA_RAMP}
     */
    GammaRamp{
        get {
            if(!this.HasProp("__GammaRamp"))
                this.__GammaRamp := BACKLIGHT_REDUCTION_GAMMA_RAMP(8, this)
            return this.__GammaRamp
        }
    }
}
