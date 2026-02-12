#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITetheringEntitlementCheckTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details about the tethering event that activated a [TetheringEntitlementCheckTrigger](../windows.applicationmodel.background/tetheringentitlementchecktrigger.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringentitlementchecktriggerdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringEntitlementCheckTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITetheringEntitlementCheckTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITetheringEntitlementCheckTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying the service set identifier (SSID), which is a unique identifier for the mobile broadband account that received the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringentitlementchecktriggerdetails.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
        if (!this.HasProp("__ITetheringEntitlementCheckTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ITetheringEntitlementCheckTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITetheringEntitlementCheckTriggerDetails := ITetheringEntitlementCheckTriggerDetails(outPtr)
        }

        return this.__ITetheringEntitlementCheckTriggerDetails.get_NetworkAccountId()
    }

    /**
     * Indicates that tethering is permitted for the service set identifier (SSID) for the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringentitlementchecktriggerdetails.allowtethering
     */
    AllowTethering() {
        if (!this.HasProp("__ITetheringEntitlementCheckTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ITetheringEntitlementCheckTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITetheringEntitlementCheckTriggerDetails := ITetheringEntitlementCheckTriggerDetails(outPtr)
        }

        return this.__ITetheringEntitlementCheckTriggerDetails.AllowTethering()
    }

    /**
     * Indicates that tethering is denied for the service set identifier (SSID) for the device.
     * @param {HSTRING} entitlementFailureReason A string specifying the reason for the tethering failure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringentitlementchecktriggerdetails.denytethering
     */
    DenyTethering(entitlementFailureReason) {
        if (!this.HasProp("__ITetheringEntitlementCheckTriggerDetails")) {
            if ((queryResult := this.QueryInterface(ITetheringEntitlementCheckTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITetheringEntitlementCheckTriggerDetails := ITetheringEntitlementCheckTriggerDetails(outPtr)
        }

        return this.__ITetheringEntitlementCheckTriggerDetails.DenyTethering(entitlementFailureReason)
    }

;@endregion Instance Methods
}
