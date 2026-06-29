#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsCaseIgnoreList interface provides methods for an ADSI client to access the Case Ignore List attribute. You can call the property methods of this interface to obtain and modify the attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadscaseignorelist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsCaseIgnoreList extends IDispatch {
    /**
     * The interface identifier for IADsCaseIgnoreList
     * @type {Guid}
     */
    static IID := Guid("{7b66b533-4680-11d1-a3b4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsCaseIgnoreList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_CaseIgnoreList : IntPtr
        put_CaseIgnoreList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsCaseIgnoreList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    CaseIgnoreList {
        get => this.get_CaseIgnoreList()
        set => this.put_CaseIgnoreList(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CaseIgnoreList() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vCaseIgnoreList 
     * @returns {HRESULT} 
     */
    put_CaseIgnoreList(vCaseIgnoreList) {
        result := ComCall(8, this, VARIANT, vCaseIgnoreList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsCaseIgnoreList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CaseIgnoreList := CallbackCreate(GetMethod(implObj, "get_CaseIgnoreList"), flags, 2)
        this.vtbl.put_CaseIgnoreList := CallbackCreate(GetMethod(implObj, "put_CaseIgnoreList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CaseIgnoreList)
        CallbackFree(this.vtbl.put_CaseIgnoreList)
    }
}
