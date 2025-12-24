#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\DirectDraw\DDPIXELFORMAT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DD_GETFORMATDATA extends Win32Struct
{
    static sizeof => 48

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
    dwFormatIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {DDPIXELFORMAT}
     */
    format{
        get {
            if(!this.HasProp("__format"))
                this.__format := DDPIXELFORMAT(16, this)
            return this.__format
        }
    }
}
