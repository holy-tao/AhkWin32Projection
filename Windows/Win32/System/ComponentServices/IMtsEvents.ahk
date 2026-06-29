#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides methods for obtaining information about the running package and establishing event sinks.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-imtsevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IMtsEvents extends IDispatch {
    /**
     * The interface identifier for IMtsEvents
     * @type {Guid}
     */
    static IID := Guid("{bacedf4d-74ab-11d0-b162-00aa00ba3258}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMtsEvents interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PackageName : IntPtr
        get_PackageGuid : IntPtr
        PostEvent       : IntPtr
        get_FireEvents  : IntPtr
        GetProcessID    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMtsEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    PackageName {
        get => this.get_PackageName()
    }

    /**
     * @type {BSTR} 
     */
    PackageGuid {
        get => this.get_PackageGuid()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    FireEvents {
        get => this.get_FireEvents()
    }

    /**
     * Retrieves the name of the package in which the instance of the object that implements the IMtsEvents interface is running.
     * @returns {BSTR} A pointer to the package name string.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_packagename
     */
    get_PackageName() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the globally unique identifier (GUID) for the package in which the event occurred.
     * @returns {BSTR} A pointer to the package GUID.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_packageguid
     */
    get_PackageGuid() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Posts a user-defined event to an event sink.
     * @param {Pointer<VARIANT>} vEvent A pointer to the name of the event.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-postevent
     */
    PostEvent(vEvent) {
        result := ComCall(9, this, VARIANT.Ptr, vEvent, "HRESULT")
        return result
    }

    /**
     * Retrieves whether events are enabled or disabled for an event sink.
     * @returns {VARIANT_BOOL} Indicates whether events are enabled or disabled for an event sink.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-get_fireevents
     */
    get_FireEvents() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the identifier of the process in which the event occurred.
     * @returns {Integer} A pointer to the process identification for the event.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-imtsevents-getprocessid
     */
    GetProcessID() {
        result := ComCall(11, this, "int*", &id := 0, "HRESULT")
        return id
    }

    Query(iid) {
        if (IMtsEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PackageName := CallbackCreate(GetMethod(implObj, "get_PackageName"), flags, 2)
        this.vtbl.get_PackageGuid := CallbackCreate(GetMethod(implObj, "get_PackageGuid"), flags, 2)
        this.vtbl.PostEvent := CallbackCreate(GetMethod(implObj, "PostEvent"), flags, 2)
        this.vtbl.get_FireEvents := CallbackCreate(GetMethod(implObj, "get_FireEvents"), flags, 2)
        this.vtbl.GetProcessID := CallbackCreate(GetMethod(implObj, "GetProcessID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PackageName)
        CallbackFree(this.vtbl.get_PackageGuid)
        CallbackFree(this.vtbl.PostEvent)
        CallbackFree(this.vtbl.get_FireEvents)
        CallbackFree(this.vtbl.GetProcessID)
    }
}
