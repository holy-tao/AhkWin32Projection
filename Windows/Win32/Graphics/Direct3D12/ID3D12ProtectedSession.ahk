#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_PROTECTED_SESSION_STATUS.ahk" { D3D12_PROTECTED_SESSION_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12DeviceChild.ahk" { ID3D12DeviceChild }

/**
 * Offers base functionality that allows for a consistent way to monitor the validity of a session across the different types of sessions.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedsession
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ProtectedSession extends ID3D12DeviceChild {
    /**
     * The interface identifier for ID3D12ProtectedSession
     * @type {Guid}
     */
    static IID := Guid("{a1533d18-0ac1-4084-85b9-89a96116806b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ProtectedSession interfaces
    */
    struct Vtbl extends ID3D12DeviceChild.Vtbl {
        GetStatusFence   : IntPtr
        GetSessionStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ProtectedSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the fence for the protected session. From the fence, you can retrieve the current uniqueness validity value (using ID3D12Fence::GetCompletedValue), and add monitors for changes to its value. This is a read-only fence.
     * @param {Pointer<Guid>} riid The GUID of the interface to a fence. Most commonly, <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12fence">ID3D12Fence</a>, although it may be any GUID for any interface. If the protected session object doesn’t support the interface for this GUID, the function returns <b>E_NOINTERFACE</b>.
     * @returns {Pointer<Void>} A pointer to a memory block that receives a pointer to the fence for the given protected session.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedsession-getstatusfence
     */
    GetStatusFence(riid) {
        result := ComCall(8, this, Guid.Ptr, riid, "ptr*", &ppFence := 0, "HRESULT")
        return ppFence
    }

    /**
     * Gets the status of the protected session.
     * @returns {D3D12_PROTECTED_SESSION_STATUS} Type: **[D3D12_PROTECTED_SESSION_STATUS](/windows/desktop/api/d3d12/ne-d3d12-d3d12_protected_session_status)**
     * 
     * The status of the protected session. If the returned value is [D3D12_PROTECTED_SESSION_STATUS_INVALID](/windows/desktop/api/d3d12/ne-d3d12-d3d12_protected_session_status), then you need to wait for a uniqueness value bump to reuse the resource if the session is an [ID3D12ProtectedResourceSession](/windows/desktop/api/d3d12/nn-d3d12-id3d12protectedresourcesession).
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12protectedsession-getsessionstatus
     */
    GetSessionStatus() {
        result := ComCall(9, this, D3D12_PROTECTED_SESSION_STATUS)
        return result
    }

    Query(iid) {
        if (ID3D12ProtectedSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStatusFence := CallbackCreate(GetMethod(implObj, "GetStatusFence"), flags, 3)
        this.vtbl.GetSessionStatus := CallbackCreate(GetMethod(implObj, "GetSessionStatus"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStatusFence)
        CallbackFree(this.vtbl.GetSessionStatus)
    }
}
