#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D12Device12.ahk" { ID3D12Device12 }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device13 extends ID3D12Device12 {
    /**
     * The interface identifier for ID3D12Device13
     * @type {Guid}
     */
    static IID := Guid("{14eecffc-4df8-40f7-a118-5c816f45695e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device13 interfaces
    */
    struct Vtbl extends ID3D12Device12.Vtbl {
        OpenExistingHeapFromAddress1 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device13.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Void>} pAddress 
     * @param {Pointer} _size 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    OpenExistingHeapFromAddress1(pAddress, _size, riid) {
        pAddressMarshal := pAddress is VarRef ? "ptr" : "ptr"

        result := ComCall(81, this, pAddressMarshal, pAddress, "ptr", _size, Guid.Ptr, riid, "ptr*", &ppvHeap := 0, "HRESULT")
        return ppvHeap
    }

    Query(iid) {
        if (ID3D12Device13.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OpenExistingHeapFromAddress1 := CallbackCreate(GetMethod(implObj, "OpenExistingHeapFromAddress1"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OpenExistingHeapFromAddress1)
    }
}
