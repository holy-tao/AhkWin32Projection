#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DKMT_ADAPTER_VERIFIER_OPTION_TYPE.ahk
#Include .\D3DKMT_VERIFIER_OPTION_MODE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_ADAPTER_VERIFIER_OPTION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3DKMT_ADAPTER_VERIFIER_OPTION_TYPE}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3DKMT_VERIFIER_OPTION_MODE}
     */
    Mode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer}
     */
    Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
