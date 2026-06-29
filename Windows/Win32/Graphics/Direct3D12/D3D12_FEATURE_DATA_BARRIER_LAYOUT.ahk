#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_COMMAND_LIST_TYPE.ahk" { D3D12_COMMAND_LIST_TYPE }
#Import ".\D3D12_BARRIER_LAYOUT.ahk" { D3D12_BARRIER_LAYOUT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_BARRIER_LAYOUT {
    #StructPack 4

    CommandListType : D3D12_COMMAND_LIST_TYPE

    Layout : D3D12_BARRIER_LAYOUT

    Supported : BOOL

}
