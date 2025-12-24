#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D\D3DMATRIX.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DHAL_DP2MULTIPLYTRANSFORM extends Win32Struct
{
    static sizeof => 68

    static packingSize => 4

    /**
     * @type {Integer}
     */
    xfrmType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3DMATRIX}
     */
    matrix{
        get {
            if(!this.HasProp("__matrix"))
                this.__matrix := D3DMATRIX(4, this)
            return this.__matrix
        }
    }
}
