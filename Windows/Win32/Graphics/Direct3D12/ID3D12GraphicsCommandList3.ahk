#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12ProtectedResourceSession.ahk" { ID3D12ProtectedResourceSession }
#Import ".\ID3D12GraphicsCommandList2.ahk" { ID3D12GraphicsCommandList2 }

/**
 * Encapsulates a list of graphics commands for rendering.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist3
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GraphicsCommandList3 extends ID3D12GraphicsCommandList2 {
    /**
     * The interface identifier for ID3D12GraphicsCommandList3
     * @type {Guid}
     */
    static IID := Guid("{6fda83a7-b84c-4e38-9ac8-c7bd22016b3d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GraphicsCommandList3 interfaces
    */
    struct Vtbl extends ID3D12GraphicsCommandList2.Vtbl {
        SetProtectedResourceSession : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GraphicsCommandList3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies whether or not protected resources can be accessed by subsequent commands in the command list.
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession Type: **[ID3D12ProtectedResourceSession](./nn-d3d12-id3d12protectedresourcesession.md)\***
     * 
     * An optional pointer to an **ID3D12ProtectedResourceSession**. You can obtain an **ID3D12ProtectedResourceSession** by calling [ID3D12Device4::CreateProtectedResourceSession](./nf-d3d12-id3d12device4-createprotectedresourcesession.md).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12graphicscommandlist3-setprotectedresourcesession
     */
    SetProtectedResourceSession(pProtectedResourceSession) {
        ComCall(67, this, "ptr", pProtectedResourceSession)
    }

    Query(iid) {
        if (ID3D12GraphicsCommandList3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProtectedResourceSession := CallbackCreate(GetMethod(implObj, "SetProtectedResourceSession"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProtectedResourceSession)
    }
}
