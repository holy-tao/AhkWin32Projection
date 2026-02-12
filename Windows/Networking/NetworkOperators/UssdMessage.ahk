#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUssdMessage.ahk
#Include .\IUssdMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a USSD message that is used for sending messages to and receiving messages from the network.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class UssdMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUssdMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUssdMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of a UssdMessage and encodes the supplied string into the message payload.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The default UssdMessage constructor assigns the default [DataCodingScheme](ussdmessage_datacodingscheme.md) value and encodes the string supplied to the constructor into the message payload.
     * @param {HSTRING} messageText The payload for the UssdMessage.
     * @returns {UssdMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage.#ctor
     */
    static CreateMessage(messageText) {
        if (!UssdMessage.HasProp("__IUssdMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.UssdMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUssdMessageFactory.IID)
            UssdMessage.__IUssdMessageFactory := IUssdMessageFactory(factoryPtr)
        }

        return UssdMessage.__IUssdMessageFactory.CreateMessage(messageText)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the encoding scheme of the payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The data coding scheme is part of the USSD protocol. It is defined in 3GPP TS 23.038 chapter 5, *CBS Data Coding Scheme*
     * <!--Should/can we provide a link to the referenced document?-->
     * .
     * 
     * When a message is encoded in the default coding scheme, you can access the payload as text using the [PayloadAsText](ussdmessage_payloadastext.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage.datacodingscheme
     * @type {Integer} 
     */
    DataCodingScheme {
        get => this.get_DataCodingScheme()
        set => this.put_DataCodingScheme(value)
    }

    /**
     * Gets or sets the payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md) as text.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The PayloadAsText property can be used with the default [DataCodingScheme](ussdmessage_datacodingscheme.md) value, which supports only ASCII characters. The maximum length of a message is using the default data-coding scheme is 182 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage.payloadastext
     * @type {HSTRING} 
     */
    PayloadAsText {
        get => this.get_PayloadAsText()
        set => this.put_PayloadAsText(value)
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
    get_DataCodingScheme() {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.get_DataCodingScheme()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DataCodingScheme(value) {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.put_DataCodingScheme(value)
    }

    /**
     * Gets the raw payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The [DataCodingScheme](ussdmessage_datacodingscheme.md) property identifies how the payload is encoded.
     * 
     * The maximum size of the raw payload is 160 bytes.
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} The raw payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage.getpayload
     */
    GetPayload(value) {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.GetPayload(value)
    }

    /**
     * Sets the raw payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * When you set the raw payload for a [UssdMessage](ussdmessage.md), you must first set the [DataCodingScheme](ussdmessage_datacodingscheme.md) property to the encoding scheme for the message. If you do not set the [DataCodingScheme](ussdmessage_datacodingscheme.md) property, the default coding scheme is used.
     * 
     * If you use the default coding scheme, you can access the payload as text using the [PayloadAsText](ussdmessage_payloadastext.md) property.
     * 
     * The maximum size of the raw payload is 160 bytes.
     * @param {Integer} value_length 
     * @param {Pointer<Integer>} value The raw payload of this [UssdMessage](ussdmessage_ussdmessage_290278668.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.ussdmessage.setpayload
     */
    SetPayload(value_length, value) {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.SetPayload(value_length, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PayloadAsText() {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.get_PayloadAsText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PayloadAsText(value) {
        if (!this.HasProp("__IUssdMessage")) {
            if ((queryResult := this.QueryInterface(IUssdMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUssdMessage := IUssdMessage(outPtr)
        }

        return this.__IUssdMessage.put_PayloadAsText(value)
    }

;@endregion Instance Methods
}
