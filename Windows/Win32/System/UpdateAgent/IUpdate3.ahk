#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdate2.ahk" { IUpdate2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains the properties and methods that are available to an update. (IUpdate3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdate3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdate3 extends IUpdate2 {
    /**
     * The interface identifier for IUpdate3
     * @type {Guid}
     */
    static IID := Guid("{112eda6b-95b3-476f-9d90-aee82c6b8181}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdate3 interfaces
    */
    struct Vtbl extends IUpdate2.Vtbl {
        get_BrowseOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdate3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BrowseOnly {
        get => this.get_BrowseOnly()
    }

    /**
     * Gets a Boolean value that indicates whether an update can be discovered only by browsing through the available updates. (IUpdate3.get_BrowseOnly)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate3-get_browseonly
     */
    get_BrowseOnly() {
        result := ComCall(56, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdate3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_BrowseOnly := CallbackCreate(GetMethod(implObj, "get_BrowseOnly"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_BrowseOnly)
    }
}
