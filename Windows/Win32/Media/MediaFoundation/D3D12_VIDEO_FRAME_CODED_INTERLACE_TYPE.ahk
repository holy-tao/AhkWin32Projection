#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FRAME_CODED_INTERLACE_TYPE_FIELD_BASED => 1
}
