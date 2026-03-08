#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice2.ahk

/**
 * Extends the ID3D12VideoDevice interface to add support video encoding capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodevice3
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice3 extends ID3D12VideoDevice2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice3
     * @type {Guid}
     */
    static IID => Guid("{4243adb4-3a32-4666-973c-0ccc5625dc44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoEncoder", "CreateVideoEncoderHeap"]

    /**
     * Creates a new instance of ID3D12VideoEncoder.
     * @param {Pointer<D3D12_VIDEO_ENCODER_DESC>} pDesc A [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) representing the configuration parameters for the video encoder.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the video encoder interface. Expected value: IID_ID3D12VideoEncoder.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the video encoder interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice3-createvideoencoder
     */
    CreateVideoEncoder(pDesc, riid) {
        result := ComCall(14, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppVideoEncoder := 0, "HRESULT")
        return ppVideoEncoder
    }

    /**
     * Creates a new instance of ID3D12VideoEncoderHeap.
     * @param {Pointer<D3D12_VIDEO_ENCODER_HEAP_DESC>} pDesc A [D3D12_VIDEO_ENCODER_HEAP_DESC](ns-d3d12video-d3d12_video_encoder_heap_desc.md) representing the configuration parameters for the video encoder heap.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the video encoder heap interface. Expected value: IID_ID3D12VideoEncoderHeap.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the video encoder heap interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice3-createvideoencoderheap
     */
    CreateVideoEncoderHeap(pDesc, riid) {
        result := ComCall(15, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppVideoEncoderHeap := 0, "HRESULT")
        return ppVideoEncoderHeap
    }
}
