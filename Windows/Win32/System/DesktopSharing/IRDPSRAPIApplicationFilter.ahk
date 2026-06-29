#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRDPSRAPIWindowList.ahk" { IRDPSRAPIWindowList }
#Import ".\IRDPSRAPIApplicationList.ahk" { IRDPSRAPIApplicationList }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Manages the shared desktop area at the window and process level. Applications can use the enumerators to display lists of objects in the session that can be shared.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiapplicationfilter
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIApplicationFilter extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIApplicationFilter
     * @type {Guid}
     */
    static IID := Guid("{d20f10ca-6637-4f06-b1d5-277ea7e5160d}")

    /**
     * The class identifier for RDPSRAPIApplicationFilter
     * @type {Guid}
     */
    static CLSID := Guid("{e35ace89-c7e8-427e-a4f9-b9da072826bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIApplicationFilter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Applications : IntPtr
        get_Windows      : IntPtr
        get_Enabled      : IntPtr
        put_Enabled      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIApplicationFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRDPSRAPIApplicationList} 
     */
    Applications {
        get => this.get_Applications()
    }

    /**
     * @type {IRDPSRAPIWindowList} 
     */
    Windows {
        get => this.get_Windows()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * The list of sharable applications.
     * @returns {IRDPSRAPIApplicationList} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_applications
     */
    get_Applications() {
        result := ComCall(7, this, "ptr*", &pApplications := 0, "HRESULT")
        return IRDPSRAPIApplicationList(pApplications)
    }

    /**
     * The list of sharable windows.
     * @remarks
     * The window objects are also available through the list returned by <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_windows">IRDPSRAPIApplication::Windows</a>. The windows are also exposed by the application filter because it provides easy access to all windows in the session, especially for applications that share only at the window level.
     * @returns {IRDPSRAPIWindowList} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_windows
     */
    get_Windows() {
        result := ComCall(8, this, "ptr*", &pWindows := 0, "HRESULT")
        return IRDPSRAPIWindowList(pWindows)
    }

    /**
     * The enabled state of the application filter. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_enabled
     */
    get_Enabled() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The enabled state of the application filter. (Put)
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-put_enabled
     */
    put_Enabled(NewVal) {
        result := ComCall(10, this, VARIANT_BOOL, NewVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPIApplicationFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Applications := CallbackCreate(GetMethod(implObj, "get_Applications"), flags, 2)
        this.vtbl.get_Windows := CallbackCreate(GetMethod(implObj, "get_Windows"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Applications)
        CallbackFree(this.vtbl.get_Windows)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
    }
}
