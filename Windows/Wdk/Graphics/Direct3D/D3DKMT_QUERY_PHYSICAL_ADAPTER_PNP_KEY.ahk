#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_PNP_KEY_TYPE.ahk
#Include ..\..\..\Win32\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERY_PHYSICAL_ADAPTER_PNP_KEY extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PhysicalAdapterIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {D3DKMT_PNP_KEY_TYPE}
     */
    PnPKeyType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    pDest {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    pCchDest {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
