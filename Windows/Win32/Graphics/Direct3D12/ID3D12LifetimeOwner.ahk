#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_LIFETIME_STATE.ahk" { D3D12_LIFETIME_STATE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents an application-defined callback used for being notified of lifetime changes of an object.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12lifetimeowner
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12LifetimeOwner extends IUnknown {
    /**
     * The interface identifier for ID3D12LifetimeOwner
     * @type {Guid}
     */
    static IID := Guid("{e667af9f-cd56-4f46-83ce-032e595d70a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12LifetimeOwner interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LifetimeStateUpdated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12LifetimeOwner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the lifetime state of a lifetime-tracked object changes.
     * @param {D3D12_LIFETIME_STATE} NewState Type: **[D3D12_LIFETIME_STATE](./ne-d3d12-d3d12_lifetime_state.md)**
     * 
     * The new state.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12lifetimeowner-lifetimestateupdated
     */
    LifetimeStateUpdated(NewState) {
        ComCall(3, this, D3D12_LIFETIME_STATE, NewState)
    }

    Query(iid) {
        if (ID3D12LifetimeOwner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LifetimeStateUpdated := CallbackCreate(GetMethod(implObj, "LifetimeStateUpdated"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LifetimeStateUpdated)
    }
}
