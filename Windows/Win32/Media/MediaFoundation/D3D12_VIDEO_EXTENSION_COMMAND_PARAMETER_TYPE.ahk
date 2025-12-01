#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of parameters for video extension commands.
 * @remarks
 * Values from this enumeration are used by the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO](ns-d3d12video-d3d12_video_extension_command_parameter_info.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_extension_command_parameter_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE extends Win32Enum{

    /**
     * Unsigned 8-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT8 => 0

    /**
     * Unsigned 16-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT16 => 1

    /**
     * Unsigned 32-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT32 => 2

    /**
     * Unsigned 64-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_UINT64 => 3

    /**
     * Signed 8-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT8 => 4

    /**
     * Signed 16-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT16 => 5

    /**
     * Signed 32-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT32 => 6

    /**
     * Signed 64-bit integer.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_SINT64 => 7

    /**
     * IEEE 32-bit floating point number
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_FLOAT => 8

    /**
     * IEEE 64-bit floating point number
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_DOUBLE => 9

    /**
     * A D3D12DDI_HRESOURCE handle.  The caller must use resource barriers to transition to the state appropriate for the parameter.
     * 
     * | D3D12_COMMAND_LIST_SUPPORT_FLAGS value        | Read                      | Write                  |
     * |-------------------|---------------------------|------------------------|
     * | D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_DECODE | D3D12_RESOURCE_STATE_VIDEO_DECODE_READ | D3D12_RESOURCE_STATE_VIDEO_DECODE_WRITE |
     * | D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_PROCESS | D3D12_RESOURCE_STATE_VIDEO_PROCESS_READ | D3D12_RESOURCE_STATE_VIDEO_PROCESS_WRITE |
     * | D3D12_COMMAND_LIST_SUPPORT_FLAG_VIDEO_ENCODE | D3D12_RESOURCE_STATE_VIDEO_ENCODE_READ | D3D12_RESOURCE_STATE_VIDEO_ENCODE_WRITE |
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_TYPE_RESOURCE => 10
}
