#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Gdi\HDC.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_OPENADAPTERFROMHDC extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {HDC}
     */
    hDc {
        get {
            if(!this.HasProp("__hDc"))
                this.__hDc := HDC(0, this)
            return this.__hDc
        }
    }

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
