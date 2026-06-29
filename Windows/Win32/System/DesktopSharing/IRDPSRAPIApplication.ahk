#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRDPSRAPIWindowList.ahk" { IRDPSRAPIWindowList }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Groups the sharable windows within a process. Each application object contains a list of window objects. If an application object is shared, all its windows are shared.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiapplication
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIApplication extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIApplication
     * @type {Guid}
     */
    static IID := Guid("{41e7a09d-eb7a-436e-935d-780ca2628324}")

    /**
     * The class identifier for RDPSRAPIApplication
     * @type {Guid}
     */
    static CLSID := Guid("{c116a484-4b25-4b9f-8a54-b934b06e57fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIApplication interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Windows : IntPtr
        get_Id      : IntPtr
        get_Shared  : IntPtr
        put_Shared  : IntPtr
        get_Name    : IntPtr
        get_Flags   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIApplication.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRDPSRAPIWindowList} 
     */
    Windows {
        get => this.get_Windows()
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
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
     * The list of windows.
     * @returns {IRDPSRAPIWindowList} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_windows
     */
    get_Windows() {
        result := ComCall(7, this, "ptr*", &pWindowList := 0, "HRESULT")
        return IRDPSRAPIWindowList(pWindowList)
    }

    /**
     * The application identifier.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_id
     */
    get_Id() {
        result := ComCall(8, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The sharing state. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_shared
     */
    get_Shared() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The sharing state. (Put)
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-put_shared
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, VARIANT_BOOL, NewVal, "HRESULT")
        return result
    }

    /**
     * The name of the application.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_name
     */
    get_Name() {
        pRetVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * The sharing flags.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_flags
     */
    get_Flags() {
        result := ComCall(12, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    Query(iid) {
        if (IRDPSRAPIApplication.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Windows := CallbackCreate(GetMethod(implObj, "get_Windows"), flags, 2)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Shared := CallbackCreate(GetMethod(implObj, "get_Shared"), flags, 2)
        this.vtbl.put_Shared := CallbackCreate(GetMethod(implObj, "put_Shared"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Windows)
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Shared)
        CallbackFree(this.vtbl.put_Shared)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Flags)
    }
}
