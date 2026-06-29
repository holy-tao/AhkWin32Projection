#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Use this interface to receive a success or failure notification when a Windows Connect Now connect session completes.
 * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nn-wcndevice-iwcnconnectnotify
 * @namespace Windows.Win32.NetworkManagement.WindowsConnectNow
 */
export default struct IWCNConnectNotify extends IUnknown {
    /**
     * The interface identifier for IWCNConnectNotify
     * @type {Guid}
     */
    static IID := Guid("{c100be9f-d33a-4a4b-bf23-bbef4663d017}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWCNConnectNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ConnectSucceeded : IntPtr
        ConnectFailed    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWCNConnectNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWCNConnectNotify::ConnectSucceeded callback method that indicates a successful IWCNDevice::Connect operation.
     * @remarks
     * Notification of  success does not implicitly indicate that the device is ready, as some devices reboot in order to apply settings provided during the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nf-wcndevice-iwcndevice-connect">IWCNDevice::Connect</a> operation.
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/wcndevice/nn-wcndevice-iwcndevice">IWCNDevice</a> interface was used to obtain network settings from a device, then the network profile is immediately ready for use.
     * @returns {HRESULT} ...
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcnconnectnotify-connectsucceeded
     */
    ConnectSucceeded() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Callback method indicates a IWCNDevice::Connect failure.
     * @param {HRESULT} hrFailure An <b>HRESULT</b> that specifies the reason for the connection failure.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/wcndevice/nf-wcndevice-iwcnconnectnotify-connectfailed
     */
    ConnectFailed(hrFailure) {
        result := ComCall(4, this, "int", hrFailure, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWCNConnectNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectSucceeded := CallbackCreate(GetMethod(implObj, "ConnectSucceeded"), flags, 1)
        this.vtbl.ConnectFailed := CallbackCreate(GetMethod(implObj, "ConnectFailed"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectSucceeded)
        CallbackFree(this.vtbl.ConnectFailed)
    }
}
