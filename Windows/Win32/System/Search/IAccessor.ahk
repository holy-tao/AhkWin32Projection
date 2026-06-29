#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DBBINDING.ahk" { DBBINDING }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\HACCESSOR.ahk" { HACCESSOR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct IAccessor extends IUnknown {
    /**
     * The interface identifier for IAccessor
     * @type {Guid}
     */
    static IID := Guid("{0c733a8c-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccessor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddRefAccessor  : IntPtr
        CreateAccessor  : IntPtr
        GetBindings     : IntPtr
        ReleaseAccessor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Integer} 
     */
    AddRefAccessor(_hAccessor) {
        result := ComCall(3, this, HACCESSOR, _hAccessor, "uint*", &pcRefCount := 0, "HRESULT")
        return pcRefCount
    }

    /**
     * 
     * @param {Integer} dwAccessorFlags 
     * @param {Pointer} cBindings 
     * @param {Pointer<DBBINDING>} rgBindings 
     * @param {Pointer} cbRowSize 
     * @param {Pointer<HACCESSOR>} phAccessor 
     * @param {Pointer<Integer>} rgStatus 
     * @returns {HRESULT} 
     */
    CreateAccessor(dwAccessorFlags, cBindings, rgBindings, cbRowSize, phAccessor, rgStatus) {
        rgStatusMarshal := rgStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwAccessorFlags, "ptr", cBindings, DBBINDING.Ptr, rgBindings, "ptr", cbRowSize, HACCESSOR.Ptr, phAccessor, rgStatusMarshal, rgStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer<Integer>} pdwAccessorFlags 
     * @param {Pointer<Pointer>} pcBindings 
     * @param {Pointer<Pointer<DBBINDING>>} prgBindings 
     * @returns {HRESULT} 
     */
    GetBindings(_hAccessor, pdwAccessorFlags, pcBindings, prgBindings) {
        pdwAccessorFlagsMarshal := pdwAccessorFlags is VarRef ? "uint*" : "ptr"
        pcBindingsMarshal := pcBindings is VarRef ? "ptr*" : "ptr"
        prgBindingsMarshal := prgBindings is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, HACCESSOR, _hAccessor, pdwAccessorFlagsMarshal, pdwAccessorFlags, pcBindingsMarshal, pcBindings, prgBindingsMarshal, prgBindings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @returns {Integer} 
     */
    ReleaseAccessor(_hAccessor) {
        result := ComCall(6, this, HACCESSOR, _hAccessor, "uint*", &pcRefCount := 0, "HRESULT")
        return pcRefCount
    }

    Query(iid) {
        if (IAccessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddRefAccessor := CallbackCreate(GetMethod(implObj, "AddRefAccessor"), flags, 3)
        this.vtbl.CreateAccessor := CallbackCreate(GetMethod(implObj, "CreateAccessor"), flags, 7)
        this.vtbl.GetBindings := CallbackCreate(GetMethod(implObj, "GetBindings"), flags, 5)
        this.vtbl.ReleaseAccessor := CallbackCreate(GetMethod(implObj, "ReleaseAccessor"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddRefAccessor)
        CallbackFree(this.vtbl.CreateAccessor)
        CallbackFree(this.vtbl.GetBindings)
        CallbackFree(this.vtbl.ReleaseAccessor)
    }
}
