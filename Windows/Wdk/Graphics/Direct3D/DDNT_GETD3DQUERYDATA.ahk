#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Direct3D9\D3DQUERYTYPE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DDNT_GETD3DQUERYDATA extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    gdi2 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwQueryIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3DQUERYTYPE}
     */
    QueryType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
