#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WMPSubscriptionServiceEvent.ahk" { WMPSubscriptionServiceEvent }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPSubscriptionService.ahk" { IWMPSubscriptionService }
#Import ".\IWMPSubscriptionServiceCallback.ahk" { IWMPSubscriptionServiceCallback }

/**
 * Note  This section describes functionality designed for use by online stores.
 * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservice2
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPSubscriptionService2 extends IWMPSubscriptionService {
    /**
     * The interface identifier for IWMPSubscriptionService2
     * @type {Guid}
     */
    static IID := Guid("{a94c120e-d600-4ec6-b05e-ec9d56d84de0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPSubscriptionService2 interfaces
    */
    struct Vtbl extends IWMPSubscriptionService.Vtbl {
        stopBackgroundProcessing : IntPtr
        serviceEvent             : IntPtr
        deviceAvailable          : IntPtr
        prepareForSync           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPSubscriptionService2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Calls to <b>stopBackgroundProcessing</b> occur after calls to <b>startBackgroundProcessing</b> to signal the online store that background processing tasks must be suspended.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-stopbackgroundprocessing
     */
    stopBackgroundProcessing() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The serviceEvent method is called when the online store is activated or deactivated.
     * @remarks
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method. Instead, you must perform time-consuming tasks on a separate worker thread.
     * @param {WMPSubscriptionServiceEvent} event A <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/ne-subscriptionservices-wmpsubscriptionserviceevent">WMPSubscriptionServiceEvent</a> enumeration value indicating whether the service is activated or deactivated.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-serviceevent
     */
    serviceEvent(event) {
        result := ComCall(8, this, WMPSubscriptionServiceEvent, event, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * Windows Media Player calls this method after a synchronization operation if the time elapsed since the last call is one week or more.
     * 
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method. Instead, you must perform time-consuming tasks on a separate worker thread. When the worker thread has completed its work, it must call <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservicecallback-oncomplete">IWMPSubscriptionServiceCallback::onComplete</a>.
     * 
     * Use the following procedure to provide your worker thread with a pointer to an <b>IWMPSubscriptionServiceCallback</b> interface.
     * 
     * <ol>
     * <li>Pass <i>pCB</i> to <b>CoMarshalInterThreadInterfaceInStream</b>, which returns an <b>IStream</b> pointer.</li>
     * <li>Pass the <b>IStream</b> pointer to your worker thread.</li>
     * <li>In your worker thread, call <b>CoGetInterfaceAndReleaseStream</b>, which returns an interface pointer that you can use to call <b>onComplete</b>.</li>
     * </ol>
     * The string contained in <i>bstrDeviceName</i> is not the same name retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpsyncdevice-get_devicename">IWMPSyncDevice::get_deviceName</a>. Rather, it is the canonical name retrieved by using the <b>IWMDMDevice2::GetCanonicalName</b> method provided by the Windows Media Device Manager SDK.
     * @param {BSTR} bstrDeviceName String containing the device name.
     * @param {IWMPSubscriptionServiceCallback} pCB Pointer to an <b>IWMPSubscriptionServiceCallback</b> interface. The online store uses this pointer to notify Windows Media Player that device-specific processing is complete.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-deviceavailable
     */
    deviceAvailable(bstrDeviceName, pCB) {
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(9, this, BSTR, bstrDeviceName, "ptr", pCB, "HRESULT")
        return result
    }

    /**
     * Note  This section describes functionality designed for use by online stores.
     * @remarks
     * The string contained in <i>bstrDeviceName</i> is not the same name retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpsyncdevice-get_devicename">IWMPSyncDevice::get_deviceName</a>. Rather, it is the canonical name retrieved by using the <b>IWMDMDevice2::GetCanonicalName</b> method provided by the Windows Media Device Manager SDK.
     * 
     * Your code should not perform lengthy operations synchronously when Windows Media Player calls this method. Instead, you must perform time-consuming tasks on a separate worker thread. When the worker thread has completed its work, it must call <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservicecallback-oncomplete">IWMPSubscriptionServiceCallback::onComplete</a>.
     * 
     * Use the following procedure to provide your worker thread with a pointer to an <b>IWMPSubscriptionServiceCallback</b> interface.
     * 
     * <ol>
     * <li>Pass <i>pCB</i> to <b>CoMarshalInterThreadInterfaceInStream</b>, which returns an <b>IStream</b> pointer.</li>
     * <li>Pass the <b>IStream</b> pointer to your worker thread.</li>
     * <li>In your worker thread, call <b>CoGetInterfaceAndReleaseStream</b>, which returns an interface pointer that you can use to call <b>onComplete</b>.</li>
     * </ol>
     * When you call <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservicecallback-oncomplete">IWMPSubscriptionServiceCallback::onComplete</a>, you should return a success code to allow Windows Media Player to continue synchronizing the specified digital media file, or an error code to disallow synchronization. Windows Media Player displays an error message based on the error code you provide. You should avoid using generic <b>HRESULTs</b>, such as E_FAIL. Instead, you can return the <b>HRESULT</b> error code you receive from a call to one of the Windows Media SDKs, such as the Windows Media Device Manager SDK, or one of the error codes in nserror.h, which can be found in the \Include folder where you installed the Windows Media Player SDK.
     * @param {BSTR} bstrFilename String containing the name of the digital media file being synchronized.
     * @param {BSTR} bstrDeviceName String containing the canonical name of the device.
     * @param {IWMPSubscriptionServiceCallback} pCB Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/subscriptionservices/nn-subscriptionservices-iwmpsubscriptionservicecallback">IWMPSubscriptionServiceCallback</a> interface. The online store uses this pointer to notify Windows Media Player that preparation for synchronization is complete.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/subscriptionservices/nf-subscriptionservices-iwmpsubscriptionservice2-prepareforsync
     */
    prepareForSync(bstrFilename, bstrDeviceName, pCB) {
        bstrFilename := bstrFilename is String ? BSTR.Alloc(bstrFilename).Value : bstrFilename
        bstrDeviceName := bstrDeviceName is String ? BSTR.Alloc(bstrDeviceName).Value : bstrDeviceName

        result := ComCall(10, this, BSTR, bstrFilename, BSTR, bstrDeviceName, "ptr", pCB, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPSubscriptionService2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.stopBackgroundProcessing := CallbackCreate(GetMethod(implObj, "stopBackgroundProcessing"), flags, 1)
        this.vtbl.serviceEvent := CallbackCreate(GetMethod(implObj, "serviceEvent"), flags, 2)
        this.vtbl.deviceAvailable := CallbackCreate(GetMethod(implObj, "deviceAvailable"), flags, 3)
        this.vtbl.prepareForSync := CallbackCreate(GetMethod(implObj, "prepareForSync"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.stopBackgroundProcessing)
        CallbackFree(this.vtbl.serviceEvent)
        CallbackFree(this.vtbl.deviceAvailable)
        CallbackFree(this.vtbl.prepareForSync)
    }
}
