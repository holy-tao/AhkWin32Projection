#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the output parameters for calls to ID3D12VideoEncodeCommandList::EstimateMotion.
 * @remarks
 * Call [ID3D12VideoEncodeCommandList::ResolveMotionVectorHeap](nf-d3d12video-id3d12videoencodecommandlist-resolvemotionvectorheap.md) to translate the motion vector output of the [EstimateMotion](nf-d3d12video-id3d12videoencodecommandlist-estimatemotion.md) method from hardware-dependent formats into a consistent format defined by the video motion estimation APIs.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_motion_estimator_output
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * An [ID3D12VideoMotionVectorHeap](nn-d3d12video-id3d12videomotionvectorheap.md) containing the resolved motion estimation vectors. Motion vectors are resolved to a [DXGI_FORMAT_R16G16_SINT](../dxgiformat/ne-dxgiformat-dxgi_format.md) 2D texture. The resolved data is a signed 16-byte integer with quarter PEL units with the X vector component stored in the R component and the Y vector component stored in the G component. Motion vectors are stored in a 2D layout that corresponds to the pixel layout of the original input textures.
     * @type {ID3D12VideoMotionVectorHeap}
     */
    pMotionVectorHeap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
