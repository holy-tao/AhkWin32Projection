#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DDISPLAYMODE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DD_GETEXTENDEDMODEDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<DD_GETDRIVERINFO2DATA>}
     */
    gdi2 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwModeIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3DDISPLAYMODE}
     */
    mode{
        get {
            if(!this.HasProp("__mode"))
                this.__mode := D3DDISPLAYMODE(16, this)
            return this.__mode
        }
    }
}
