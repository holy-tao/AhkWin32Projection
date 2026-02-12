#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownSmartCardAppletIds.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents a selection of known smartcard applet IDs; exposing them via its properties.
 * @remarks
 * An applet ID (also called an application ID, or AID) is an identifier (a sequence of 5 to 16 bytes) that represents an application on a smartcard. A SIM card (or UICC) is an example of a smartcard; as is an employee badge, or a credit card.
 * 
 * Several well-known AIDs exist. For payment scenarios, two important AIDs identify the payment system environment (PSE) and proximity payment system environment (PPSE) applications. When a payment terminal connects to a credit card, the first application that the terminal talks to is one of these. When inserting a credit card into a terminal, the PSE application is used. When tapping a card against a terminal with near-field communication (NFC), the PPSE application is used.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.knownsmartcardappletids
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class KnownSmartCardAppletIds extends IInspectable {
;@region Static Properties
    /**
     * Gets the applet ID of the payment system environment (PSE) application.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.knownsmartcardappletids.paymentsystemenvironment
     * @type {IBuffer} 
     */
    static PaymentSystemEnvironment {
        get => KnownSmartCardAppletIds.get_PaymentSystemEnvironment()
    }

    /**
     * Gets the applet ID of the proximity payment system environment (PPSE) application.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.knownsmartcardappletids.proximitypaymentsystemenvironment
     * @type {IBuffer} 
     */
    static ProximityPaymentSystemEnvironment {
        get => KnownSmartCardAppletIds.get_ProximityPaymentSystemEnvironment()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IBuffer} 
     */
    static get_PaymentSystemEnvironment() {
        if (!KnownSmartCardAppletIds.HasProp("__IKnownSmartCardAppletIds")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.KnownSmartCardAppletIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSmartCardAppletIds.IID)
            KnownSmartCardAppletIds.__IKnownSmartCardAppletIds := IKnownSmartCardAppletIds(factoryPtr)
        }

        return KnownSmartCardAppletIds.__IKnownSmartCardAppletIds.get_PaymentSystemEnvironment()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    static get_ProximityPaymentSystemEnvironment() {
        if (!KnownSmartCardAppletIds.HasProp("__IKnownSmartCardAppletIds")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.KnownSmartCardAppletIds")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownSmartCardAppletIds.IID)
            KnownSmartCardAppletIds.__IKnownSmartCardAppletIds := IKnownSmartCardAppletIds(factoryPtr)
        }

        return KnownSmartCardAppletIds.__IKnownSmartCardAppletIds.get_ProximityPaymentSystemEnvironment()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
