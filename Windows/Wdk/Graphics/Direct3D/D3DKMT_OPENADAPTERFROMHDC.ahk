#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OPENADAPTERFROMHDC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HDC}
     */
    hDc{
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
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(12, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {Integer}
     */
    VidPnSourceId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
