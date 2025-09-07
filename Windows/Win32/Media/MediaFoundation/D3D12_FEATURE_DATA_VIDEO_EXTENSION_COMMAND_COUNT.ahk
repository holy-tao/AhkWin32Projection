#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the number of video extension commands.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_count
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_COUNT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The supported number of video extension commands.
     * @type {Integer}
     */
    CommandCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
