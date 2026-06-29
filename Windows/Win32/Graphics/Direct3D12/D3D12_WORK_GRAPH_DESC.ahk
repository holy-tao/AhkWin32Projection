#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_WORK_GRAPH_FLAGS.ahk" { D3D12_WORK_GRAPH_FLAGS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_NODE_ID.ahk" { D3D12_NODE_ID }
#Import ".\D3D12_NODE.ahk" { D3D12_NODE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_WORK_GRAPH_DESC {
    #StructPack 8

    ProgramName : PWSTR

    Flags : D3D12_WORK_GRAPH_FLAGS

    NumEntrypoints : UInt32

    pEntrypoints : D3D12_NODE_ID.Ptr

    NumExplicitlyDefinedNodes : UInt32

    pExplicitlyDefinedNodes : D3D12_NODE.Ptr

}
