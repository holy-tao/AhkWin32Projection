#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO.ahk

/**
 * Retrieves the list of video extension command parameters for the specified parameter stage.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_PARAMETERS extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The unique identifier for the video extension command for which parameters are retrieved.
     * @type {Guid}
     */
    CommandId {
        get {
            if(!this.HasProp("__CommandId"))
                this.__CommandId := Guid(0, this)
            return this.__CommandId
        }
    }

    /**
     * A member of the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) enumeration specifying the parameter stage for which the parameters are retrieved.
     * @type {D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE}
     */
    Stage {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The supported number of video extension command parameters. This value must be the count returned by a call to[ID3D12VideoDevice::CheckFeatureSupport](nf-d3d12video-id3d12videodevice-checkfeaturesupport.md) with  [D3D12_FEATURE_VIDEO_EXTENSION_COMMAND_PARAMETER_COUNT](ne-d3d12video-d3d12_feature_video.md) specified as the feature.
     * @type {Integer}
     */
    ParameterCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Receives a list of [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO](ns-d3d12video-d3d12_video_extension_command_parameter_info.md) structures describing video extension command parameters.
     * @type {Pointer<D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_INFO>}
     */
    pParameterInfos {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
