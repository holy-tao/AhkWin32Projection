#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE extends Win32Enum {

    /**
     * Native name: D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_FIELD_BASED
     * @type {Integer (Int32)}
     */
    static FIELD_BASED => 1
}
