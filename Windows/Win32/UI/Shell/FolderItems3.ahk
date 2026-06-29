#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\FolderItems2.ahk" { FolderItems2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FolderItemVerbs.ahk" { FolderItemVerbs }

/**
 * Extends the FolderItems2 object. This object supports an additional method and property.
 * @see https://learn.microsoft.com/windows/win32/shell/folderitems3-object
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FolderItems3 extends FolderItems2 {
    /**
     * The interface identifier for FolderItems3
     * @type {Guid}
     */
    static IID := Guid("{eaa7c309-bbec-49d5-821d-64d966cb667f}")

    /**
     * The class identifier for FolderItems3
     * @type {Guid}
     */
    static CLSID := Guid("{eaa7c309-bbec-49d5-821d-64d966cb667f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for FolderItems3 interfaces
    */
    struct Vtbl extends FolderItems2.Vtbl {
        Filter    : IntPtr
        get_Verbs : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := FolderItems3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {FolderItemVerbs} 
     */
    Verbs {
        get => this.get_Verbs()
    }

    /**
     * Sets a wildcard filter to apply to the items returned.
     * @param {Integer} grfFlags Type: **Integer**
     * 
     * This parameter can be one of the flags listed in [**SHCONTF**](/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf).
     * @param {BSTR} bstrFileSpec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/folderitems3-filter
     */
    Filter(grfFlags, bstrFileSpec) {
        bstrFileSpec := bstrFileSpec is String ? BSTR.Alloc(bstrFileSpec).Value : bstrFileSpec

        result := ComCall(13, this, "int", grfFlags, BSTR, bstrFileSpec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FolderItemVerbs} 
     */
    get_Verbs() {
        result := ComCall(14, this, "ptr*", &ppfic := 0, "HRESULT")
        return FolderItemVerbs(ppfic)
    }

    Query(iid) {
        if (FolderItems3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Filter := CallbackCreate(GetMethod(implObj, "Filter"), flags, 3)
        this.vtbl.get_Verbs := CallbackCreate(GetMethod(implObj, "get_Verbs"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Filter)
        CallbackFree(this.vtbl.get_Verbs)
    }
}
