#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_DESC.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_DESC }
#Import ".\ID3D12ProtectedSession.ahk" { ID3D12ProtectedSession }

/**
 * Monitors the validity of a protected resource session. (ID3D12ProtectedResourceSession)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ProtectedResourceSession extends ID3D12ProtectedSession {
    /**
     * The interface identifier for ID3D12ProtectedResourceSession
     * @type {Guid}
     */
    static IID := Guid("{6cd696f4-f289-40cc-8091-5a6c0a099c3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ProtectedResourceSession interfaces
    */
    struct Vtbl extends ID3D12ProtectedSession.Vtbl {
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ProtectedResourceSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a description of the protected resource session. (ID3D12ProtectedResourceSession.GetDesc)
     * @returns {D3D12_PROTECTED_RESOURCE_SESSION_DESC} A [D3D12_PROTECTED_RESOURCE_SESSION_DESC](./ns-d3d12-d3d12_protected_resource_session_desc.md) that describes the protected resource session.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedresourcesession-getdesc
     */
    GetDesc() {
        result := ComCall(10, this, D3D12_PROTECTED_RESOURCE_SESSION_DESC)
        return result
    }

    Query(iid) {
        if (ID3D12ProtectedResourceSession.IID.Equals(iid)) {
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
