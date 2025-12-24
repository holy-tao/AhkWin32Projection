#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_ADAPTERINFO extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    hAdapter {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(4, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {Integer}
     */
    NumOfSources {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOL}
     */
    bPrecisePresentRegionsPreferred {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
