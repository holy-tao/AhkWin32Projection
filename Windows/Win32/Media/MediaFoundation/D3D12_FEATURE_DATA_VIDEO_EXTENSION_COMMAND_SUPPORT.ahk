#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves video extension command support using command-defined input and output structures.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_support
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SUPPORT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * For single GPU operation, set this to zero. If there are multiple GPU nodes, set a bit to identify the node (the device's physical adapter) to which the command queue applies. Each bit in the mask corresponds to a single node. Only 1 bit may be set.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The unique identifier for the video extension command for which support is queried.
     * @type {Pointer<Guid>}
     */
    CommandId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Input data for the capability query allocated by the caller with a size of *InputDataSizeInBytes*.  This struct is enumerable as the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_INPUT](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) parameter stage.
     * @type {Pointer<Void>}
     */
    pInputData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The byte size of the input data allocation.
     * @type {Pointer}
     */
    InputDataSizeInBytes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Output data for the capability query allocated by the caller with a size of *OutputDataSizeInBytes*.  This struct is enumerable as the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_OUTPUT](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) parameter stage.
     * @type {Pointer<Void>}
     */
    pOutputData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The byte size of the output data allocation.
     * @type {Pointer}
     */
    OutputDataSizeInBytes {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
