#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataFilter extends IUnknown {
    /**
     * The interface identifier for IMetaDataFilter
     * @type {Guid}
     */
    static IID := Guid("{d0e80dd1-12d4-11d3-b39d-00c04ff81795}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UnmarkAll     : IntPtr
        MarkToken     : IntPtr
        IsTokenMarked : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnmarkAll() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @returns {HRESULT} 
     */
    MarkToken(tk) {
        result := ComCall(4, this, "uint", tk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<BOOL>} pIsMarked 
     * @returns {HRESULT} 
     */
    IsTokenMarked(tk, pIsMarked) {
        pIsMarkedMarshal := pIsMarked is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "uint", tk, pIsMarkedMarshal, pIsMarked, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMetaDataFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UnmarkAll := CallbackCreate(GetMethod(implObj, "UnmarkAll"), flags, 1)
        this.vtbl.MarkToken := CallbackCreate(GetMethod(implObj, "MarkToken"), flags, 2)
        this.vtbl.IsTokenMarked := CallbackCreate(GetMethod(implObj, "IsTokenMarked"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UnmarkAll)
        CallbackFree(this.vtbl.MarkToken)
        CallbackFree(this.vtbl.IsTokenMarked)
    }
}
