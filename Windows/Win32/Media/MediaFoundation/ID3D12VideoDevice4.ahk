#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_VIDEO_ENCODER_HEAP_DESC1.ahk" { D3D12_VIDEO_ENCODER_HEAP_DESC1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12VideoDevice3.ahk" { ID3D12VideoDevice3 }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDevice4 extends ID3D12VideoDevice3 {
    /**
     * The interface identifier for ID3D12VideoDevice4
     * @type {Guid}
     */
    static IID := Guid("{e59ad09e-f1ae-42bb-8983-9f6e5586c4eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDevice4 interfaces
    */
    struct Vtbl extends ID3D12VideoDevice3.Vtbl {
        CreateVideoEncoderHeap1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDevice4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_ENCODER_HEAP_DESC1>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateVideoEncoderHeap1(pDesc, riid) {
        result := ComCall(16, this, D3D12_VIDEO_ENCODER_HEAP_DESC1.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppVideoEncoderHeap := 0, "HRESULT")
        return ppVideoEncoderHeap
    }

    Query(iid) {
        if (ID3D12VideoDevice4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateVideoEncoderHeap1 := CallbackCreate(GetMethod(implObj, "CreateVideoEncoderHeap1"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateVideoEncoderHeap1)
    }
}
