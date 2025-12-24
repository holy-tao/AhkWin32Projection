#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DNTHAL_TEXTUREGETSURFDATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    dwhContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {HANDLE}
     */
    hDDS{
        get {
            if(!this.HasProp("__hDDS"))
                this.__hDDS := HANDLE(8, this)
            return this.__hDDS
        }
    }

    /**
     * @type {Pointer}
     */
    dwHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
