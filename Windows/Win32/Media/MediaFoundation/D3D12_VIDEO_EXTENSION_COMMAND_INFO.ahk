#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a video extension command. (D3D12_VIDEO_EXTENSION_COMMAND_INFO)
 * @remarks
 * An array of this structure is provided in a [D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMANDS](ns-d3d12video-d3d12_feature_data_video_extension_commands.md) structure returned from a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) when the feature specified is [D3D12_FEATURE_VIDEO_EXTENSION_COMMANDS](ne-d3d12video-d3d12_feature_video.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_extension_command_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_EXTENSION_COMMAND_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The unique identifier for the video extension command.
     * @type {Pointer<Guid>}
     */
    CommandId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a wide string containing the name of the command.
     * @type {Pointer<PWSTR>}
     */
    Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A member of the [D3D12_COMMAND_LIST_SUPPORT_FLAGS](../d3d12/ne-d3d12-d3d12_command_list_support_flags.md) enumeration.  Indicates the video command queue that the video extension targets. Only one value from the enumeration can be set.
     * @type {Integer}
     */
    CommandListSupportFlags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
