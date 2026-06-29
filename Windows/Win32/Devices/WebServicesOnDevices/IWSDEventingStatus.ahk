#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implement this interface to receive notification when status changes occur in event subscriptions.
 * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nn-wsdclient-iwsdeventingstatus
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct IWSDEventingStatus extends IUnknown {
    /**
     * The interface identifier for IWSDEventingStatus
     * @type {Guid}
     */
    static IID := Guid("{49b17f52-637a-407a-ae99-fbe82a4d38c0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWSDEventingStatus interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SubscriptionRenewed       : IntPtr
        SubscriptionRenewalFailed : IntPtr
        SubscriptionEnded         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWSDEventingStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the subscription for the specified event action was successfully renewed.
     * @remarks
     * After an operation is subscribed to, the service proxy will attempt to automatically renew the subscription until the client calls the appropriate <b>Unsubscribe</b> method or until the subscription is ended by the service. When the renewal succeeds, <b>SubscriptionRenewed</b> will be called to notify the client.
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionrenewed
     */
    SubscriptionRenewed(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(3, this, "ptr", pszSubscriptionAction)
    }

    /**
     * Called when the subscription for the specified event action could not be renewed.
     * @remarks
     * After an operation is subscribed to, the service proxy will attempt to automatically renew the subscription until the client calls the appropriate <b>Unsubscribe</b> method or until the subscription is ended by the service. When the renewal fails, <b>SubscriptionRenewalFailed</b> will be called to notify the client.
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @param {HRESULT} hr HRESULT indicating the nature of the error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionrenewalfailed
     */
    SubscriptionRenewalFailed(pszSubscriptionAction, hr) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(4, this, "ptr", pszSubscriptionAction, "int", hr)
    }

    /**
     * Called when the device terminated the subscription.
     * @remarks
     * After an operation is subscribed to, the service proxy will listen for SubscriptionEnd messages from the subscription manager. If one is received for a specified subscription, <b>SubscriptionEnded</b> will be called to notify the client. <b>SubscriptionEnded</b> will not be called if the service proxy unsubscribes from the operation or if the host service goes offline.
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionended
     */
    SubscriptionEnded(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(5, this, "ptr", pszSubscriptionAction)
    }

    Query(iid) {
        if (IWSDEventingStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SubscriptionRenewed := CallbackCreate(GetMethod(implObj, "SubscriptionRenewed"), flags, 2)
        this.vtbl.SubscriptionRenewalFailed := CallbackCreate(GetMethod(implObj, "SubscriptionRenewalFailed"), flags, 3)
        this.vtbl.SubscriptionEnded := CallbackCreate(GetMethod(implObj, "SubscriptionEnded"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SubscriptionRenewed)
        CallbackFree(this.vtbl.SubscriptionRenewalFailed)
        CallbackFree(this.vtbl.SubscriptionEnded)
    }
}
