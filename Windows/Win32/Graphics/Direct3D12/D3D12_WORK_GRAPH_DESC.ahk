#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_WORK_GRAPH_FLAGS.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\D3D12_NODE.ahk
#Include .\D3D12_NODE_ID.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_WORK_GRAPH_DESC extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    ProgramName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {D3D12_WORK_GRAPH_FLAGS}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NumEntrypoints {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<D3D12_NODE_ID>}
     */
    pEntrypoints {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumExplicitlyDefinedNodes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<D3D12_NODE>}
     */
    pExplicitlyDefinedNodes {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
