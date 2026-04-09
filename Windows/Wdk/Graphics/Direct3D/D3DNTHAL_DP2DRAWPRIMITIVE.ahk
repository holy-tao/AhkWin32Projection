#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DPRIMITIVETYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DNTHAL_DP2DRAWPRIMITIVE extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {D3DPRIMITIVETYPE}
     */
    primType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    VStart {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    PrimitiveCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
