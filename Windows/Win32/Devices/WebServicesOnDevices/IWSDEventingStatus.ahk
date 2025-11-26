#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implement this interface to receive notification when status changes occur in event subscriptions.
 * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nn-wsdclient-iwsdeventingstatus
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class IWSDEventingStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWSDEventingStatus
     * @type {Guid}
     */
    static IID => Guid("{49b17f52-637a-407a-ae99-fbe82a4d38c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SubscriptionRenewed", "SubscriptionRenewalFailed", "SubscriptionEnded"]

    /**
     * Called when the subscription for the specified event action was successfully renewed.
     * @remarks
     * 
     * After an operation is subscribed to, the service proxy will attempt to automatically renew the subscription until the client calls the appropriate <b>Unsubscribe</b> method or until the subscription is ended by the service. When the renewal succeeds, <b>SubscriptionRenewed</b> will be called to notify the client.
     * 
     * 
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionrenewed
     */
    SubscriptionRenewed(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(3, this, "ptr", pszSubscriptionAction)
    }

    /**
     * Called when the subscription for the specified event action could not be renewed.
     * @remarks
     * 
     * After an operation is subscribed to, the service proxy will attempt to automatically renew the subscription until the client calls the appropriate <b>Unsubscribe</b> method or until the subscription is ended by the service. When the renewal fails, <b>SubscriptionRenewalFailed</b> will be called to notify the client.
     * 
     * 
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @param {HRESULT} hr HRESULT indicating the nature of the error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionrenewalfailed
     */
    SubscriptionRenewalFailed(pszSubscriptionAction, hr) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(4, this, "ptr", pszSubscriptionAction, "int", hr)
    }

    /**
     * Called when the device terminated the subscription.
     * @remarks
     * 
     * After an operation is subscribed to, the service proxy will listen for SubscriptionEnd messages from the subscription manager. If one is received for a specified subscription, <b>SubscriptionEnded</b> will be called to notify the client. <b>SubscriptionEnded</b> will not be called if the service proxy unsubscribes from the operation or if the host service goes offline.
     * 
     * 
     * @param {PWSTR} pszSubscriptionAction URI of the event action.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//wsdclient/nf-wsdclient-iwsdeventingstatus-subscriptionended
     */
    SubscriptionEnded(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(5, this, "ptr", pszSubscriptionAction)
    }
}
