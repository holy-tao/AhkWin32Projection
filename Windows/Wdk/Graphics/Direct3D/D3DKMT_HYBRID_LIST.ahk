#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_GPU_PREFERENCE_QUERY_STATE.ahk
#Include .\D3DKMT_GPU_PREFERENCE_QUERY_TYPE.ahk
#Include ..\..\..\Win32\Foundation\BOOL.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_HYBRID_LIST extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {D3DKMT_GPU_PREFERENCE_QUERY_STATE}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    AdapterLuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {BOOL}
     */
    bUserPreferenceQuery {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {D3DKMT_GPU_PREFERENCE_QUERY_TYPE}
     */
    QueryType {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
