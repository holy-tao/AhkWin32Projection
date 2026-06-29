#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE.ahk" { D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_CONFIG {
    #StructPack 4

    MotionSearchMode : D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE

    SearchDeviationLimit : UInt32

}
