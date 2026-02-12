#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorNotificationEventDetails.ahk
#Include .\INetworkOperatorTetheringEntitlementCheck.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides details for a network operator notification.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * The operating system extends battery life by suspending applications that are not in the foreground. If your application must handle new custom network operator messages even while suspended, you must create a background work item to handle the messages. When a new operator message arrives, the background work item will be activated. The NetworkOperatorNotificationEventDetails class provides the details of the event to your background work item code.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorNotificationEventDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorNotificationEventDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorNotificationEventDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the network notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.notificationtype
     * @type {Integer} 
     */
    NotificationType {
        get => this.get_NotificationType()
    }

    /**
     * Gets a unique identifier for the mobile broadband account that received the notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.networkaccountid
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * Gets the data-coding scheme (DCS) of the received message.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.encodingtype
     * @type {Integer} 
     */
    EncodingType {
        get => this.get_EncodingType()
    }

    /**
     * Gets the message for the network operator notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * If the data-coding scheme is Unicode, the message is a plaintext string that has already been decoded. If it is an operator-defined scheme, the message is a hex-encoded string representing an array of bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * Gets the identifier of the provisioned rule that matched and triggered the notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.ruleid
     * @type {HSTRING} 
     */
    RuleId {
        get => this.get_RuleId()
    }

    /**
     * Gets an SMS message for the mobile broadband account that received the notification.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.smsmessage
     * @type {ISmsMessage} 
     */
    SmsMessage {
        get => this.get_SmsMessage()
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
    get_NotificationType() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_NotificationType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_NetworkAccountId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncodingType() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_EncodingType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_Message()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RuleId() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_RuleId()
    }

    /**
     * 
     * @returns {ISmsMessage} 
     */
    get_SmsMessage() {
        if (!this.HasProp("__INetworkOperatorNotificationEventDetails")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorNotificationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorNotificationEventDetails := INetworkOperatorNotificationEventDetails(outPtr)
        }

        return this.__INetworkOperatorNotificationEventDetails.get_SmsMessage()
    }

    /**
     * Used to indicate if tethering is permitted for a device. If it is not, a reason can be provided.
     * @param {Boolean} allow true if tethering is permitted; otherwise, false.
     * @param {HSTRING} entitlementFailureReason The reason tethering is not permitted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatornotificationeventdetails.authorizetethering
     */
    AuthorizeTethering(allow, entitlementFailureReason) {
        if (!this.HasProp("__INetworkOperatorTetheringEntitlementCheck")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringEntitlementCheck.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringEntitlementCheck := INetworkOperatorTetheringEntitlementCheck(outPtr)
        }

        return this.__INetworkOperatorTetheringEntitlementCheck.AuthorizeTethering(allow, entitlementFailureReason)
    }

;@endregion Instance Methods
}
