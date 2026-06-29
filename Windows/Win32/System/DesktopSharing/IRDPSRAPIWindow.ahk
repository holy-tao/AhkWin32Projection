#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPIApplication.ahk" { IRDPSRAPIApplication }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents a one-to-one mapping to a sharable window.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiwindow
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIWindow extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIWindow
     * @type {Guid}
     */
    static IID := Guid("{beafe0f9-c77b-4933-ba9f-a24cddcc27cf}")

    /**
     * The class identifier for RDPSRAPIWindow
     * @type {Guid}
     */
    static CLSID := Guid("{03cf46db-ce45-4d36-86ed-ed28b74398bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIWindow interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id          : IntPtr
        get_Application : IntPtr
        get_Shared      : IntPtr
        put_Shared      : IntPtr
        get_Name        : IntPtr
        Show            : IntPtr
        get_Flags       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIWindow.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {IRDPSRAPIApplication} 
     */
    Application {
        get => this.get_Application()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Shared {
        get => this.get_Shared()
        set => this.put_Shared(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * Returns the ID of a window.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Returns a pointer to the application object that the window belongs to.
     * @returns {IRDPSRAPIApplication} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_application
     */
    get_Application() {
        result := ComCall(8, this, "ptr*", &pApplication := 0, "HRESULT")
        return IRDPSRAPIApplication(pApplication)
    }

    /**
     * Gets or sets the sharing property for a window. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_shared
     */
    get_Shared() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Gets or sets the sharing property for a window. (Put)
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-put_shared
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, VARIANT_BOOL, NewVal, "HRESULT")
        return result
    }

    /**
     * Returns the name for the window object.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_name
     */
    get_Name() {
        pRetVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Brings the current window to the foreground.
     * @returns {HRESULT} If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-show
     */
    Show() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Returns the flags on the current window.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_flags
     */
    get_Flags() {
        result := ComCall(13, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (IRDPSRAPIWindow.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Application := CallbackCreate(GetMethod(implObj, "get_Application"), flags, 2)
        this.vtbl.get_Shared := CallbackCreate(GetMethod(implObj, "get_Shared"), flags, 2)
        this.vtbl.put_Shared := CallbackCreate(GetMethod(implObj, "put_Shared"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 1)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Application)
        CallbackFree(this.vtbl.get_Shared)
        CallbackFree(this.vtbl.put_Shared)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.get_Flags)
    }
}
