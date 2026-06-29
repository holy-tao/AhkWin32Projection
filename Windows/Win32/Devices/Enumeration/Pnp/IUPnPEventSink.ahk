#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IUPnPEventSink interface allows a hosted service to send event notifications to the device host.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpeventsink
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPEventSink extends IUnknown {
    /**
     * The interface identifier for IUPnPEventSink
     * @type {Guid}
     */
    static IID := Guid("{204810b4-73b2-11d4-bf42-00b0d0118b56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPEventSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStateChanged     : IntPtr
        OnStateChangedSafe : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPEventSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnStateChanged method sends an event to the device host with the list of DISPIDs of the state variables that have changed. The device host must query the service object to obtain the new value for each state variable that has changed.
     * @param {Integer} cChanges Specifies the number of variables in <i>rgdispidChanges</i>. The value indicates the number of variables whose values have changed.
     * @param {Pointer<Integer>} rgdispidChanges Contains a list of the DISPIDs of the state variables that have changed. The number of elements in this buffer is specified by <i>cChanges</i>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * 
     * If <i>cChanges</i> is zero or <i>rgdispidChanges</i> is <b>NULL</b>, E_INVALIDARG is returned.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsink-onstatechanged
     */
    OnStateChanged(cChanges, rgdispidChanges) {
        rgdispidChangesMarshal := rgdispidChanges is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, rgdispidChangesMarshal, rgdispidChanges, "HRESULT")
        return result
    }

    /**
     * The OnStateChangedSafe method sends an event to the device host with the list of DISPIDs that have changed. The device host must query the service object to obtain the new value for each state variable that has changed.
     * @param {VARIANT} varsadispidChanges Contains a safearray of the DISPIDs of the state variables that have changed.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsink-onstatechangedsafe
     */
    OnStateChangedSafe(varsadispidChanges) {
        result := ComCall(4, this, VARIANT, varsadispidChanges, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPEventSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStateChanged := CallbackCreate(GetMethod(implObj, "OnStateChanged"), flags, 3)
        this.vtbl.OnStateChangedSafe := CallbackCreate(GetMethod(implObj, "OnStateChangedSafe"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStateChanged)
        CallbackFree(this.vtbl.OnStateChangedSafe)
    }
}
