#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DSTATE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_GETSTATEDATA extends Win32Struct
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
     * @type {Integer}
     */
    dwWhich {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3DSTATE}
     */
    ddState{
        get {
            if(!this.HasProp("__ddState"))
                this.__ddState := D3DSTATE(16, this)
            return this.__ddState
        }
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
