#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a COM+ server application is loaded, shut down, or paused.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomapp2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComApp2Events extends IUnknown {
    /**
     * The interface identifier for IComApp2Events
     * @type {Guid}
     */
    static IID := Guid("{1290bc1a-b219-418d-b078-5934ded08242}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComApp2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAppActivation2    : IntPtr
        OnAppShutdown2      : IntPtr
        OnAppForceShutdown2 : IntPtr
        OnAppPaused2        : IntPtr
        OnAppRecycle2       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComApp2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when the server application process is loaded.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @param {Guid} guidProcess The process ID.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappactivation2
     */
    OnAppActivation2(pInfo, guidApp, guidProcess) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, Guid, guidProcess, "HRESULT")
        return result
    }

    /**
     * Generated when the server application shuts down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappshutdown2
     */
    OnAppShutdown2(pInfo, guidApp) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when the server application is forced to shut down.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onappforceshutdown2
     */
    OnAppForceShutdown2(pInfo, guidApp) {
        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, "HRESULT")
        return result
    }

    /**
     * Generated when the server application is paused or resumed to its initial state.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The GUID of the application.
     * @param {BOOL} bPaused <b>TRUE</b> if the server application is paused. <b>FALSE</b> if the application has resumed to its original state.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onapppaused2
     */
    OnAppPaused2(pInfo, guidApp, bPaused) {
        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, BOOL, bPaused, "HRESULT")
        return result
    }

    /**
     * Generated when the server application process is marked for recycling termination.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Guid} guidApp The application ID.
     * @param {Guid} guidProcess The process ID.
     * @param {Integer} lReason The reason code that explains why a process was recycled. The following codes are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_NO_REASON_SUPPLIED"></a><a id="crr_no_reason_supplied"></a><dl>
     * <dt><b>CRR_NO_REASON_SUPPLIED</b></dt>
     * <dt>0x00000000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reason is not specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_LIFETIME_LIMIT"></a><a id="crr_lifetime_limit"></a><dl>
     * <dt><b>CRR_LIFETIME_LIMIT</b></dt>
     * <dt>xFFFFFFFF</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of minutes that an application runs before recycling was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_ACTIVATION_LIMIT"></a><a id="crr_activation_limit"></a><dl>
     * <dt><b>CRR_ACTIVATION_LIMIT</b></dt>
     * <dt>0xFFFFFFFE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of activations was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_CALL_LIMIT"></a><a id="crr_call_limit"></a><dl>
     * <dt><b>CRR_CALL_LIMIT</b></dt>
     * <dt>0xFFFFFFFD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified number of calls to configured objects in the application was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_MEMORY_LIMIT"></a><a id="crr_memory_limit"></a><dl>
     * <dt><b>CRR_MEMORY_LIMIT</b></dt>
     * <dt>0xFFFFFFFC</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified memory usage that a process cannot exceed was reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CRR_RECYCLED_FROM_UI"></a><a id="crr_recycled_from_ui"></a><dl>
     * <dt><b>CRR_RECYCLED_FROM_UI</b></dt>
     * <dt>xFFFFFFFB</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An administrator decided to recycle the process through the Component Services administration tool.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomapp2events-onapprecycle2
     */
    OnAppRecycle2(pInfo, guidApp, guidProcess, lReason) {
        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid, guidApp, Guid, guidProcess, "int", lReason, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComApp2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAppActivation2 := CallbackCreate(GetMethod(implObj, "OnAppActivation2"), flags, 4)
        this.vtbl.OnAppShutdown2 := CallbackCreate(GetMethod(implObj, "OnAppShutdown2"), flags, 3)
        this.vtbl.OnAppForceShutdown2 := CallbackCreate(GetMethod(implObj, "OnAppForceShutdown2"), flags, 3)
        this.vtbl.OnAppPaused2 := CallbackCreate(GetMethod(implObj, "OnAppPaused2"), flags, 4)
        this.vtbl.OnAppRecycle2 := CallbackCreate(GetMethod(implObj, "OnAppRecycle2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAppActivation2)
        CallbackFree(this.vtbl.OnAppShutdown2)
        CallbackFree(this.vtbl.OnAppForceShutdown2)
        CallbackFree(this.vtbl.OnAppPaused2)
        CallbackFree(this.vtbl.OnAppRecycle2)
    }
}
