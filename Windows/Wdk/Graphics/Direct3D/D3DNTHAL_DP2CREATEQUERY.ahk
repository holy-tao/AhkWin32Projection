#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DQUERYTYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DNTHAL_DP2CREATEQUERY extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwQueryID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DQUERYTYPE}
     */
    QueryType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
