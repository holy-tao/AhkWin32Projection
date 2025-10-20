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
     * 
     * @param {PWSTR} pszSubscriptionAction 
     * @returns {String} Nothing - always returns an empty string
     */
    SubscriptionRenewed(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(3, this, "ptr", pszSubscriptionAction)
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubscriptionAction 
     * @param {HRESULT} hr 
     * @returns {String} Nothing - always returns an empty string
     */
    SubscriptionRenewalFailed(pszSubscriptionAction, hr) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(4, this, "ptr", pszSubscriptionAction, "int", hr)
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubscriptionAction 
     * @returns {String} Nothing - always returns an empty string
     */
    SubscriptionEnded(pszSubscriptionAction) {
        pszSubscriptionAction := pszSubscriptionAction is String ? StrPtr(pszSubscriptionAction) : pszSubscriptionAction

        ComCall(5, this, "ptr", pszSubscriptionAction)
        return result
    }
}
