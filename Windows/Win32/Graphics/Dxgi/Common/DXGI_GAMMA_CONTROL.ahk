#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DXGI_RGB.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_GAMMA_CONTROL extends Win32Struct {
    static sizeof => 12324

    static packingSize => 4

    /**
     * @type {DXGI_RGB}
     */
    Scale {
        get {
            if(!this.HasProp("__Scale"))
                this.__Scale := DXGI_RGB(0, this)
            return this.__Scale
        }
    }

    /**
     * @type {DXGI_RGB}
     */
    Offset {
        get {
            if(!this.HasProp("__Offset"))
                this.__Offset := DXGI_RGB(12, this)
            return this.__Offset
        }
    }

    /**
     * @type {DXGI_RGB}
     */
    GammaCurve {
        get {
            if(!this.HasProp("__GammaCurveProxyArray"))
                this.__GammaCurveProxyArray := Win32FixedArray(this.ptr + 24, 1025, DXGI_RGB, "")
            return this.__GammaCurveProxyArray
        }
    }
}
