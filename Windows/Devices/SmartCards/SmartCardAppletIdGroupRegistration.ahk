#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardAppletIdGroupRegistration.ahk
#Include .\ISmartCardAppletIdGroupRegistration2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a registered group of applet IDs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardAppletIdGroupRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardAppletIdGroupRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardAppletIdGroupRegistration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the activation policy for the registered applet ID group.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.activationpolicy
     * @type {Integer} 
     */
    ActivationPolicy {
        get => this.get_ActivationPolicy()
    }

    /**
     * Gets the registered group of applet IDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.appletidgroup
     * @type {SmartCardAppletIdGroup} 
     */
    AppletIdGroup {
        get => this.get_AppletIdGroup()
    }

    /**
     * Gets a unique ID representing this applet ID group registration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the ID of any [SmartCardReader](smartcardreader.md) associated with a secure element. You can pass this ID to [SmartCardReader.FromIdAsync](smartcardreader_fromidasync_1322863552.md).
     * @remarks
     * Some secure element types&mdash;for example, an embedded secure element (eSE), or a SIM card (UICC)&mdash;have a smartcard reader associated with them. If a registration's secure element is associated with a smartcard reader, then **SmartCardReaderId** provides the ID of that reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.smartcardreaderid
     * @type {HSTRING} 
     */
    SmartCardReaderId {
        get => this.get_SmartCardReaderId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ActivationPolicy() {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration := ISmartCardAppletIdGroupRegistration(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration.get_ActivationPolicy()
    }

    /**
     * 
     * @returns {SmartCardAppletIdGroup} 
     */
    get_AppletIdGroup() {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration := ISmartCardAppletIdGroupRegistration(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration.get_AppletIdGroup()
    }

    /**
     * Attempts to asynchronously change the [ActivationPolicy](smartcardappletidgroupregistration_activationpolicy.md) for this group of registered applet IDs.
     * @param {Integer} policy The new activation policy.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.requestactivationpolicychangeasync
     */
    RequestActivationPolicyChangeAsync(policy) {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration := ISmartCardAppletIdGroupRegistration(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration.RequestActivationPolicyChangeAsync(policy)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration := ISmartCardAppletIdGroupRegistration(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration.get_Id()
    }

    /**
     * Sets a collection of [SmartCardAutomaticResponseApdu](smartcardautomaticresponseapdu.md) objects containing the automatic responses to return for this [SmartCardAppletIdGroupRegistration](smartcardappletidgroupregistration.md).
     * @param {IIterable<SmartCardAutomaticResponseApdu>} apdus A collection of automatic responses.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.setautomaticresponseapdusasync
     */
    SetAutomaticResponseApdusAsync(apdus) {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration := ISmartCardAppletIdGroupRegistration(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration.SetAutomaticResponseApdusAsync(apdus)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SmartCardReaderId() {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration2 := ISmartCardAppletIdGroupRegistration2(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration2.get_SmartCardReaderId()
    }

    /**
     * Asynchronously sets the value of [SmartCardAppletIdGroup.Properties](smartcardappletidgroup_properties.md).
     * @param {ValueSet} props A [ValueSet](/uwp/api/windows.foundation.collections.valueset) containing a (generic) property bag for a smartcard.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroupregistration.setpropertiesasync
     */
    SetPropertiesAsync(props) {
        if (!this.HasProp("__ISmartCardAppletIdGroupRegistration2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroupRegistration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroupRegistration2 := ISmartCardAppletIdGroupRegistration2(outPtr)
        }

        return this.__ISmartCardAppletIdGroupRegistration2.SetPropertiesAsync(props)
    }

;@endregion Instance Methods
}
