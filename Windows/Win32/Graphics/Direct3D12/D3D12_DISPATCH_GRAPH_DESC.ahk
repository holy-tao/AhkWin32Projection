#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_NODE_CPU_INPUT.ahk" { D3D12_NODE_CPU_INPUT }
#Import ".\D3D12_MULTI_NODE_CPU_INPUT.ahk" { D3D12_MULTI_NODE_CPU_INPUT }
#Import ".\D3D12_DISPATCH_MODE.ahk" { D3D12_DISPATCH_MODE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_DISPATCH_GRAPH_DESC {
    #StructPack 8

    Mode : D3D12_DISPATCH_MODE

    NodeCPUInput : D3D12_NODE_CPU_INPUT

    static __New() {
        DefineProp(this.Prototype, 'NodeGPUInput', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'MultiNodeCPUInput', { type: D3D12_MULTI_NODE_CPU_INPUT, offset: 8 })
        DefineProp(this.Prototype, 'MultiNodeGPUInput', { type: Int64, offset: 8 })
        this.DeleteProp("__New")
    }
}
