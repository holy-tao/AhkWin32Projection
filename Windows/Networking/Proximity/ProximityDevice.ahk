#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProximityDevice.ahk
#Include .\IProximityDeviceStatics.ahk
#Include .\DeviceArrivedEventHandler.ahk
#Include .\ProximityDevice.ahk
#Include .\DeviceDepartedEventHandler.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables you to publish messages to proximate devices or subscribe to messages from proximate devices.
 * @remarks
 * The ProximityDevice class enables applications to communicate with running applications on devices, typically within a range of 3 centimeters to 4 centimeters.
 * 
 * You can create an instance of ProximityDevice by using the [GetDefault](proximitydevice_getdefault_846721868.md) or [FromId](proximitydevice_fromid_114571398.md) static method.
 * 
 * The ProximityDevice class uses publish/subscribe semantics and is useful for advertising and receiving small blocks of data. For larger amounts of data, or for persistent communications, use the [PeerFinder](peerfinder.md) and [StreamSocket](../windows.networking.sockets/streamsocket_streamsocket_1221375020.md) classes. For UWP apps, publications and subscriptions are active only if the calling app is in the foreground.
 * 
 * 
 * 
 * > [!IMPORTANT]
 * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class ProximityDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProximityDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProximityDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the class selection string that you can use to enumerate proximity devices.
     * @remarks
     * You can enumerate proximity devices by passing the class selection string returned by the GetDeviceSelector method to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method.
     * 
     * If your computer supports Proximity and has an NFC device installed, which is commonly the case, then the [GetDefault](proximitydevice_getdefault_846721868.md) method will return the device that supports NFC. You can also determine whether your computer has an NFC device installed by querying the device information for the property "{FB3842CD-9E2A-4F83-8FCC-4B0761139AE9} 2". In the [DeviceInformation.Properties](../windows.devices.enumeration/deviceinformation_properties.md) object returned from the query the value for the "{FB3842CD-9E2A-4F83-8FCC-4B0761139AE9} 2" key contains and array of strings that describe the capabilities of the proximity device. If one of the strings is "StandardNfc", then the device supports NFC protocols such as NDEF. For more information on how to query for the properties of a device, see [How to retrieve additional properties for a device or PnP object](/previous-versions/windows/apps/hh464997(v=win.10)).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!ProximityDevice.HasProp("__IProximityDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.ProximityDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximityDeviceStatics.IID)
            ProximityDevice.__IProximityDeviceStatics := IProximityDeviceStatics(factoryPtr)
        }

        return ProximityDevice.__IProximityDeviceStatics.GetDeviceSelector()
    }

    /**
     * Creates an instance of a [ProximityDevice](proximitydevice.md) class and activates the default proximity provider.
     * @returns {ProximityDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.getdefault
     */
    static GetDefault() {
        if (!ProximityDevice.HasProp("__IProximityDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.ProximityDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximityDeviceStatics.IID)
            ProximityDevice.__IProximityDeviceStatics := IProximityDeviceStatics(factoryPtr)
        }

        return ProximityDevice.__IProximityDeviceStatics.GetDefault()
    }

    /**
     * Creates an instance of a [ProximityDevice](proximitydevice.md) class and activates the specified proximity device interface.
     * @remarks
     * You can enumerate proximity devices by passing the class selection string returned by the [GetDeviceSelector](proximitydevice_getdeviceselector_838466080.md) method to the [FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) or [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_1506431823.md) method. You can then use the resulting [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) value(s) to create an instance of a [ProximityDevice](proximitydevice.md) using the FromId method.
     * @param {HSTRING} deviceId The [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) of a proximity device.
     * @returns {ProximityDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.fromid
     */
    static FromId(deviceId) {
        if (!ProximityDevice.HasProp("__IProximityDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.ProximityDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IProximityDeviceStatics.IID)
            ProximityDevice.__IProximityDeviceStatics := IProximityDeviceStatics(factoryPtr)
        }

        return ProximityDevice.__IProximityDeviceStatics.FromId(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the maximum size of a published message that this proximity device supports.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.maxmessagebytes
     * @type {Integer} 
     */
    MaxMessageBytes {
        get => this.get_MaxMessageBytes()
    }

    /**
     * Gets the transfer rate of a proximity device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.bitspersecond
     * @type {Integer} 
     */
    BitsPerSecond {
        get => this.get_BitsPerSecond()
    }

    /**
     * Gets the [DeviceInformation Id](../windows.devices.enumeration/deviceinformation_id.md) for a proximity device.
     * @remarks
     * If your computer supports Proximity and has an NFC device installed, which is commonly the case, then the [GetDefault](proximitydevice_getdefault_846721868.md) method will return the device that supports NFC. You can also determine whether your computer has an NFC device installed by querying the device information for the property "{FB3842CD-9E2A-4F83-8FCC-4B0761139AE9} 2". In the [DeviceInformation.Properties](../windows.devices.enumeration/deviceinformation_properties.md) object returned from the query the value for the "{FB3842CD-9E2A-4F83-8FCC-4B0761139AE9} 2" key contains and array of strings that describe the capabilities of the proximity device. If one of the strings is "StandardNfc", then the device supports NFC protocols such as NDEF. For more information on how to query for the properties of a device, see [How to retrieve additional properties for a device or PnP object](/previous-versions/windows/apps/hh464997(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Occurs when a device enters the proximate range.
     * @type {DeviceArrivedEventHandler}
    */
    OnDeviceArrived {
        get {
            if(!this.HasProp("__OnDeviceArrived")){
                this.__OnDeviceArrived := WinRTEventHandler(
                    DeviceArrivedEventHandler,
                    DeviceArrivedEventHandler.IID,
                    ProximityDevice
                )
                this.__OnDeviceArrivedToken := this.add_DeviceArrived(this.__OnDeviceArrived.iface)
            }
            return this.__OnDeviceArrived
        }
    }

    /**
     * Occurs when a device leaves the proximate range.
     * @type {DeviceDepartedEventHandler}
    */
    OnDeviceDeparted {
        get {
            if(!this.HasProp("__OnDeviceDeparted")){
                this.__OnDeviceDeparted := WinRTEventHandler(
                    DeviceDepartedEventHandler,
                    DeviceDepartedEventHandler.IID,
                    ProximityDevice
                )
                this.__OnDeviceDepartedToken := this.add_DeviceDeparted(this.__OnDeviceDeparted.iface)
            }
            return this.__OnDeviceDeparted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDeviceArrivedToken")) {
            this.remove_DeviceArrived(this.__OnDeviceArrivedToken)
            this.__OnDeviceArrived.iface.Dispose()
        }

        if(this.HasProp("__OnDeviceDepartedToken")) {
            this.remove_DeviceDeparted(this.__OnDeviceDepartedToken)
            this.__OnDeviceDeparted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Creates a subscription for a specified message type.
     * @remarks
     * After your app calls the SubscribeForMessage method, it will receive messages that are published with the same message type (as indicated by the *messageType* parameter) from any proximate devices. For details on the different message types, see the remarks in the [PublishBinaryMessage(String, IBuffer)](proximitydevice_publishbinarymessage_285088637.md) reference topic.
     * 
     * You can cancel a subscription by passing the subscription ID that's returned by the SubscribeForMessage method to the [StopSubscribingForMessage](proximitydevice_stopsubscribingformessage_728466472.md) method.
     * 
     * You can publish a message to a subscriber by using the [PublishMessage](proximitydevice_publishmessage_1881696512.md), [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md), or [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {HSTRING} messageType The type of message to deliver to this subscription.
     * @param {MessageReceivedHandler} messageReceivedHandler_ The handler that the proximity provider will call when it delivers a message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.subscribeformessage
     */
    SubscribeForMessage(messageType, messageReceivedHandler_) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.SubscribeForMessage(messageType, messageReceivedHandler_)
    }

    /**
     * Publishes a message to subscribers of the specified message type. The specified handler is called when the message has been transmitted.
     * @remarks
     * You can subscribe to published messages by using the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method.
     * 
     * Messages continue to be published until the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method is called or the [ProximityDevice](proximitydevice.md) object is released.
     * 
     * Messages are delivered to all applications that have subscribed to the message type (as indicated by the *messageType* parameter). Message type values are case-sensitive strings that consist of two parts: the *protocol* and the subtype. The *protocol* is first, followed by a dot (.) and then the *subtype*. For the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method, the *protocol* must always be "Windows.". The *subtype* is a string of alphanumeric characters and the following additional characters: **. ( ) + , - : = @ ; $ _ ! * '**. The *subtype* cannot exceed a length of 250 characters.
     * 
     * To publish messages by using another message type, like "WindowsMime." or "NDEF:WriteTag", you must use the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method.
     * 
     * You can use the [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method to publish a Uniform Resource Identifier (URI) to a proximate computer.
     * 
     * Messages are converted to UTF-8 characters before they're transmitted.
     * 
     * For UWP apps, publications and subscriptions are active only if the calling app is in the foreground.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {HSTRING} messageType The type of message to deliver to subscribers.
     * @param {HSTRING} message The message to deliver to subscribers.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishmessage
     */
    PublishMessage(messageType, message) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishMessage(messageType, message)
    }

    /**
     * Publishes a message to subscribers of the specified message type.
     * @remarks
     * You can subscribe to published messages by using the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method.
     * 
     * Messages continue to be published until the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method is called or the [ProximityDevice](proximitydevice.md) object is released.
     * 
     * Messages are delivered to all applications that have subscribed to the message type (as indicated by the *messageType* parameter). Message type values are case-sensitive strings that consist of two parts: the *protocol* and the subtype. The *protocol* is first, followed by a dot (.) and then the *subtype*. For the PublishMessage method, the *protocol* must always be "Windows.". The *subtype* is a string of alphanumeric characters and the following additional characters: **. ( ) + , - : = @ ; $ _ ! * '**. The *subtype* cannot exceed a length of 250 characters.
     * 
     * To publish messages by using another message type, like "WindowsMime." or "NDEF:WriteTag", you must use the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method.
     * 
     * You can use the [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method to publish a Uniform Resource Identifier (URI) to a proximate computer.
     * 
     * Messages are converted to UTF-8 characters before they're transmitted.
     * 
     * For UWP apps, publications and subscriptions are active only if the calling app is in the foreground.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {HSTRING} messageType The type of message to deliver to subscribers.
     * @param {HSTRING} message The message to deliver to subscribers.
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishmessage
     */
    PublishMessageWithCallback(messageType, message, messageTransmittedHandler_) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishMessageWithCallback(messageType, message, messageTransmittedHandler_)
    }

    /**
     * Publishes a message that contains binary data to subscribers of the specified message type. The specified handler is called when the message has been transmitted.
     * @remarks
     * You can publish multiple messages of the same message type and each publication will have a unique ID associated with it.
     * 
     * You can stop publishing a message by passing the publication ID returned by the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method to the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method.
     * 
     * Messages continue to be published until the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method is called or the [ProximityDevice](proximitydevice.md) is released.
     * 
     * You can subscribe to published messages using the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method.
     * 
     * You can use the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method to publish a text message to a proximate computer. You can use the [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method to publish a Uniform Resource Identifier (URI) to a proximate computer.
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * 
     * <!--Changing the content of this topic to try to force a snippet rebuild, for a code change for TFS 2412443-->
     * @param {HSTRING} messageType The type of message to deliver to subscribers.
     * @param {IBuffer} message The binary message data to deliver to subscribers.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishbinarymessage
     */
    PublishBinaryMessage(messageType, message) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishBinaryMessage(messageType, message)
    }

    /**
     * Publishes to subscribers of the specified message type a message that contains binary data.
     * @remarks
     * You can publish multiple messages of the same message type, and each publication will have a unique ID associated with it.
     * 
     * You can stop publishing a message by passing the publication ID (retrieved by PublishBinaryMessage) to [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md).
     * 
     * Messages continue to be published until [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) is called, or the [ProximityDevice](proximitydevice.md) is released.
     * 
     * You can subscribe to published messages using the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method.
     * 
     * You can use the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method to publish a text message to a proximate computer. You can use the [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method to publish a Uniform Resource Identifier (URI) to a proximate computer.
     * 
     * > [!IMPORTANT]
     * > The proximity APIs don't provide authentication, encryption, nor message integrity. Don't use proximity to exchange user-sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {HSTRING} messageType The type of message to deliver to subscribers.
     * @param {IBuffer} message The binary message data to deliver to subscribers.
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishbinarymessage
     */
    PublishBinaryMessageWithCallback(messageType, message, messageTransmittedHandler_) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishBinaryMessageWithCallback(messageType, message, messageTransmittedHandler_)
    }

    /**
     * Publishes a Uniform Resource Identifier (URI) to a proximate device. The specified handler is called when the message has been transmitted.
     * @remarks
     * Only one URI can be published at a time for each proximity device.
     * 
     * You can stop publishing a URI by passing the publication ID returned by the [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) method to the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method.
     * 
     * Unlike the other publish methods for a proximity device, URI publishing is handled by the default protocol handler for the URI. A subscription to a URI message publication is not required. You can receive URI messages by registering a default handler for a URI protocol such as the HTTP protocol.
     * 
     * The PackageFamilyName value of the sending application is automatically sent along with the URI. If no handler is registered for the protocol of a URI, the PackageFamilyName value of the sending application is used to direct the receiving application to the application store.
     * 
     * You can use the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method to publish a text message to a proximate computer. You can use the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method to publish non-text messages or messages that conform to the NDEF messaging standard.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {Uri} message The URI to publish.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishurimessage
     */
    PublishUriMessage(message) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishUriMessage(message)
    }

    /**
     * Publishes a Uniform Resource Identifier (URI) to a proximate device.
     * @remarks
     * Only one URI can be published at a time for each proximity device.
     * 
     * You can stop publishing a URI by passing the publication ID returned by the PublishUriMessage method to the [StopPublishingMessage](proximitydevice_stoppublishingmessage_1046474884.md) method.
     * 
     * Unlike the other publish methods for a proximity device, URI publishing is handled by the default protocol handler for the URI. A subscription to a URI message publication is not required. You can receive URI messages by registering a default handler for a URI protocol such as the HTTP protocol.
     * 
     * The PackageFamilyName value of the sending application is automatically sent along with the URI. If no handler is registered for the protocol of a URI, the PackageFamilyName value of the sending application is used to direct the receiving application to the application store.
     * 
     * You can use the [PublishMessage](proximitydevice_publishmessage_1881696512.md) method to publish a text message to a proximate computer. You can use the [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md) method to publish non-text messages or messages that conform to the NDEF messaging standard.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The proximity APIs do not provide authentication, encryption, or message integrity. Do not use proximity to exchange user sensitive information such as passwords, financial data, text messages, email, photographs, or government id numbers.
     * @param {Uri} message The URI to publish.
     * @param {MessageTransmittedHandler} messageTransmittedHandler_ 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.publishurimessage
     */
    PublishUriMessageWithCallback(message, messageTransmittedHandler_) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.PublishUriMessageWithCallback(message, messageTransmittedHandler_)
    }

    /**
     * Cancels a message subscription.
     * @remarks
     * The subscription ID for a message subscription is returned from the [SubscribeForMessage](proximitydevice_subscribeformessage_2022774312.md) method.
     * @param {Integer} subscriptionId The subscription ID for the message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.stopsubscribingformessage
     */
    StopSubscribingForMessage(subscriptionId) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.StopSubscribingForMessage(subscriptionId)
    }

    /**
     * Stops publishing a message.
     * @remarks
     * The publication ID for a message is returned from the [PublishMessage](proximitydevice_publishmessage_1881696512.md), [PublishBinaryMessage](proximitydevice_publishbinarymessage_285088637.md), and [PublishUriMessage](proximitydevice_publishurimessage_632953271.md) methods.
     * @param {Integer} messageId The publication ID for the message.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.proximitydevice.stoppublishingmessage
     */
    StopPublishingMessage(messageId) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.StopPublishingMessage(messageId)
    }

    /**
     * 
     * @param {DeviceArrivedEventHandler} arrivedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceArrived(arrivedHandler) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.add_DeviceArrived(arrivedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DeviceArrived(cookie) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.remove_DeviceArrived(cookie)
    }

    /**
     * 
     * @param {DeviceDepartedEventHandler} departedHandler 
     * @returns {EventRegistrationToken} 
     */
    add_DeviceDeparted(departedHandler) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.add_DeviceDeparted(departedHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_DeviceDeparted(cookie) {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.remove_DeviceDeparted(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxMessageBytes() {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.get_MaxMessageBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerSecond() {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.get_BitsPerSecond()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IProximityDevice")) {
            if ((queryResult := this.QueryInterface(IProximityDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProximityDevice := IProximityDevice(outPtr)
        }

        return this.__IProximityDevice.get_DeviceId()
    }

;@endregion Instance Methods
}
