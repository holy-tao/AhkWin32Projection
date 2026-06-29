#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_DECODER_HEAP_DESC.ahk" { D3D12_VIDEO_DECODER_HEAP_DESC }
#Import "..\..\Graphics\Direct3D12\ID3D12Pageable.ahk" { ID3D12Pageable }

/**
 * Represents a Direct3D 12 video decoder heap.
 * @remarks
 * Get an instance of this class by calling [ID3D12VideoDevice::CreateVideoDecoderHeap](nf-d3d12video-id3d12videodevice-createvideodecoderheap.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecoderheap
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDecoderHeap extends ID3D12Pageable {
    /**
     * The interface identifier for ID3D12VideoDecoderHeap
     * @type {Guid}
     */
    static IID := Guid("{0946b7c9-ebf6-4047-bb73-8683e27dbb1f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDecoderHeap interfaces
    */
    struct Vtbl extends ID3D12Pageable.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDecoderHeap.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the D3D12_VIDEO_DECODER_HEAP_DESC structure that was passed into ID3D12VideoDevice::CreateVideoDecoderHeap when the ID3D12VideoDecoderHeap was created.
     * @returns {D3D12_VIDEO_DECODER_HEAP_DESC} This method returns a **D3D12_VIDEO_DECODER_HEAP_DESC** structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecoderheap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, D3D12_VIDEO_DECODER_HEAP_DESC)
        return result
    }

    Query(iid) {
        if (ID3D12VideoDecoderHeap.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
    }
}
