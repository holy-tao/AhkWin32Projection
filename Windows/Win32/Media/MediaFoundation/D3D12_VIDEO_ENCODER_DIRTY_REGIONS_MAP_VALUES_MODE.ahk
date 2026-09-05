#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE_DIRTY
     * @type {Integer (Int32)}
     */
    static DIRTY => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_MAP_VALUES_MODE_SKIP
     * @type {Integer (Int32)}
     */
    static SKIP => 1
}
