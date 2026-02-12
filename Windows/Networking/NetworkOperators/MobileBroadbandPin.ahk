#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandPin.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the properties and methods associated with a mobile broadband PIN.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The usage and content of a Universal Integrated Circuit Card (UICC), normally called a SIM Card, can be protected by use of a code called the Personal Identification Number (PIN). PIN1 is defined to control normal use of the phone or data modem. PIN2 can be set to allow the use of special functions such as limiting outbound calls to a list of numbers.
 * 
 * A MobileBroadbandPin object is returned by the [GetPin](mobilebroadbandpinmanager_getpin_157691612.md) method on the [MobileBroadbandPinManager](mobilebroadbandpinmanager.md) .
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandPin extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandPin

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandPin.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the PIN type for a mobile broadband PIN.
     * @remarks
     * The usage and content of a Universal Integrated Circuit Card (UICC), normally called a SIM Card, can be protected by use of a code called the Personal Identification Number (PIN). PIN1 is defined to control normal use of the phone or data modem. PIN2 can be set to allow the use of special functions such as limiting outbound calls to a list of numbers.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the lock state for a mobile broadband PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.lockstate
     * @type {Integer} 
     */
    LockState {
        get => this.get_LockState()
    }

    /**
     * Gets the format for a mobile broadband PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * Gets a boolean value that indicates if the mobile broadband PIN is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * Gets the maximum length, in bytes, of the mobile broadband PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.maxlength
     * @type {Integer} 
     */
    MaxLength {
        get => this.get_MaxLength()
    }

    /**
     * Gets the minimum length, in bytes, of the mobile broadband PIN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.minlength
     * @type {Integer} 
     */
    MinLength {
        get => this.get_MinLength()
    }

    /**
     * Gets the number of attempts remaining before the mobile broadband PIN is blocked.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.attemptsremaining
     * @type {Integer} 
     */
    AttemptsRemaining {
        get => this.get_AttemptsRemaining()
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
    get_Type() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LockState() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_LockState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_Format()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_Enabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxLength() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_MaxLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinLength() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_MinLength()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttemptsRemaining() {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.get_AttemptsRemaining()
    }

    /**
     * Starts an asynchronous operation to enable a previously-disabled mobile broadband PIN.
     * @param {HSTRING} currentPin The current mobile broadband PIN.
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.enableasync
     */
    EnableAsync(currentPin) {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.EnableAsync(currentPin)
    }

    /**
     * Starts an asynchronous operation to disable a previously-enabled mobile broadband PIN.
     * @param {HSTRING} currentPin The current mobile broadband PIN.
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.disableasync
     */
    DisableAsync(currentPin) {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.DisableAsync(currentPin)
    }

    /**
     * Starts an asynchronous operation to get the current mobile broadband PIN from the user.
     * @param {HSTRING} currentPin The current mobile broadband PIN.
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.enterasync
     */
    EnterAsync(currentPin) {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.EnterAsync(currentPin)
    }

    /**
     * Starts an asynchronous operation to change an already-enabled mobile broadband PIN.
     * @param {HSTRING} currentPin The current mobile broadband PIN.
     * @param {HSTRING} newPin The new mobile broadband PIN.
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.changeasync
     */
    ChangeAsync(currentPin, newPin) {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.ChangeAsync(currentPin, newPin)
    }

    /**
     * Starts an asynchronous operation to unblock a previously-blocked mobile broadband PIN using a PIN unlock key (PUK).
     * @remarks
     * A PIN unlock key is a code used to reset a PIN that may have been blocked due to too many attempts to unlock it. PUK1 and PUK2 are used to reset PIN1 and PIN2 respectively.
     * @param {HSTRING} pinUnblockKey The PIN unblock key.
     * @param {HSTRING} newPin The new mobile broadband PIN.
     * @returns {IAsyncOperation<MobileBroadbandPinOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandpin.unblockasync
     */
    UnblockAsync(pinUnblockKey, newPin) {
        if (!this.HasProp("__IMobileBroadbandPin")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandPin := IMobileBroadbandPin(outPtr)
        }

        return this.__IMobileBroadbandPin.UnblockAsync(pinUnblockKey, newPin)
    }

;@endregion Instance Methods
}
