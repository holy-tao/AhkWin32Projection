#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GAMMA_RAMP_RGB.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GAMMA_RAMP_DXGI_1 extends Win32Struct
{
    static sizeof => 8232

    static packingSize => 8

    /**
     * @type {GAMMA_RAMP_RGB}
     */
    Scale{
        get {
            if(!this.HasProp("__Scale"))
                this.__Scale := GAMMA_RAMP_RGB(this.ptr + 0)
            return this.__Scale
        }
    }

    /**
     * @type {GAMMA_RAMP_RGB}
     */
    Offset{
        get {
            if(!this.HasProp("__Offset"))
                this.__Offset := GAMMA_RAMP_RGB(this.ptr + 16)
            return this.__Offset
        }
    }

    /**
     * @type {Array<GAMMA_RAMP_RGB>}
     */
    GammaCurve{
        get {
            if(!this.HasProp("__GammaCurveProxyArray"))
                this.__GammaCurveProxyArray := Win32FixedArray(this.ptr + 32, 1025, GAMMA_RAMP_RGB, "")
            return this.__GammaCurveProxyArray
        }
    }
}
