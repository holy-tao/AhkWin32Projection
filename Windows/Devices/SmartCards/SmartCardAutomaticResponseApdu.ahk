#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardAutomaticResponseApdu.ahk
#Include .\ISmartCardAutomaticResponseApdu2.ahk
#Include .\ISmartCardAutomaticResponseApdu3.ahk
#Include .\ISmartCardAutomaticResponseApduFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the smart card automatic response Application Protocol Data Unit (APDU).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardAutomaticResponseApdu extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardAutomaticResponseApdu

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardAutomaticResponseApdu.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the  class.
     * @param {IBuffer} commandApdu The APDU command sent by the NFC reader.
     * @param {IBuffer} responseApdu The response to the NFC reader.
     * @returns {SmartCardAutomaticResponseApdu} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.#ctor
     */
    static Create(commandApdu, responseApdu) {
        if (!SmartCardAutomaticResponseApdu.HasProp("__ISmartCardAutomaticResponseApduFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardAutomaticResponseApdu")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardAutomaticResponseApduFactory.IID)
            SmartCardAutomaticResponseApdu.__ISmartCardAutomaticResponseApduFactory := ISmartCardAutomaticResponseApduFactory(factoryPtr)
        }

        return SmartCardAutomaticResponseApdu.__ISmartCardAutomaticResponseApduFactory.Create(commandApdu, responseApdu)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the command for this APDU.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.commandapdu
     * @type {IBuffer} 
     */
    CommandApdu {
        get => this.get_CommandApdu()
        set => this.put_CommandApdu(value)
    }

    /**
     * Gets or sets the bitmask for the APDU command.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.commandapdubitmask
     * @type {IBuffer} 
     */
    CommandApduBitMask {
        get => this.get_CommandApduBitMask()
        set => this.put_CommandApduBitMask(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether the [CommandApdu](smartcardautomaticresponseapdu_commandapdu.md) and incoming command should have exactly matching length.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.shouldmatchlength
     * @type {Boolean} 
     */
    ShouldMatchLength {
        get => this.get_ShouldMatchLength()
        set => this.put_ShouldMatchLength(value)
    }

    /**
     * Gets or sets the applet identifier for this APDU.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.appletid
     * @type {IBuffer} 
     */
    AppletId {
        get => this.get_AppletId()
        set => this.put_AppletId(value)
    }

    /**
     * Gets or sets the response from the Application Protocol Data Unit (APDU).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.responseapdu
     * @type {IBuffer} 
     */
    ResponseApdu {
        get => this.get_ResponseApdu()
        set => this.put_ResponseApdu(value)
    }

    /**
     * Gets and puts the input state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.inputstate
     * @type {IReference<Integer>} 
     */
    InputState {
        get => this.get_InputState()
        set => this.put_InputState(value)
    }

    /**
     * Gets and puts the output state.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.outputstate
     * @type {IReference<Integer>} 
     */
    OutputState {
        get => this.get_OutputState()
        set => this.put_OutputState(value)
    }

    /**
     * Gets or sets a Boolean value indicating whether to continue with Automatic APDU processing if Cryptogram Materials cannot be prepared for use without user authorization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardautomaticresponseapdu.allowwhencryptogramgeneratornotprepared
     * @type {Boolean} 
     */
    AllowWhenCryptogramGeneratorNotPrepared {
        get => this.get_AllowWhenCryptogramGeneratorNotPrepared()
        set => this.put_AllowWhenCryptogramGeneratorNotPrepared(value)
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
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.get_CommandApdu()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_CommandApdu(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.put_CommandApdu(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_CommandApduBitMask() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.get_CommandApduBitMask()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_CommandApduBitMask(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.put_CommandApduBitMask(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldMatchLength() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.get_ShouldMatchLength()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShouldMatchLength(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.put_ShouldMatchLength(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_AppletId() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.get_AppletId()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_AppletId(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.put_AppletId(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ResponseApdu() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.get_ResponseApdu()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_ResponseApdu(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu := ISmartCardAutomaticResponseApdu(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu.put_ResponseApdu(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_InputState() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu2 := ISmartCardAutomaticResponseApdu2(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu2.get_InputState()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_InputState(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu2 := ISmartCardAutomaticResponseApdu2(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu2.put_InputState(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_OutputState() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu2 := ISmartCardAutomaticResponseApdu2(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu2.get_OutputState()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_OutputState(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu2 := ISmartCardAutomaticResponseApdu2(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu2.put_OutputState(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWhenCryptogramGeneratorNotPrepared() {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu3")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu3 := ISmartCardAutomaticResponseApdu3(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu3.get_AllowWhenCryptogramGeneratorNotPrepared()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenCryptogramGeneratorNotPrepared(value) {
        if (!this.HasProp("__ISmartCardAutomaticResponseApdu3")) {
            if ((queryResult := this.QueryInterface(ISmartCardAutomaticResponseApdu3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAutomaticResponseApdu3 := ISmartCardAutomaticResponseApdu3(outPtr)
        }

        return this.__ISmartCardAutomaticResponseApdu3.put_AllowWhenCryptogramGeneratorNotPrepared(value)
    }

;@endregion Instance Methods
}
