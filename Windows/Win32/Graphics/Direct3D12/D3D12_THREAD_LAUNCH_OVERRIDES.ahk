#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_NODE_ID.ahk" { D3D12_NODE_ID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_NODE_OUTPUT_OVERRIDES.ahk" { D3D12_NODE_OUTPUT_OVERRIDES }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_THREAD_LAUNCH_OVERRIDES {
    #StructPack 8

    pLocalRootArgumentsTableIndex : IntPtr

    pProgramEntry : BOOL.Ptr

    pNewName : D3D12_NODE_ID.Ptr

    pShareInputOf : D3D12_NODE_ID.Ptr

    NumOutputOverrides : UInt32

    pOutputOverrides : D3D12_NODE_OUTPUT_OVERRIDES.Ptr

}
