#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IUpdate3.ahk" { IUpdate3 }

/**
 * Contains the properties and methods that are available to an update. (IUpdate4)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdate4
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdate4 extends IUpdate3 {
    /**
     * The interface identifier for IUpdate4
     * @type {Guid}
     */
    static IID := Guid("{27e94b0d-5139-49a2-9a61-93522dc54652}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdate4 interfaces
    */
    struct Vtbl extends IUpdate3.Vtbl {
        get_PerUser : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdate4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PerUser {
        get => this.get_PerUser()
    }

    /**
     * Gets a Boolean value that indicates whether this is a per-user update.
     * @remarks
     * Per-user updates are  designed to alter the current user’s environment only; not the environment of the machine as a whole. For example, an update which only alters files in the current user’s user directory could be a per-user update; an update which alters files in the Program Files directory or the Windows directory would not be a per-user update. Per-user updates are currently not processed by Automatic Updates or displayed in the Windows Update user interface. Instead, they are only available to callers who specifically request them in searches by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher3">IUpdateSearcher3</a> interface.  On computers running versions of Windows Update Agent that do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate4">IUpdate4</a> interface, only per-machine updates will be available; per-user updates will never be detected.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdate4-get_peruser
     */
    get_PerUser() {
        result := ComCall(57, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdate4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PerUser := CallbackCreate(GetMethod(implObj, "get_PerUser"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PerUser)
    }
}
