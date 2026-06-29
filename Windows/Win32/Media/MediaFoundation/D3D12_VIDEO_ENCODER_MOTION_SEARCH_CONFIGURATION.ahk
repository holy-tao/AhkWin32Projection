#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE.ahk" { D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk" { D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_MOTION_SEARCH_CONFIGURATION {
    #StructPack 4

    Enabled : BOOL

    MapSource : D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE

    MotionSearchMode : D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE

    BidirectionalRefFrameEnabled : BOOL

}
