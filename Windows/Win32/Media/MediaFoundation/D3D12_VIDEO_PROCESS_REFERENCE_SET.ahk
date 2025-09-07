#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the reference frames needed to perform video processing.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_reference_set
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_REFERENCE_SET extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The number of past reference frames provided in *ppPastFrames*.
     * @type {Integer}
     */
    NumPastFrames {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) surfaces. The number of elements in the array is *NumPastFrames*.
     * @type {Pointer<ID3D12Resource>}
     */
    ppPastFrames {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * An array of subresource indices for the list of *ppPastFrames* textures.  NULL indicates subresource 0 for each resource.
     * @type {Pointer<UInt32>}
     */
    pPastSubresources {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The number of future reference frames provided in *ppPastFrames*.
     * @type {Integer}
     */
    NumFutureFrames {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A pointer to an array of [ID3D12Resource](/windows/desktop/api/d3d12/nn-d3d12-id3d12resource) surfaces. The number of elements in the array is *NumFutureFrames*.
     * @type {Pointer<ID3D12Resource>}
     */
    ppFutureFrames {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * An array of subresource indices for the list of *ppFutureFrames* textures.  NULL indicates subresource 0 for each resource.
     * @type {Pointer<UInt32>}
     */
    pFutureSubresources {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
