#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE.ahk" { D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_DIRTY_RECT_INFO {
    #StructPack 8

    FullFrameIdentical : BOOL

    MapValuesType : D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE

    NumDirtyRects : UInt32

    pDirtyRects : RECT.Ptr

    SourceDPBFrameReference : UInt32

}
