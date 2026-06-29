#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ISearchCatalogManager2.ahk" { ISearchCatalogManager2 }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchCatalogManager3 extends ISearchCatalogManager2 {
    /**
     * The interface identifier for ISearchCatalogManager3
     * @type {Guid}
     */
    static IID := Guid("{de837e8f-634f-4ab0-bdfc-9fc3a1fc50dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCatalogManager3 interfaces
    */
    struct Vtbl extends ISearchCatalogManager2.Vtbl {
        IsContainsSemanticSupported : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCatalogManager3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsContainsSemanticSupported() {
        result := ComCall(30, this, BOOL.Ptr, &isContainsSemanticSupported := 0, "HRESULT")
        return isContainsSemanticSupported
    }

    Query(iid) {
        if (ISearchCatalogManager3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsContainsSemanticSupported := CallbackCreate(GetMethod(implObj, "IsContainsSemanticSupported"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsContainsSemanticSupported)
    }
}
