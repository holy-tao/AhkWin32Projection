#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE.ahk" { D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE }
#Import "..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_INPUT_MAP_DATA_DIRTY_REGIONS {
    #StructPack 8

    FullFrameIdentical : BOOL

    MapValuesType : D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE

    pDirtyRegionsMap : ID3D12Resource

    SourceDPBFrameReference : UInt32

}
