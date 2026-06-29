#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnConnection.ahk" { IMbnConnection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This notification interface signals an application about the arrival and removal of IMbnConnection interfaces in the system.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionmanager">IMbnConnectionManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnConnectionManagerEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnConnectionManagerEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectionmanagerevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionManagerEvents extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-201e-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnectionArrival : IntPtr
        OnConnectionRemoval : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method that indicates a new connection was added to the system.
     * @param {IMbnConnection} newConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device added to the system.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionarrival
     */
    OnConnectionArrival(newConnection) {
        result := ComCall(3, this, "ptr", newConnection, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates a connection was removed from the system.
     * @param {IMbnConnection} oldConnection An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnection">IMbnConnection</a> interface that represents the device removed from the system.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionmanagerevents-onconnectionremoval
     */
    OnConnectionRemoval(oldConnection) {
        result := ComCall(4, this, "ptr", oldConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnConnectionManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnectionArrival := CallbackCreate(GetMethod(implObj, "OnConnectionArrival"), flags, 2)
        this.vtbl.OnConnectionRemoval := CallbackCreate(GetMethod(implObj, "OnConnectionRemoval"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnectionArrival)
        CallbackFree(this.vtbl.OnConnectionRemoval)
    }
}
