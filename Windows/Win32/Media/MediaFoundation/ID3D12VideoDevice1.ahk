#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice.ahk

/**
 * Adds support for motion estimation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nn-d3d12video-id3d12videodevice1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice1 extends ID3D12VideoDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice1
     * @type {Guid}
     */
    static IID => Guid("{981611ad-a144-4c83-9890-f30e26d658ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoMotionEstimator", "CreateVideoMotionVectorHeap"]

    /**
     * Creates an ID3D12VideoMotionEstimator, which maintains context for video motion estimation operations.
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_DESC>} pDesc A [D3D12_VIDEO_MOTION_ESTIMATOR_DESC](ns-d3d12video-d3d12_video_motion_estimator_desc.md) describing the parameters used for motion estimation. This structure contains both input and output fields.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12VideoMotionEstimator** interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the **ID3D12VideoMotionEstimator** interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionestimator
     */
    CreateVideoMotionEstimator(pDesc, pProtectedResourceSession, riid) {
        result := ComCall(7, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoMotionEstimator := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoMotionEstimator
    }

    /**
     * Allocates heap that contains motion vectors for video motion estimation.
     * @param {Pointer<D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC>} pDesc A pointer to a [D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC](ns-d3d12video-d3d12_video_motion_vector_heap_desc.md) describing the format of the heap. This structure contains both input and output fields.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12VideoMotionVectorHeap** interface.
     * @returns {Pointer<Pointer<Void>>} A pointer to a memory block that receives a pointer to the **ID3D12VideoMotionVectorHeap** interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionvectorheap
     */
    CreateVideoMotionVectorHeap(pDesc, pProtectedResourceSession, riid) {
        result := ComCall(8, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr*", &ppVideoMotionVectorHeap := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVideoMotionVectorHeap
    }
}
