#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12VideoDecoder.ahk" { ID3D12VideoDecoder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents a Direct3D 12 video decoder that contains resolution-independent resources and state for performing the decode operation. Adds support for protected resources.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecoder1
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ID3D12VideoDecoder1 extends ID3D12VideoDecoder {
    /**
     * The interface identifier for ID3D12VideoDecoder1
     * @type {Guid}
     */
    static IID := Guid("{79a2e5fb-ccd2-469a-9fde-195d10951f7e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12VideoDecoder1 interfaces
    */
    struct Vtbl extends ID3D12VideoDecoder.Vtbl {
        GetProtectedResourceSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12VideoDecoder1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice2::CreateVideoDecoder1 when the ID3D12VideoDecoder1 was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Void>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecoder1-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, Guid.Ptr, riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }

    Query(iid) {
        if (ID3D12VideoDecoder1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProtectedResourceSession := CallbackCreate(GetMethod(implObj, "GetProtectedResourceSession"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProtectedResourceSession)
    }
}
