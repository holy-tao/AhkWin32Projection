#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Retrieves video extension command support using command-defined input and output structures.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_feature_data_video_extension_command_support
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_FEATURE_DATA_VIDEO_EXTENSION_COMMAND_SUPPORT {
    #StructPack 8

    /**
     * In multi-adapter operation, this indicates which physical adapter of the device this operation applies to.
     */
    NodeIndex : UInt32

    /**
     * The unique identifier for the video extension command for which support is queried.
     */
    CommandId : Guid

    /**
     * Input data for the capability query allocated by the caller with a size of *InputDataSizeInBytes*.  This struct is enumerable as the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_INPUT](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) parameter stage.
     */
    pInputData : IntPtr

    /**
     * The byte size of the input data allocation.
     */
    InputDataSizeInBytes : IntPtr

    /**
     * Output data for the capability query allocated by the caller with a size of *OutputDataSizeInBytes*.  This struct is enumerable as the [D3D12_VIDEO_EXTENSION_COMMAND_PARAMETER_STAGE_CAPS_OUTPUT](ne-d3d12video-d3d12_video_extension_command_parameter_stage.md) parameter stage.
     */
    pOutputData : IntPtr

    /**
     * The byte size of the output data allocation.
     */
    OutputDataSizeInBytes : IntPtr

}
