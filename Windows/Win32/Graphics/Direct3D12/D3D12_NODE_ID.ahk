#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_NODE_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := PWSTR(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * @type {Integer}
     */
    ArrayIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
