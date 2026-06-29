#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SearchScope.ahk" { SearchScope }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdateSearcher2.ahk" { IUpdateSearcher2 }

/**
 * Searches for updates on a server. (IUpdateSearcher3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesearcher3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateSearcher3 extends IUpdateSearcher2 {
    /**
     * The interface identifier for IUpdateSearcher3
     * @type {Guid}
     */
    static IID := Guid("{04c6895d-eaf2-4034-97f3-311de9be413a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateSearcher3 interfaces
    */
    struct Vtbl extends IUpdateSearcher2.Vtbl {
        get_SearchScope : IntPtr
        put_SearchScope : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateSearcher3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SearchScope} 
     */
    SearchScope {
        get => this.get_SearchScope()
        set => this.put_SearchScope(value)
    }

    /**
     * 
     * @returns {SearchScope} 
     */
    get_SearchScope() {
        result := ComCall(27, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {SearchScope} value 
     * @returns {HRESULT} 
     */
    put_SearchScope(value) {
        result := ComCall(28, this, SearchScope, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateSearcher3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SearchScope := CallbackCreate(GetMethod(implObj, "get_SearchScope"), flags, 2)
        this.vtbl.put_SearchScope := CallbackCreate(GetMethod(implObj, "put_SearchScope"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SearchScope)
        CallbackFree(this.vtbl.put_SearchScope)
    }
}
