#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a COM+ server application is started, shut down, or forced to shut down.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomappevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComAppEvents extends IUnknown {
    /**
     * The interface identifier for IComAppEvents
     * @type {Guid}
     */
    static IID := Guid("{683130a6-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComAppEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAppActivation    : IntPtr
        OnAppShutdown      : IntPtr
        OnAppForceShutdown : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComAppEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an application server starts.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomappevents-onappactivation
     */
    OnAppActivation(pInfo, guidApp) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when an application server shuts down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomappevents-onappshutdown
     */
    OnAppShutdown(pInfo, guidApp) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when an application server is forced to shut down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The globally unique identifier (GUID) of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomappevents-onappforceshutdown
     */
    OnAppForceShutdown(pInfo, guidApp) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComAppEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAppActivation := CallbackCreate(GetMethod(implObj, "OnAppActivation"), flags, 3)
        this.vtbl.OnAppShutdown := CallbackCreate(GetMethod(implObj, "OnAppShutdown"), flags, 3)
        this.vtbl.OnAppForceShutdown := CallbackCreate(GetMethod(implObj, "OnAppForceShutdown"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAppActivation)
        CallbackFree(this.vtbl.OnAppShutdown)
        CallbackFree(this.vtbl.OnAppForceShutdown)
    }
}
