#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the parameter stages for video extension commands.
 * @remarks
 * Values from this enumeration are used when querying for video extension parameter information with calls to [ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with the feature specified as [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETERS](ne-d3d12video-d3d12_feature_video.md) or [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT](ne-d3d12video-d3d12_feature_video.md). The results of these parameter queries may be different for different parameter stages.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_extension_command_parameter_stage
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE{

    /**
     * The parameter stage is in video extension command creation.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CREATION => 0

    /**
     * The parameter stage is in video extension command initialization.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_INITIALIZATION => 1

    /**
     * The parameter stage is in video extension command execution.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_EXECUTION => 2

    /**
     * The parameter stage is input parameters passed to capabilities queries.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_INPUT => 3

    /**
     * The parameter stage is output parameters passed to capabilities queries.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_OUTPUT => 4

    /**
     * The parameter stage is device execution input.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_DEVICE_EXECUTE_INPUT => 5

    /**
     * The parameter stage is device execution output.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_DEVICE_EXECUTE_OUTPUT => 6
}
