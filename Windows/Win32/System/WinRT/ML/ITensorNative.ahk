#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ITensorNative extends IUnknown {
    /**
     * The interface identifier for ITensorNative
     * @type {Guid}
     */
    static IID := Guid("{52f547ef-5b03-49b5-82d6-565f1ee0dd49}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITensorNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBuffer        : IntPtr
        GetD3D12Resource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITensorNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} value 
     * @param {Pointer<Integer>} capacity 
     * @returns {HRESULT} 
     */
    GetBuffer(value, capacity) {
        valueMarshal := value is VarRef ? "ptr*" : "ptr"
        capacityMarshal := capacity is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, valueMarshal, value, capacityMarshal, capacity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ID3D12Resource} 
     */
    GetD3D12Resource() {
        result := ComCall(4, this, "ptr*", &result := 0, "HRESULT")
        return ID3D12Resource(result)
    }

    Query(iid) {
        if (ITensorNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBuffer := CallbackCreate(GetMethod(implObj, "GetBuffer"), flags, 3)
        this.vtbl.GetD3D12Resource := CallbackCreate(GetMethod(implObj, "GetD3D12Resource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBuffer)
        CallbackFree(this.vtbl.GetD3D12Resource)
    }
}
