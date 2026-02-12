#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardChallengeContext.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a smart card authentication challenge/response operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardChallengeContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardChallengeContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardChallengeContext.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the smart card's challenge value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.challenge
     * @type {IBuffer} 
     */
    Challenge {
        get => this.get_Challenge()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Challenge() {
        if (!this.HasProp("__ISmartCardChallengeContext")) {
            if ((queryResult := this.QueryInterface(ISmartCardChallengeContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardChallengeContext := ISmartCardChallengeContext(outPtr)
        }

        return this.__ISmartCardChallengeContext.get_Challenge()
    }

    /**
     * Verifies the response to the smart card challenge request.
     * @param {IBuffer} response The response to the smart card challenge request.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.verifyresponseasync
     */
    VerifyResponseAsync(response) {
        if (!this.HasProp("__ISmartCardChallengeContext")) {
            if ((queryResult := this.QueryInterface(ISmartCardChallengeContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardChallengeContext := ISmartCardChallengeContext(outPtr)
        }

        return this.__ISmartCardChallengeContext.VerifyResponseAsync(response)
    }

    /**
     * Reconfigures an existing, configured smart card with a new response and ID. Optionally, formats the smart card.
     * @param {IBuffer} response The new response to a smart card authentication challenge/response operation.
     * @param {Boolean} formatCard True to format the smart card; otherwise false.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.provisionasync
     */
    ProvisionAsync(response, formatCard) {
        if (!this.HasProp("__ISmartCardChallengeContext")) {
            if ((queryResult := this.QueryInterface(ISmartCardChallengeContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardChallengeContext := ISmartCardChallengeContext(outPtr)
        }

        return this.__ISmartCardChallengeContext.ProvisionAsync(response, formatCard)
    }

    /**
     * Reconfigures an existing, configured smart card with a new response. Optionally, formats the smart card.
     * @param {IBuffer} response The new response to a smart card authentication challenge/response operation.
     * @param {Boolean} formatCard True to format the smart card; otherwise false.
     * @param {Guid} newCardId 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.provisionasync
     */
    ProvisionAsyncWithNewCardId(response, formatCard, newCardId) {
        if (!this.HasProp("__ISmartCardChallengeContext")) {
            if ((queryResult := this.QueryInterface(ISmartCardChallengeContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardChallengeContext := ISmartCardChallengeContext(outPtr)
        }

        return this.__ISmartCardChallengeContext.ProvisionAsyncWithNewCardId(response, formatCard, newCardId)
    }

    /**
     * Changes the smart card's admin key (also known as an *administrator PIN* or *unblock PIN*).
     * @param {IBuffer} response The response to a smart card authentication challenge/response operation.
     * @param {IBuffer} newAdministrativeKey The new smart card admin key.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.changeadministrativekeyasync
     */
    ChangeAdministrativeKeyAsync(response, newAdministrativeKey) {
        if (!this.HasProp("__ISmartCardChallengeContext")) {
            if ((queryResult := this.QueryInterface(ISmartCardChallengeContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardChallengeContext := ISmartCardChallengeContext(outPtr)
        }

        return this.__ISmartCardChallengeContext.ChangeAdministrativeKeyAsync(response, newAdministrativeKey)
    }

    /**
     * Completes the smart card authentication challenge/response operation and frees associated system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardchallengecontext.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
