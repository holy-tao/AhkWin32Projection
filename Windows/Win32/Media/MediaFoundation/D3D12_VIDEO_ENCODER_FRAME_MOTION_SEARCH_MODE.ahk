#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_FULL_SEARCH
     * @type {Integer (Int32)}
     */
    static FULL_SEARCH => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_START_HINT
     * @type {Integer (Int32)}
     */
    static START_HINT => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_FRAME_MOTION_SEARCH_MODE_START_HINT_LIMITED_DISTANCE
     * @type {Integer (Int32)}
     */
    static START_HINT_LIMITED_DISTANCE => 2
}
