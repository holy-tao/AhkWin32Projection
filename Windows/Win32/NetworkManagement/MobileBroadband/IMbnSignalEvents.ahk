#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMbnSignal.ahk" { IMbnSignal }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Notification interface used to indicate that a signal event has occurred.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnSignalEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnSignalEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsignalevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSignalEvents extends IUnknown {
    /**
     * The interface identifier for IMbnSignalEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2004-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSignalEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSignalStateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSignalEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This notification method is called by the Mobile Broadband service to indicate that a signal quality update is available.
     * @remarks
     * <b>OnSignalStateChange</b> is called by the Mobile Broadband service to notify a calling application that a signal quality update is available.  This includes an update of the signal notification period, threshold for signal notification, signal strength received, and error rate in the received signal. 
     * An application can get updated values from the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsignal">IMbnSignal</a> interface passed in this method.
     * @param {IMbnSignal} newInterface Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsignal">IMbnSignal</a> interface  for which the signal quality update was received.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsignalevents-onsignalstatechange
     */
    OnSignalStateChange(newInterface) {
        result := ComCall(3, this, "ptr", newInterface, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnSignalEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSignalStateChange := CallbackCreate(GetMethod(implObj, "OnSignalStateChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSignalStateChange)
    }
}
