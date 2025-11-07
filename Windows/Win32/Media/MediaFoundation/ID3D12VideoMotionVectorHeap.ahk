#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * Represents a heap in which estimated motion vectors are stored.
 * @remarks
 * 
 * Create a new instance of this interface by calling [ID3D12VideoDevice1::CreateVideoMotionVectorHeap](nf-d3d12video-id3d12videodevice1-createvideomotionvectorheap.md).
 * 
 * This interface is used by the [D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT](ns-d3d12video-d3d12_video_motion_estimator_output.md) structure returned from [ID3D12VideoEncodeCommandList::EstimateMotion](nf-d3d12video-id3d12videoencodecommandlist-estimatemotion.md). It is also used to supply hint vectors in the [D3D12_VIDEO_MOTION_ESTIMATOR_INPUT](ns-d3d12video-d3d12_video_motion_estimator_input.md) structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videomotionvectorheap
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoMotionVectorHeap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoMotionVectorHeap
     * @type {Guid}
     */
    static IID => Guid("{5be17987-743a-4061-834b-23d22daea505}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetProtectedResourceSession"]

    /**
     * 
     * @returns {D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionvectorheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionvectorheap-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }
}
