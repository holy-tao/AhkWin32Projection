#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWindowsDriverUpdate2.ahk" { IWindowsDriverUpdate2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Contains the properties and methods that are available only from a Windows driver update. (IWindowsDriverUpdate3)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwindowsdriverupdate3
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWindowsDriverUpdate3 extends IWindowsDriverUpdate2 {
    /**
     * The interface identifier for IWindowsDriverUpdate3
     * @type {Guid}
     */
    static IID := Guid("{49ebd502-4a96-41bd-9e3e-4c5057f4250c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDriverUpdate3 interfaces
    */
    struct Vtbl extends IWindowsDriverUpdate2.Vtbl {
        get_BrowseOnly : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDriverUpdate3.Vtbl()
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
     * Gets a Boolean value that indicates whether an update can be discovered only by browsing through the available updates. (IWindowsDriverUpdate3.get_BrowseOnly)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate3-get_browseonly
     */
    get_BrowseOnly() {
        result := ComCall(64, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IWindowsDriverUpdate3.IID.Equals(iid)) {
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
