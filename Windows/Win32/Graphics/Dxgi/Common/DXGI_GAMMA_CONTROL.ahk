#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DXGI_RGB.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_GAMMA_CONTROL extends Win32Struct
{
    static sizeof => 8232

    static packingSize => 8

    /**
     * @type {DXGI_RGB}
     */
    Scale{
        get {
            if(!this.HasProp("__Scale"))
                this.__Scale := DXGI_RGB(this.ptr + 0)
            return this.__Scale
        }
    }

    /**
     * @type {DXGI_RGB}
     */
    Offset{
        get {
            if(!this.HasProp("__Offset"))
                this.__Offset := DXGI_RGB(this.ptr + 16)
            return this.__Offset
        }
    }

    /**
     * @type {Array<DXGI_RGB>}
     */
    GammaCurve{
        get {
            if(!this.HasProp("__GammaCurveProxyArray"))
                this.__GammaCurveProxyArray := Win32FixedArray(this.ptr + 32, 1025, DXGI_RGB, "")
            return this.__GammaCurveProxyArray
        }
    }
}
