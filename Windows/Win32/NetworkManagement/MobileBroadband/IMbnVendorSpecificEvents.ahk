#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnVendorSpecificOperation.ahk" { IMbnVendorSpecificOperation }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * This notification interface signals an application of the completion status of vendor-specific operations and other vendor-specific changes in the device state.
 * @remarks
 * The following procedure describes how to register for notifications.
 * 
 * <ol>
 * <li>Get an <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer">IConnectionPointContainer</a>  interface by calling <b>QueryInterface</b> on an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterfacemanager">IMbnInterfaceManager</a> object.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpointcontainer-findconnectionpoint">FindConnectionPoint</a> on the returned interface and pass <b>IID_IMbnVendorSpecificEvents</b> to <i>riid</i>.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-advise">Advise</a> on the returned connection point and pass a pointer to an <b>IUnknown</b> interface on an object that implements <b>IMbnVendorSpecificEvents</b> to <i>pUnk</i>.</li>
 * </ol>
 * Notifications can be terminated by calling <a href="https://docs.microsoft.com/windows/win32/api/ocidl/nf-ocidl-iconnectionpoint-unadvise">Unadvise</a> on the connection point returned in step 2.
 * 
 * To view some code that registers for COM notifications, see the Client section of the <a href="https://docs.microsoft.com/archive/msdn-magazine/2007/september/clr-inside-out-com-connection-points">COM Connection Points</a> article.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnvendorspecificevents
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnVendorSpecificEvents extends IUnknown {
    /**
     * The interface identifier for IMbnVendorSpecificEvents
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-201a-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnVendorSpecificEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnEventNotification         : IntPtr
        OnSetVendorSpecificComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnVendorSpecificEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notification method signaling a change event from the underlying Mobile Broadband device miniport driver.
     * @remarks
     * This byte array contains the byte by byte copy of data returned by underlying miniport driver.  The Mobile Broadband service will free the memory for this field after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
     * @param {IMbnVendorSpecificOperation} vendorOperation A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnvendorspecificoperation">IMbnVendorSpecificOperation</a> interface representing the device on which the event has occurred.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array containing the data returned by underlying miniport driver.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnvendorspecificevents-oneventnotification
     */
    OnEventNotification(vendorOperation, vendorSpecificData) {
        result := ComCall(3, this, "ptr", vendorOperation, SAFEARRAY.Ptr, vendorSpecificData, "HRESULT")
        return result
    }

    /**
     * Notification method indicating that a vendor-specific operation has completed.
     * @remarks
     * This byte array contains the byte by byte copy of data returned by underlying miniport driver. The Mobile Broadband service will free the memory for this field after the function call returns. If an application wants to use this data then it should copy the contents in its own memory.
     * @param {IMbnVendorSpecificOperation} vendorOperation An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnvendorspecificoperation">IMbnVendorSpecificOperation</a> interface representing the operation that completed.
     * @param {Pointer<SAFEARRAY>} vendorSpecificData A byte array containing the data returned by underlying miniport driver.
     * @param {Integer} requestID A request ID assigned by the Mobile Broadband service to identify the vendor-specific operation request.
     * @returns {HRESULT} This method must return <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnvendorspecificevents-onsetvendorspecificcomplete
     */
    OnSetVendorSpecificComplete(vendorOperation, vendorSpecificData, requestID) {
        result := ComCall(4, this, "ptr", vendorOperation, SAFEARRAY.Ptr, vendorSpecificData, "uint", requestID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnVendorSpecificEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnEventNotification := CallbackCreate(GetMethod(implObj, "OnEventNotification"), flags, 3)
        this.vtbl.OnSetVendorSpecificComplete := CallbackCreate(GetMethod(implObj, "OnSetVendorSpecificComplete"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnEventNotification)
        CallbackFree(this.vtbl.OnSetVendorSpecificComplete)
    }
}
