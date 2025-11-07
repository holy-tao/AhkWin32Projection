#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Retrieves the maximum number of enabled input streams supported by the video processor.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_feature_data_video_process_max_input_streams
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_FEATURE_DATA_VIDEO_PROCESS_MAX_INPUT_STREAMS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An integer indicating which physical adapter of the device the operation applies to, in a multi-adapter operation.
     * @type {Integer}
     */
    NodeIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum number of streams that can be enabled for the video processor at the same time.
     * @type {Integer}
     */
    MaxInputStreams {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
