#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_ENCODER_DESC.ahk" { D3D12_VIDEO_ENCODER_DESC }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_DESC.ahk" { D3D12_VIDEO_ENCODER_HEAP_DESC }
#Import ".\ID3D12VideoDevice2.ahk" { ID3D12VideoDevice2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the ID3D12VideoDevice interface to add support video encoding capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodevice3
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDevice3 extends ID3D12VideoDevice2 {
    /**
     * The interface identifier for ID3D12VideoDevice3
     * @type {Guid}
     */
    static IID := Guid("{4243adb4-3a32-4666-973c-0ccc5625dc44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDevice3 interfaces
    */
    struct Vtbl extends ID3D12VideoDevice2.Vtbl {
        CreateVideoEncoder     : IntPtr
        CreateVideoEncoderHeap : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDevice3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new instance of ID3D12VideoEncoder.
     * @param {Pointer<D3D12_VIDEO_ENCODER_DESC>} pDesc A [D3D12_VIDEO_ENCODER_DESC](ns-d3d12video-d3d12_video_encoder_desc.md) representing the configuration parameters for the video encoder.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the video encoder interface. Expected value: IID_ID3D12VideoEncoder.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the video encoder interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice3-createvideoencoder
     */
    CreateVideoEncoder(pDesc, riid) {
        result := ComCall(14, this, D3D12_VIDEO_ENCODER_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppVideoEncoder := 0, "HRESULT")
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
        result := ComCall(15, this, D3D12_VIDEO_ENCODER_HEAP_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppVideoEncoderHeap := 0, "HRESULT")
        return ppVideoEncoderHeap
    }

    Query(iid) {
        if (ID3D12VideoDevice3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVideoEncoder := CallbackCreate(GetMethod(implObj, "CreateVideoEncoder"), flags, 4)
        this.vtbl.CreateVideoEncoderHeap := CallbackCreate(GetMethod(implObj, "CreateVideoEncoderHeap"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVideoEncoder)
        CallbackFree(this.vtbl.CreateVideoEncoderHeap)
    }
}
