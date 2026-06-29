#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_CREATE_STATE_OBJECT_STATISTICS.ahk" { D3D12_CREATE_STATE_OBJECT_STATISTICS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_STATE_OBJECT_STATISTICS {
    #StructPack 4

    DefaultPSDBRegistered : BOOL

    PipelineStateObjectStatistics : D3D12_CREATE_STATE_OBJECT_STATISTICS

    StateObjectStatistics : D3D12_CREATE_STATE_OBJECT_STATISTICS

}
