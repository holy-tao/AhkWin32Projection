#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_NODE_CPU_INPUT.ahk" { D3D12_NODE_CPU_INPUT }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_MULTI_NODE_CPU_INPUT {
    #StructPack 8

    NumNodeInputs : UInt32

    pNodeInputs : D3D12_NODE_CPU_INPUT.Ptr

    NodeInputStrideInBytes : Int64

}
