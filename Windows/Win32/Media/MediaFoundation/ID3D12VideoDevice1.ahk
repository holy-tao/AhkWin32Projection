#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC.ahk" { D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC }
#Import ".\ID3D12VideoDevice.ahk" { ID3D12VideoDevice }
#Import ".\D3D12_VIDEO_MOTION_ESTIMATOR_DESC.ahk" { D3D12_VIDEO_MOTION_ESTIMATOR_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D12\ID3D12ProtectedResourceSession.ahk" { ID3D12ProtectedResourceSession }

/**
 * Adds support for motion estimation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodevice1
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDevice1 extends ID3D12VideoDevice {
    /**
     * The interface identifier for ID3D12VideoDevice1
     * @type {Guid}
     */
    static IID := Guid("{981611ad-a144-4c83-9890-f30e26d658ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDevice1 interfaces
    */
    struct Vtbl extends ID3D12VideoDevice.Vtbl {
        CreateVideoMotionEstimator  : IntPtr
        CreateVideoMotionVectorHeap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDevice1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ID3D12VideoMotionEstimator, which maintains context for video motion estimation operations.
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_DESC>} pDesc A [D3D12_VIDEO_MOTION_ESTIMATOR_DESC](ns-d3d12video-d3d12_video_motion_estimator_desc.md) describing the parameters used for motion estimation. This structure contains both input and output fields.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12VideoMotionEstimator** interface.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the **ID3D12VideoMotionEstimator** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionestimator
     */
    CreateVideoMotionEstimator(pDesc, pProtectedResourceSession, riid) {
        result := ComCall(7, this, D3D12_VIDEO_MOTION_ESTIMATOR_DESC.Ptr, pDesc, "ptr", pProtectedResourceSession, Guid.Ptr, riid, "ptr*", &ppVideoMotionEstimator := 0, "HRESULT")
        return ppVideoMotionEstimator
    }

    /**
     * Allocates heap that contains motion vectors for video motion estimation.
     * @param {Pointer<D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC>} pDesc A pointer to a [D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC](ns-d3d12video-d3d12_video_motion_vector_heap_desc.md) describing the format of the heap. This structure contains both input and output fields.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession A [ID3D12ProtectedResourceSession](../d3d12/nn-d3d12-id3d12protectedresourcesession.md) for managing access to protected resources.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12VideoMotionVectorHeap** interface.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the **ID3D12VideoMotionVectorHeap** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionvectorheap
     */
    CreateVideoMotionVectorHeap(pDesc, pProtectedResourceSession, riid) {
        result := ComCall(8, this, D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC.Ptr, pDesc, "ptr", pProtectedResourceSession, Guid.Ptr, riid, "ptr*", &ppVideoMotionVectorHeap := 0, "HRESULT")
        return ppVideoMotionVectorHeap
    }

    Query(iid) {
        if (ID3D12VideoDevice1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVideoMotionEstimator := CallbackCreate(GetMethod(implObj, "CreateVideoMotionEstimator"), flags, 5)
        this.vtbl.CreateVideoMotionVectorHeap := CallbackCreate(GetMethod(implObj, "CreateVideoMotionVectorHeap"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVideoMotionEstimator)
        CallbackFree(this.vtbl.CreateVideoMotionVectorHeap)
    }
}
