#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\TAPI_EVENT.ahk" { TAPI_EVENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITTAPIEventNotification interface is an outgoing interface that allows an application to control the processing of event information.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-ittapieventnotification
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITTAPIEventNotification extends IUnknown {
    /**
     * The interface identifier for ITTAPIEventNotification
     * @type {Guid}
     */
    static IID := Guid("{eddb9426-3b91-11d1-8f30-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITTAPIEventNotification interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Event : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITTAPIEventNotification.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Event method is called by TAPI to determine the response to an asynchronous event notification.
     * @remarks
     * You must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-ittapi-put_eventfilter">ITTAPI::put_EventFilter</a> method to set the event filter mask and enable reception of events. If you do not call <b>ITTAPI::put_EventFilter</b>, your application will not receive any events.
     * @param {TAPI_EVENT} TapiEvent <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-tapi_event">TAPI_EVENT</a> indicator of the event.
     * @param {IDispatch} pEvent Pointer to an <b>IDispatch</b> interface of the object associated with this event.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pEvent</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-ittapieventnotification-event
     */
    Event(TapiEvent, pEvent) {
        result := ComCall(3, this, TAPI_EVENT, TapiEvent, "ptr", pEvent, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITTAPIEventNotification.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Event := CallbackCreate(GetMethod(implObj, "Event"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Event)
    }
}
