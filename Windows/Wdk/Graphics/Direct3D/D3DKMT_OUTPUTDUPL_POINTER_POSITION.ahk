#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\POINT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OUTPUTDUPL_POINTER_POSITION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {POINT}
     */
    Position{
        get {
            if(!this.HasProp("__Position"))
                this.__Position := POINT(0, this)
            return this.__Position
        }
    }

    /**
     * @type {BOOL}
     */
    Visible {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
