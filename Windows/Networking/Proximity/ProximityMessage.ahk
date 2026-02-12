#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProximityMessage.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a message that's received from a subscription.
 * @remarks
 * Messages published using the [PublishMessage](proximitydevice_publishmessage_1881696512.md), [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md), or [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) methods and received by the [MessageReceivedEventHandler](messagereceivedhandler.md) passed to the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method are of type ProximityMessage.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitymessage
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class ProximityMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProximityMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProximityMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the message.
     * @remarks
     * Messages are delivered to all applications that have subscribed to the message type (as indicated by the *messageType* parameter). Message type values are case-sensitive strings that consist of two parts: the *protocol* and the subtype. The *protocol* is first, followed by a dot (.) and then the *subtype*. For the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method, the *protocol* must always be "Windows.". The *subtype* is a string of alphanumeric characters and the following additional characters: **. ( ) + , - : = @ ; $ _ ! * ’**. The *subtype* cannot exceed a length of 250 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitymessage.messagetype
     * @type {HSTRING} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * Gets the subscription ID of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitymessage.subscriptionid
     * @type {Integer} 
     */
    SubscriptionId {
        get => this.get_SubscriptionId()
    }

    /**
     * Gets the binary data of the message.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitymessage.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the message data as text.
     * @remarks
     * The DataAsString property is available only if the binary data of the message contains only text (UTF8) characters. Otherwise, the DataAsString property returns unpredictable results. You should not attempt to use the DataAsString property unless you are certain the data was received as UTF8 encoded characters. You can send a message as UTF8 encoded characters using the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitymessage.dataasstring
     * @type {HSTRING} 
     */
    DataAsString {
        get => this.get_DataAsString()
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
    get_MessageType() {
        if (!this.HasProp("__IProximityMessage")) {
            if ((queryResult := this.QueryInterface(IProximityMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityMessage := IProximityMessage(outPtr)
        }

        return this.__IProximityMessage.get_MessageType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SubscriptionId() {
        if (!this.HasProp("__IProximityMessage")) {
            if ((queryResult := this.QueryInterface(IProximityMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityMessage := IProximityMessage(outPtr)
        }

        return this.__IProximityMessage.get_SubscriptionId()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IProximityMessage")) {
            if ((queryResult := this.QueryInterface(IProximityMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityMessage := IProximityMessage(outPtr)
        }

        return this.__IProximityMessage.get_Data()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataAsString() {
        if (!this.HasProp("__IProximityMessage")) {
            if ((queryResult := this.QueryInterface(IProximityMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityMessage := IProximityMessage(outPtr)
        }

        return this.__IProximityMessage.get_DataAsString()
    }

;@endregion Instance Methods
}
