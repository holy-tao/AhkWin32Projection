#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DNTHAL_VALIDATETEXTURESTAGESTATEDATA extends Win32Struct {
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
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dwReserved {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwNumPasses {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {HRESULT}
     */
    ddrval {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
