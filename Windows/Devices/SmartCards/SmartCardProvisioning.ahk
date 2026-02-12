#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardProvisioning.ahk
#Include .\ISmartCardProvisioning2.ahk
#Include .\ISmartCardProvisioningStatics2.ahk
#Include .\ISmartCardProvisioningStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents info about, and operations for, configuring smart cards.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardProvisioning extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardProvisioning

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardProvisioning.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an attested Trusted Platform Module (TPM) virtual smart card with the specified parameters.
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @param {HSTRING} friendlyName The smart card's human-readable name.
     * @param {IBuffer} administrativeKey The smart card's admin key (also known as an *administrator PIN* or *unblock PIN*).
     * @param {SmartCardPinPolicy} pinPolicy The smart card's PIN rules set.
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestattestedvirtualsmartcardcreationasync
     */
    static RequestAttestedVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics2.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics2 := ISmartCardProvisioningStatics2(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics2.RequestAttestedVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy)
    }

    /**
     * Creates an attested Trusted Platform Module (TPM) virtual smart card with the specified parameters.
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @param {HSTRING} friendlyName The smart card's human-readable name.
     * @param {IBuffer} administrativeKey The smart card's admin key (also known as an *administrator PIN* or *unblock PIN*).
     * @param {SmartCardPinPolicy} pinPolicy The smart card's PIN rules set.
     * @param {Guid} cardId 
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestattestedvirtualsmartcardcreationasync
     */
    static RequestAttestedVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics2.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics2 := ISmartCardProvisioningStatics2(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics2.RequestAttestedVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId)
    }

    /**
     * Returns a smart card to be configured.
     * @param {SmartCard} card The specified smart card.
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.fromsmartcardasync
     */
    static FromSmartCardAsync(card) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics := ISmartCardProvisioningStatics(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics.FromSmartCardAsync(card)
    }

    /**
     * Creates a Trusted Platform Module (TPM) virtual smart card with a given human-readable name, admin key, personal identification number (PIN) rules set, and ID.
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @param {HSTRING} friendlyName The smart card's human-readable name.
     * @param {IBuffer} administrativeKey The smart card's admin key (also known as an *administrator PIN* or *unblock PIN*).
     * @param {SmartCardPinPolicy} pinPolicy The smart card's PIN rules set.
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestvirtualsmartcardcreationasync
     */
    static RequestVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics := ISmartCardProvisioningStatics(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics.RequestVirtualSmartCardCreationAsync(friendlyName, administrativeKey, pinPolicy)
    }

    /**
     * Creates a Trusted Platform Module (TPM) virtual smart card with a given human-readable name, admin key, and personal identification number (PIN) rules set.
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @param {HSTRING} friendlyName The smart card's human-readable name.
     * @param {IBuffer} administrativeKey The smart card's admin key (also known as an *administrator PIN* or *unblock PIN*).
     * @param {SmartCardPinPolicy} pinPolicy The smart card's PIN rules set.
     * @param {Guid} cardId 
     * @returns {IAsyncOperation<SmartCardProvisioning>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestvirtualsmartcardcreationasync
     */
    static RequestVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics := ISmartCardProvisioningStatics(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics.RequestVirtualSmartCardCreationAsyncWithCardId(friendlyName, administrativeKey, pinPolicy, cardId)
    }

    /**
     * Deletes a Trusted Platform Module (TPM) virtual smart card.
     * @remarks
     * When this method is called, it displays a UI to enable the user to consent to the deletion.
     * @param {SmartCard} card The TPM virtual smart card to delete.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestvirtualsmartcarddeletionasync
     */
    static RequestVirtualSmartCardDeletionAsync(card) {
        if (!SmartCardProvisioning.HasProp("__ISmartCardProvisioningStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardProvisioning")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardProvisioningStatics.IID)
            SmartCardProvisioning.__ISmartCardProvisioningStatics := ISmartCardProvisioningStatics(factoryPtr)
        }

        return SmartCardProvisioning.__ISmartCardProvisioningStatics.RequestVirtualSmartCardDeletionAsync(card)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the configured smart card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.smartcard
     * @type {SmartCard} 
     */
    SmartCard {
        get => this.get_SmartCard()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SmartCard} 
     */
    get_SmartCard() {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.get_SmartCard()
    }

    /**
     * Returns the smart card's ID.
     * @returns {IAsyncOperation<Guid>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.getidasync
     */
    GetIdAsync() {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.GetIdAsync()
    }

    /**
     * Returns the smart card's minidriver name.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.getnameasync
     */
    GetNameAsync() {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.GetNameAsync()
    }

    /**
     * Returns a smart card's authentication challenge/response context.
     * @returns {IAsyncOperation<SmartCardChallengeContext>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.getchallengecontextasync
     */
    GetChallengeContextAsync() {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.GetChallengeContextAsync()
    }

    /**
     * Changes a smart card's personal identification number (PIN).
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestpinchangeasync
     */
    RequestPinChangeAsync() {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.RequestPinChangeAsync()
    }

    /**
     * Resets a smart card's personal identification number (PIN).
     * @remarks
     * When this method is called, it displays a UI to get the PIN from the user.
     * @param {SmartCardPinResetHandler} handler The method that handles the smart card PIN reset.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.requestpinresetasync
     */
    RequestPinResetAsync(handler) {
        if (!this.HasProp("__ISmartCardProvisioning")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning := ISmartCardProvisioning(outPtr)
        }

        return this.__ISmartCardProvisioning.RequestPinResetAsync(handler)
    }

    /**
     * Asynchronously gets the name of the authority key container.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardprovisioning.getauthoritykeycontainernameasync
     */
    GetAuthorityKeyContainerNameAsync() {
        if (!this.HasProp("__ISmartCardProvisioning2")) {
            if ((queryResult := this.QueryInterface(ISmartCardProvisioning2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardProvisioning2 := ISmartCardProvisioning2(outPtr)
        }

        return this.__ISmartCardProvisioning2.GetAuthorityKeyContainerNameAsync()
    }

;@endregion Instance Methods
}
