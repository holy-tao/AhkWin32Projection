#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardEmulatorApduReceivedEventArgs.ahk
#Include .\ISmartCardEmulatorApduReceivedEventArgsWithCryptograms.ahk
#Include .\ISmartCardEmulatorApduReceivedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ApduReceived](smartcardemulator_apdureceived.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [ApduReceived](smartcardemulator_apdureceived.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorApduReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardEmulatorApduReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardEmulatorApduReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Represents an application protocol data unit (APDU) command sent by an NFC reader.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.commandapdu
     * @type {IBuffer} 
     */
    CommandApdu {
        get => this.get_CommandApdu()
    }

    /**
     * Gets the connection properties of the smart card emulator.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.connectionproperties
     * @type {SmartCardEmulatorConnectionProperties} 
     */
    ConnectionProperties {
        get => this.get_ConnectionProperties()
    }

    /**
     * Gets a [SmartCardAutomaticResponseStatus](smartcardautomaticresponsestatus.md) object indicating the automatic response was already successfully sent (**Success**), attempted but failed (**UnknownError**), or was not matched with any auto-responder rule (**None**).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.automaticresponsestatus
     * @type {Integer} 
     */
    AutomaticResponseStatus {
        get => this.get_AutomaticResponseStatus()
    }

    /**
     * Gets the state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
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
    get_CommandApdu() {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs := ISmartCardEmulatorApduReceivedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs.get_CommandApdu()
    }

    /**
     * 
     * @returns {SmartCardEmulatorConnectionProperties} 
     */
    get_ConnectionProperties() {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs := ISmartCardEmulatorApduReceivedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs.get_ConnectionProperties()
    }

    /**
     * Attempts to respond to an APDU.
     * @param {IBuffer} responseApdu A buffer containing the response.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.tryrespondasync
     */
    TryRespondAsync(responseApdu) {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs := ISmartCardEmulatorApduReceivedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs.TryRespondAsync(responseApdu)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutomaticResponseStatus() {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs := ISmartCardEmulatorApduReceivedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs.get_AutomaticResponseStatus()
    }

    /**
     * Returns an asynchronous operation that completes with an operation status.
     * @param {IBuffer} responseTemplate A buffer that contains a template response.
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps A collection that contains the cryptogram steps.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.tryrespondwithcryptogramsasync
     */
    TryRespondWithCryptogramsAsync(responseTemplate, cryptogramPlacementSteps) {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgsWithCryptograms.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms := ISmartCardEmulatorApduReceivedEventArgsWithCryptograms(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms.TryRespondWithCryptogramsAsync(responseTemplate, cryptogramPlacementSteps)
    }

    /**
     * Attempts to respond to an APDU, placing cryptograms in the outgoing message as instructed by the placement steps.
     * @param {IBuffer} responseTemplate A buffer containing a template response.
     * @param {IIterable<SmartCardCryptogramPlacementStep>} cryptogramPlacementSteps A collection that contains the cryptogram steps.
     * @param {IReference<Integer>} nextState 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.tryrespondwithcryptogramsasync
     */
    TryRespondWithCryptogramsAndStateAsync(responseTemplate, cryptogramPlacementSteps, nextState) {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgsWithCryptograms.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms := ISmartCardEmulatorApduReceivedEventArgsWithCryptograms(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgsWithCryptograms.TryRespondWithCryptogramsAndStateAsync(responseTemplate, cryptogramPlacementSteps, nextState)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs2 := ISmartCardEmulatorApduReceivedEventArgs2(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs2.get_State()
    }

    /**
     * Attempts to respond to an APDU.
     * @param {IBuffer} responseApdu A buffer containing the response.
     * @param {IReference<Integer>} nextState 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorapdureceivedeventargs.tryrespondasync
     */
    TryRespondWithStateAsync(responseApdu, nextState) {
        if (!this.HasProp("__ISmartCardEmulatorApduReceivedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorApduReceivedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorApduReceivedEventArgs2 := ISmartCardEmulatorApduReceivedEventArgs2(outPtr)
        }

        return this.__ISmartCardEmulatorApduReceivedEventArgs2.TryRespondWithStateAsync(responseApdu, nextState)
    }

;@endregion Instance Methods
}
