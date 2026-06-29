#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC.ahk" { D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a heap in which estimated motion vectors are stored.
 * @remarks
 * Create a new instance of this interface by calling [ID3D12VideoDevice1::CreateVideoMotionVectorHeap](nf-d3d12video-id3d12videodevice1-createvideomotionvectorheap.md).
 * 
 * This interface is used by the [D3D12_VIDEO_MOTION_ESTIMATOR_OUTPUT](ns-d3d12video-d3d12_video_motion_estimator_output.md) structure returned from [ID3D12VideoEncodeCommandList::EstimateMotion](nf-d3d12video-id3d12videoencodecommandlist-estimatemotion.md). It is also used to supply hint vectors in the [D3D12_VIDEO_MOTION_ESTIMATOR_INPUT](ns-d3d12video-d3d12_video_motion_estimator_input.md) structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videomotionvectorheap
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoMotionVectorHeap extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoMotionVectorHeap
     * @type {Guid}
     */
    static IID := Guid("{5be17987-743a-4061-834b-23d22daea505}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoMotionVectorHeap interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetDesc                     : IntPtr
        GetProtectedResourceSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoMotionVectorHeap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC structure that was passed into ID3D12VideoDevice1::CreateVideoMotionEstimatorHeap when the ID3D12VideoMotionEstimatorHeap was created.
     * @returns {D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC} This method returns a **D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC** structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionvectorheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC)
        return result
    }

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice1::CreateVideoMotionEstimatorHeap when the ID3D12VideoMotionEstimatorHeap was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Void>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionvectorheap-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, Guid.Ptr, riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }

    Query(iid) {
        if (ID3D12VideoMotionVectorHeap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
        this.vtbl.GetProtectedResourceSession := CallbackCreate(GetMethod(implObj, "GetProtectedResourceSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetProtectedResourceSession)
    }
}
