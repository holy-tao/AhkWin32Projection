#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_COMMAND_LIST_TYPE.ahk
#Include .\D3D12_BARRIER_LAYOUT.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_FEATURE_DATA_BARRIER_LAYOUT extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {D3D12_COMMAND_LIST_TYPE}
     */
    CommandListType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_BARRIER_LAYOUT}
     */
    Layout {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {BOOL}
     */
    Supported {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
