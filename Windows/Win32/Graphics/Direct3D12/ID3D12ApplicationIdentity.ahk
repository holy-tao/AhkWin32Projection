#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_APPLICATION_DESC.ahk" { D3D12_APPLICATION_DESC }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12ApplicationIdentity extends IUnknown {
    /**
     * The interface identifier for ID3D12ApplicationIdentity
     * @type {Guid}
     */
    static IID := Guid("{82dc6c85-727b-4a8d-9169-db6ce3e975a0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12ApplicationIdentity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetApplicationIdentity : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12ApplicationIdentity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<D3D12_APPLICATION_DESC>} pDesc 
     * @param {Pointer<Guid>} AppId 
     * @returns {HRESULT} 
     */
    SetApplicationIdentity(pDesc, AppId) {
        result := ComCall(3, this, D3D12_APPLICATION_DESC.Ptr, pDesc, Guid.Ptr, AppId, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12ApplicationIdentity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetApplicationIdentity := CallbackCreate(GetMethod(implObj, "SetApplicationIdentity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetApplicationIdentity)
    }
}
