#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_PROCESS_REFERENCE_SET.ahk

/**
 * Contains input information for the video processor blend functionality.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ns-d3d12video-d3d12_video_process_input_stream
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_INPUT_STREAM extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * An [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) representing the current input field or frame.
     * @type {ID3D12Resource}
     */
    pTexture2D {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The subresource index to use of the *pInputTexture* argument.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A [D3D12_VIDEO_PROCESS_REFERENCE_SET](ns-d3d12video-d3d12_video_process_reference_set.md) containing the set of references for video processing. Some video processing algorithms require forward or backward frame references. For more information, see [D3D12_FEATURE_VIDEO_PROCESS_REFERENCE_INFO](ne-d3d12video-d3d12_feature_video.md).
     * @type {D3D12_VIDEO_PROCESS_REFERENCE_SET}
     */
    ReferenceSet{
        get {
            if(!this.HasProp("__ReferenceSet"))
                this.__ReferenceSet := D3D12_VIDEO_PROCESS_REFERENCE_SET(16, this)
            return this.__ReferenceSet
        }
    }
}
