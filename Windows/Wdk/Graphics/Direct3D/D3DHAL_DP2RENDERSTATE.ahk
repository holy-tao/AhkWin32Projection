#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DRENDERSTATETYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DHAL_DP2RENDERSTATE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {D3DRENDERSTATETYPE}
     */
    RenderState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Float}
     */
    dvState {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
