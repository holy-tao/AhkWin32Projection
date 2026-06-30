#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\DXGI_MODE_SCANLINE_ORDER.ahk
#Include .\DXGI_FORMAT.ahk
#Include .\DXGI_RATIONAL.ahk
#Include .\DXGI_MODE_SCALING.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
class DXGI_MODE_DESC extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {DXGI_RATIONAL}
     */
    RefreshRate {
        get {
            if(!this.HasProp("__RefreshRate"))
                this.__RefreshRate := DXGI_RATIONAL(8, this)
            return this.__RefreshRate
        }
    }

    /**
     * @type {DXGI_FORMAT}
     */
    Format {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {DXGI_MODE_SCANLINE_ORDER}
     */
    ScanlineOrdering {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {DXGI_MODE_SCALING}
     */
    Scaling {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
