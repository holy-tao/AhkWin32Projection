#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\StorageKind.ahk" { StorageKind }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugHostFunctionLocalStorage extends IUnknown {
    /**
     * The interface identifier for IDebugHostFunctionLocalStorage
     * @type {Guid}
     */
    static IID := Guid("{2f2f303b-39be-4b6d-9bfb-4faa49dbbd45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugHostFunctionLocalStorage interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetValidRange  : IntPtr
        GetStorageKind : IntPtr
        GetRegister    : IntPtr
        GetOffset      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugHostFunctionLocalStorage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} start 
     * @param {Pointer<Integer>} end 
     * @param {Pointer<Boolean>} guaranteed 
     * @returns {HRESULT} 
     */
    GetValidRange(start, end, guaranteed) {
        startMarshal := start is VarRef ? "uint*" : "ptr"
        endMarshal := end is VarRef ? "uint*" : "ptr"
        guaranteedMarshal := guaranteed is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, startMarshal, start, endMarshal, end, guaranteedMarshal, guaranteed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {StorageKind} 
     */
    GetStorageKind() {
        result := ComCall(4, this, "int*", &kind := 0, "HRESULT")
        return kind
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRegister() {
        result := ComCall(5, this, "uint*", &registerId := 0, "HRESULT")
        return registerId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(6, this, "int64*", &offset := 0, "HRESULT")
        return offset
    }

    Query(iid) {
        if (IDebugHostFunctionLocalStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetValidRange := CallbackCreate(GetMethod(implObj, "GetValidRange"), flags, 4)
        this.vtbl.GetStorageKind := CallbackCreate(GetMethod(implObj, "GetStorageKind"), flags, 2)
        this.vtbl.GetRegister := CallbackCreate(GetMethod(implObj, "GetRegister"), flags, 2)
        this.vtbl.GetOffset := CallbackCreate(GetMethod(implObj, "GetOffset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetValidRange)
        CallbackFree(this.vtbl.GetStorageKind)
        CallbackFree(this.vtbl.GetRegister)
        CallbackFree(this.vtbl.GetOffset)
    }
}
