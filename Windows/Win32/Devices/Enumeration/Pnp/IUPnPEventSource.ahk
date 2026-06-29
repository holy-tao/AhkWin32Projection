#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUPnPEventSink.ahk" { IUPnPEventSink }

/**
 * The IUPnPEventSource interface allows the device host to manage event subscriptions for the hosted service.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpeventsource
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPEventSource extends IUnknown {
    /**
     * The interface identifier for IUPnPEventSource
     * @type {Guid}
     */
    static IID := Guid("{204810b5-73b2-11d4-bf42-00b0d0118b56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPEventSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Advise   : IntPtr
        Unadvise : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPEventSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Advise method is invoked by the device host to begin receiving events from the hosted service.
     * @param {IUPnPEventSink} pesSubscriber Pointer to the device host's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nn-upnphost-iupnpeventsink">IUPnPEventSink</a> interface.
     * @returns {HRESULT} When implementing this method, return S_OK if the method succeeds. Otherwise, return one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsource-advise
     */
    Advise(pesSubscriber) {
        result := ComCall(3, this, "ptr", pesSubscriber, "HRESULT")
        return result
    }

    /**
     * The Unadvise method is invoked by the device host to stop receiving events. The device host passes in the same pointer that it did when it invoked the IUPnPEventSource::Advise method.
     * @param {IUPnPEventSink} pesSubscriber Pointer to the device host's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nn-upnphost-iupnpeventsink">IUPnPEventSink</a> interface. This must be the same pointer that was passed when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpeventsource-advise">IUPnPEventSource::Advise</a> was invoked.
     * @returns {HRESULT} When implementing this method, return S_OK if the method succeeds. Otherwise, return one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpeventsource-unadvise
     */
    Unadvise(pesSubscriber) {
        result := ComCall(4, this, "ptr", pesSubscriber, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUPnPEventSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 2)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
    }
}
