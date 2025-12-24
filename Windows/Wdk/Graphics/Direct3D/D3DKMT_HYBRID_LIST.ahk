#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_HYBRID_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(8, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {BOOL}
     */
    bUserPreferenceQuery {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    QueryType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
