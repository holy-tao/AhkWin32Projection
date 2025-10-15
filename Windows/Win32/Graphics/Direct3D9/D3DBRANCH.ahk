#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DBRANCH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    bNegate{
        get {
            if(!this.HasProp("__bNegate"))
                this.__bNegate := BOOL(this.ptr + 8)
            return this.__bNegate
        }
    }

    /**
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
