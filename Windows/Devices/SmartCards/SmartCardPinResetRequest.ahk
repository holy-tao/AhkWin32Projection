#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardPinResetRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a smart card personal identification number (PIN) reset request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetrequest
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardPinResetRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardPinResetRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardPinResetRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the smart card's challenge value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetrequest.challenge
     * @type {IBuffer} 
     */
    Challenge {
        get => this.get_Challenge()
    }

    /**
     * Gets the length of time to wait before requesting the smart card personal identification number (PIN) reset.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetrequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Challenge() {
        if (!this.HasProp("__ISmartCardPinResetRequest")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinResetRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinResetRequest := ISmartCardPinResetRequest(outPtr)
        }

        return this.__ISmartCardPinResetRequest.get_Challenge()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__ISmartCardPinResetRequest")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinResetRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinResetRequest := ISmartCardPinResetRequest(outPtr)
        }

        return this.__ISmartCardPinResetRequest.get_Deadline()
    }

    /**
     * Gets an instance of a wait time for a requested smart card personal identification number (PIN) reset.
     * @returns {SmartCardPinResetDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISmartCardPinResetRequest")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinResetRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinResetRequest := ISmartCardPinResetRequest(outPtr)
        }

        return this.__ISmartCardPinResetRequest.GetDeferral()
    }

    /**
     * Sets the response to a smart card authentication challenge/response operation.
     * @param {IBuffer} response The response to a smart card authentication challenge/response operation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardpinresetrequest.setresponse
     */
    SetResponse(response) {
        if (!this.HasProp("__ISmartCardPinResetRequest")) {
            if ((queryResult := this.QueryInterface(ISmartCardPinResetRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardPinResetRequest := ISmartCardPinResetRequest(outPtr)
        }

        return this.__ISmartCardPinResetRequest.SetResponse(response)
    }

;@endregion Instance Methods
}
