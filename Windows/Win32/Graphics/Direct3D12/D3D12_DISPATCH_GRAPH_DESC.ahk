#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_NODE_CPU_INPUT.ahk
#Include .\D3D12_MULTI_NODE_CPU_INPUT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DISPATCH_GRAPH_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Mode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_NODE_CPU_INPUT}
     */
    NodeCPUInput{
        get {
            if(!this.HasProp("__NodeCPUInput"))
                this.__NodeCPUInput := D3D12_NODE_CPU_INPUT(this.ptr + 8)
            return this.__NodeCPUInput
        }
    }

    /**
     * @type {Integer}
     */
    NodeGPUInput {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D12_MULTI_NODE_CPU_INPUT}
     */
    MultiNodeCPUInput{
        get {
            if(!this.HasProp("__MultiNodeCPUInput"))
                this.__MultiNodeCPUInput := D3D12_MULTI_NODE_CPU_INPUT(this.ptr + 8)
            return this.__MultiNodeCPUInput
        }
    }

    /**
     * @type {Integer}
     */
    MultiNodeGPUInput {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
