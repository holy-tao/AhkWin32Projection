#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PROTECTED_RESOURCE_SESSION_DESC1.ahk" { D3D12_PROTECTED_RESOURCE_SESSION_DESC1 }
#Import ".\ID3D12ProtectedResourceSession.ahk" { ID3D12ProtectedResourceSession }

/**
 * Monitors the validity of a protected resource session. (ID3D12ProtectedResourceSession1)
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ProtectedResourceSession1 extends ID3D12ProtectedResourceSession {
    /**
     * The interface identifier for ID3D12ProtectedResourceSession1
     * @type {Guid}
     */
    static IID := Guid("{d6f12dd6-76fb-406e-8961-4296eefc0409}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ProtectedResourceSession1 interfaces
    */
    struct Vtbl extends ID3D12ProtectedResourceSession.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ProtectedResourceSession1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a description of the protected resource session. (ID3D12ProtectedResourceSession1::GetDesc1)
     * @returns {D3D12_PROTECTED_RESOURCE_SESSION_DESC1} A [D3D12_PROTECTED_RESOURCE_SESSION_DESC1](./ns-d3d12-d3d12_protected_resource_session_desc1.md) that describes the protected resource session.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedresourcesession1-getdesc1
     */
    GetDesc1() {
        result := ComCall(11, this, D3D12_PROTECTED_RESOURCE_SESSION_DESC1)
        return result
    }

    Query(iid) {
        if (ID3D12ProtectedResourceSession1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc1 := CallbackCreate(GetMethod(implObj, "GetDesc1"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc1)
    }
}
