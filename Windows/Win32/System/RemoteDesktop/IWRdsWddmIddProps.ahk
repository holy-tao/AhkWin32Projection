#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\HANDLE_PTR.ahk" { HANDLE_PTR }

/**
 * This interface allows a custom IDD driver to be loaded in a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdswddmiddprops
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsWddmIddProps extends IUnknown {
    /**
     * The interface identifier for IWRdsWddmIddProps
     * @type {Guid}
     */
    static IID := Guid("{1382df4d-a289-43d1-a184-144726f9af90}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsWddmIddProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHardwareId  : IntPtr
        OnDriverLoad   : IntPtr
        OnDriverUnload : IntPtr
        EnableWddmIdd  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsWddmIddProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Protocol stack uses this method to return hardware Id of WDDM ID driver.
     * @param {PWSTR} pDisplayDriverHardwareId Pointer to an array that contains the hardware ID.
     * @param {Integer} Count Size in elements of the hardware ID string.
     * @returns {HRESULT} S_OK or error code
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-gethardwareid
     */
    GetHardwareId(pDisplayDriverHardwareId, Count) {
        pDisplayDriverHardwareId := pDisplayDriverHardwareId is String ? StrPtr(pDisplayDriverHardwareId) : pDisplayDriverHardwareId

        result := ComCall(3, this, "ptr", pDisplayDriverHardwareId, "uint", Count, "HRESULT")
        return result
    }

    /**
     * Termsrv uses this method to return a handle of the loaded WDDM ID driver to the protocol stack. From this point the stack owns the handle and needs to call CloseHandle() after communication with the driver is no longer needed.
     * @param {Integer} SessionId ID of the session that the driver is loaded for.
     * @param {HANDLE_PTR} DriverHandle Opened handle of the WDDM ID driver.
     * @returns {HRESULT} S_OK or error code
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-ondriverload
     */
    OnDriverLoad(SessionId, DriverHandle) {
        result := ComCall(4, this, "uint", SessionId, HANDLE_PTR, DriverHandle, "HRESULT")
        return result
    }

    /**
     * Termsrv uses this method to tell the protocol stack that PnP unloaded the WDDM ID driver.
     * @param {Integer} SessionId ID of a session driver is unloaded from.
     * @returns {HRESULT} Returns S_OK or error code
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-ondriverunload
     */
    OnDriverUnload(SessionId) {
        result := ComCall(5, this, "uint", SessionId, "HRESULT")
        return result
    }

    /**
     * Termsrv uses this method to tell protocol stack which mode it is operating.
     * @param {BOOL} Enabled Boolean flag that instructs protocol stack that termsrv supports WDDM IDD mode.
     * @returns {HRESULT} S_OK or error code.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdswddmiddprops-enablewddmidd
     */
    EnableWddmIdd(Enabled) {
        result := ComCall(6, this, BOOL, Enabled, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsWddmIddProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHardwareId := CallbackCreate(GetMethod(implObj, "GetHardwareId"), flags, 3)
        this.vtbl.OnDriverLoad := CallbackCreate(GetMethod(implObj, "OnDriverLoad"), flags, 3)
        this.vtbl.OnDriverUnload := CallbackCreate(GetMethod(implObj, "OnDriverUnload"), flags, 2)
        this.vtbl.EnableWddmIdd := CallbackCreate(GetMethod(implObj, "EnableWddmIdd"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHardwareId)
        CallbackFree(this.vtbl.OnDriverLoad)
        CallbackFree(this.vtbl.OnDriverUnload)
        CallbackFree(this.vtbl.EnableWddmIdd)
    }
}
