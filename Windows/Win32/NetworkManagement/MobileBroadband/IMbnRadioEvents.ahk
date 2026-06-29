#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnRadio.ahk" { IMbnRadio }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Notification interface used to indicate a change in the radio state as well as the completion of a programmatic change in the state .
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a> interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnRadioEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnRadioEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnradioevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnRadioEvents extends IUnknown {
    /**
     * The interface identifier for IMbnRadioEvents
     * @type {Guid}
     */
    static IID := Guid("{dcdddab6-201f-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnRadioEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnRadioStateChange              : IntPtr
        OnSetSoftwareRadioStateComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnRadioEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * A notification signaling that the radio state of the device has changed.
     * @remarks
     * New software and hardware radio states can be obtained from the passed <i>newInterface</i> object.
     * @param {IMbnRadio} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnradio">IMbnRadio</a> interface representing the device for which the radio state has changed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradioevents-onradiostatechange
     */
    OnRadioStateChange(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    /**
     * Notification that a set software radio state operation has completed.
     * @param {IMbnRadio} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnradio">IMbnRadio</a> interface representing the device for which a set radio state operation has completed.
     * @param {Integer} requestID The request ID set by the Mobile Broadband service to identify the request.
     * @param {HRESULT} _status A status code that indicates the outcome of the set radio state operation.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnradioevents-onsetsoftwareradiostatecomplete
     */
    OnSetSoftwareRadioStateComplete(newInterface, requestID, _status) {
        result := ComCall(4, this, "ptr", newInterface, "uint", requestID, "int", _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnRadioEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnRadioStateChange := CallbackCreate(GetMethod(implObj, "OnRadioStateChange"), flags, 2)
        this.vtbl.OnSetSoftwareRadioStateComplete := CallbackCreate(GetMethod(implObj, "OnSetSoftwareRadioStateComplete"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnRadioStateChange)
        CallbackFree(this.vtbl.OnSetSoftwareRadioStateComplete)
    }
}
