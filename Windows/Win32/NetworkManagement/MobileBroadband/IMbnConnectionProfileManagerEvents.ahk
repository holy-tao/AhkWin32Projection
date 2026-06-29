#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMbnConnectionProfile.ahk" { IMbnConnectionProfile }

/**
 * This notification interface signals an application about the arrival and removal of IMbnConnectionProfile interfaces in the system.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanager">IMbnConnectionProfileManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnConnectionProfileManagerEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnConnectionProfileManagerEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnconnectionprofilemanagerevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnConnectionProfileManagerEvents extends IUnknown {
    /**
     * The interface identifier for IMbnConnectionProfileManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-201f-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnConnectionProfileManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnConnectionProfileArrival : IntPtr
        OnConnectionProfileRemoval : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnConnectionProfileManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method that indicates a new connection profile has been added to the system.
     * @param {IMbnConnectionProfile} newConnectionProfile An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofile">IMbnConnectionProfile</a> interface that represents a connection profile that has been added.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanagerevents-onconnectionprofilearrival
     */
    OnConnectionProfileArrival(newConnectionProfile) {
        result := ComCall(3, this, "ptr", newConnectionProfile, "HRESULT")
        return result
    }

    /**
     * Notification method that indicates a connection profile has been removed from the system.
     * @param {IMbnConnectionProfile} oldConnectionProfile An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectionprofile">IMbnConnectionProfile</a> interface that represents a connection profile that has been removed.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnconnectionprofilemanagerevents-onconnectionprofileremoval
     */
    OnConnectionProfileRemoval(oldConnectionProfile) {
        result := ComCall(4, this, "ptr", oldConnectionProfile, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnConnectionProfileManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnConnectionProfileArrival := CallbackCreate(GetMethod(implObj, "OnConnectionProfileArrival"), flags, 2)
        this.vtbl.OnConnectionProfileRemoval := CallbackCreate(GetMethod(implObj, "OnConnectionProfileRemoval"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnConnectionProfileArrival)
        CallbackFree(this.vtbl.OnConnectionProfileRemoval)
    }
}
