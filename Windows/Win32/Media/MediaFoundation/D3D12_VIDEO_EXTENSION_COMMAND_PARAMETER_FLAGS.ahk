#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the usage of the associated video extension command parameter.
 * @remarks
 * Values from this enumeration are used by the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO](ns-d3d12video-d3d12_video_extension_command_parameter_info.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_extension_command_parameter_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAGS{

    /**
     * None. Set for simple data type parameters.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_NONE => 0

    /**
     * The resource parameter is read. This flag is for **ID3D12Resource** only and is not valid for simple data type parameters.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_READ => 1

    /**
     * The resource parameter is written. This flag is for **ID3D12Resource** only and is not valid for simple data type parameters.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_FLAG_WRITE => 2
}
