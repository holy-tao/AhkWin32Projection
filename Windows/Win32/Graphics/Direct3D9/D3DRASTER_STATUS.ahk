#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DRASTER_STATUS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    InVBlank{
        get {
            if(!this.HasProp("__InVBlank"))
                this.__InVBlank := BOOL(this.ptr + 0)
            return this.__InVBlank
        }
    }

    /**
     * @type {Integer}
     */
    ScanLine {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
