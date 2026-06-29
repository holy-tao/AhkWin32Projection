#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D12Tools1.ahk" { ID3D12Tools1 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Tools2 extends ID3D12Tools1 {
    /**
     * The interface identifier for ID3D12Tools2
     * @type {Guid}
     */
    static IID := Guid("{01d393c5-c9b0-42a1-958c-c26b02d4d097}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Tools2 interfaces
    */
    struct Vtbl extends ID3D12Tools1.Vtbl {
        SetApplicationSpecificDriverState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Tools2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pAdapter 
     * @param {ID3DBlob} pBlob 
     * @returns {HRESULT} 
     */
    SetApplicationSpecificDriverState(pAdapter, pBlob) {
        result := ComCall(7, this, "ptr", pAdapter, "ptr", pBlob, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12Tools2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetApplicationSpecificDriverState := CallbackCreate(GetMethod(implObj, "SetApplicationSpecificDriverState"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetApplicationSpecificDriverState)
    }
}
