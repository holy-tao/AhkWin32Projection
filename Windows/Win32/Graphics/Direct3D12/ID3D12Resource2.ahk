#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_RESOURCE_DESC1.ahk" { D3D12_RESOURCE_DESC1 }
#Import ".\ID3D12Resource1.ahk" { ID3D12Resource1 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Resource2 extends ID3D12Resource1 {
    /**
     * The interface identifier for ID3D12Resource2
     * @type {Guid}
     */
    static IID := Guid("{be36ec3b-ea85-4aeb-a45a-e9d76404a495}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Resource2 interfaces
    */
    struct Vtbl extends ID3D12Resource1.Vtbl {
        GetDesc1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Resource2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D12_RESOURCE_DESC1} 
     */
    GetDesc1() {
        result := ComCall(16, this, D3D12_RESOURCE_DESC1)
        return result
    }

    Query(iid) {
        if (ID3D12Resource2.IID.Equals(iid)) {
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
