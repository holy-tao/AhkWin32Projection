#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAG_REPEAT_FRAME
     * @type {Integer (Int32)}
     */
    static FLAG_REPEAT_FRAME => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAG_DIRTY_REGIONS
     * @type {Integer (Int32)}
     */
    static FLAG_DIRTY_REGIONS => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_DIRTY_REGIONS_SUPPORT_FLAG_DIRTY_REGIONS_REQUIRE_FULL_ROW
     * @type {Integer (Int32)}
     */
    static FLAG_DIRTY_REGIONS_REQUIRE_FULL_ROW => 4
}
