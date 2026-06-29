#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IWindowsDriverUpdate3.ahk" { IWindowsDriverUpdate3 }
#Import ".\IWindowsDriverUpdateEntryCollection.ahk" { IWindowsDriverUpdateEntryCollection }

/**
 * Contains the properties and methods that are available only from a Windows driver update. (IWindowsDriverUpdate4)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwindowsdriverupdate4
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWindowsDriverUpdate4 extends IWindowsDriverUpdate3 {
    /**
     * The interface identifier for IWindowsDriverUpdate4
     * @type {Guid}
     */
    static IID := Guid("{004c6a2b-0c19-4c69-9f5c-a269b2560db9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDriverUpdate4 interfaces
    */
    struct Vtbl extends IWindowsDriverUpdate3.Vtbl {
        get_WindowsDriverUpdateEntries : IntPtr
        get_PerUser                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDriverUpdate4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IWindowsDriverUpdateEntryCollection} 
     */
    WindowsDriverUpdateEntries {
        get => this.get_WindowsDriverUpdateEntries()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PerUser {
        get => this.get_PerUser()
    }

    /**
     * Gets the driver update entries that are applicable for the update.
     * @returns {IWindowsDriverUpdateEntryCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate4-get_windowsdriverupdateentries
     */
    get_WindowsDriverUpdateEntries() {
        result := ComCall(65, this, "ptr*", &retval := 0, "HRESULT")
        return IWindowsDriverUpdateEntryCollection(retval)
    }

    /**
     * Gets a Boolean value that indicates whether an update is a per-user update.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate4-get_peruser
     */
    get_PerUser() {
        result := ComCall(66, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IWindowsDriverUpdate4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_WindowsDriverUpdateEntries := CallbackCreate(GetMethod(implObj, "get_WindowsDriverUpdateEntries"), flags, 2)
        this.vtbl.get_PerUser := CallbackCreate(GetMethod(implObj, "get_PerUser"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_WindowsDriverUpdateEntries)
        CallbackFree(this.vtbl.get_PerUser)
    }
}
