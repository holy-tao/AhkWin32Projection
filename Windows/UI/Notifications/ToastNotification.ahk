#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotification.ahk
#Include .\IToastNotification2.ahk
#Include .\IToastNotification3.ahk
#Include .\IToastNotification4.ahk
#Include .\IToastNotification6.ahk
#Include .\IToastNotificationFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ToastNotification.ahk
#Include .\ToastDismissedEventArgs.ahk
#Include .\ToastFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Defines the content, associated metadata and events, and expiration time of a toast notification.
 * @remarks
 * For how-to guidance for implementing toast notifications in your app, see [Send a local toast notification from C# apps](/windows/apps/design/shell/tiles-and-notifications/send-local-toast).
 * 
 * Guidance for handling app activation for toast notifications:
 * 
 * - UWP Applications should use the [OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) for handling toast activations.
 * - Starting with WinRT Build 19041, packaged apps (including packaged apps with external location) are able to use [ToastNotificationActionTrigger](../windows.applicationmodel.background/toastnotificationactiontrigger.md) for handling activations [for more details](/windows/uwp/launch-resume/create-and-register-a-winmain-background-task#add-the-support-code-to-instantiate-the-com-class).
 * - Desktop apps can use COM activation by following [Desktop - Send Local Toast](/windows/uwp/design/shell/tiles-and-notifications/send-local-toast-desktop?tabs=msix-sparse#step-1-install-the-notifications-library).
 * - If none of the activation options fit your application, follow the example in this document for properly using event handlers.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of the [ToastNotification](toastnotification.md).
     * @param {XmlDocument} content The XML content that defines the toast notification.
     * @returns {ToastNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.#ctor
     */
    static CreateToastNotification(content) {
        if (!ToastNotification.HasProp("__IToastNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationFactory.IID)
            ToastNotification.__IToastNotificationFactory := IToastNotificationFactory(factoryPtr)
        }

        return ToastNotification.__IToastNotificationFactory.CreateToastNotification(content)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML that defines the current toast notification.
     * @remarks
     * The retrieved elements and their attributes are manipulated through Document Object Model (DOM) manipulation functions to customize the toast content. See [toast schema](/uwp/schemas/tiles/toastschema/schema-root)for an explanation of toast elements and attributes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets or sets the time after which a toast notification should not be displayed.
     * @remarks
     * Windows attempts to raise toast notifications immediately after you call [Show](toastnotifier_show_184420709.md), so this property is rarely used.
     * 
     * > For Windows Phone 8.x app: this property also causes the toast notification to be removed from the action center once the specified date and time is reached.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * Gets or sets the unique identifier of this notification within the notification [Group](toastnotification_group.md).
     * @remarks
     * This API returns an exception if the property is set to `null` or the empty string.
     * 
     * The tag can be maximum 16 characters long. However, the Creators Update (15063) extends this limit to 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets or sets the group identifier for the notification.
     * @remarks
     * In previous versions of Windows, the group property can be a maximum length of 16 characters long. However, in the Creators Update (15063), the maximum limit was increased to 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * Gets or sets whether a toast's pop-up UI is displayed on the user's screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.suppresspopup
     * @type {Boolean} 
     */
    SuppressPopup {
        get => this.get_SuppressPopup()
        set => this.put_SuppressPopup(value)
    }

    /**
     * Gets or sets a value that specifies whether notification mirroring is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.notificationmirroring
     * @type {Integer} 
     */
    NotificationMirroring {
        get => this.get_NotificationMirroring()
        set => this.put_NotificationMirroring(value)
    }

    /**
     * Gets or sets a remote id for the notification that enables the system to correlate this notification with another one generated on another device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets additional information about the status of the toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.data
     * @type {NotificationData} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets or sets the priority of the toast notification.
     * @remarks
     * The priority setting provides hints on how and at what urgency level a notification should be presented to the user (whether to wake up the screen, etc).
     * Whether the notification is displayed in high priority is based on the state and power management policy of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * Indicates whether the toast notification will remain in the Notification Center after a reboot.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotification.expiresonreboot
     * @type {Boolean} 
     */
    ExpiresOnReboot {
        get => this.get_ExpiresOnReboot()
        set => this.put_ExpiresOnReboot(value)
    }

    /**
     * Occurs when a toast notification leaves the screen, either by expiring or being explicitly dismissed by the user. Apps that are running subscribe to this event.
     * @remarks
     * The [ToastDismissalReason](toastdismissalreason.md) is included in the [ToastDismissedEventArgs](toastdismissedeventargs.md) parameter.
     * @type {TypedEventHandler<ToastNotification, ToastDismissedEventArgs>}
    */
    OnDismissed {
        get {
            if(!this.HasProp("__OnDismissed")){
                this.__OnDismissed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{61c2402f-0ed0-5a18-ab69-59f4aa99a368}"),
                    ToastNotification,
                    ToastDismissedEventArgs
                )
                this.__OnDismissedToken := this.add_Dismissed(this.__OnDismissed.iface)
            }
            return this.__OnDismissed
        }
    }

    /**
     * Occurs when user activates a toast notification through a click or touch. Apps that are running subscribe to this event.
     * @remarks
     * In the case of toast raised by a desktop app, that app must subscribe to at least the Activated event so that it can handle the expected activation of the app from the toast when the user selects it.
     * @type {TypedEventHandler<ToastNotification, IInspectable>}
    */
    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ab54de2d-97d9-5528-b6ad-105afe156530}"),
                    ToastNotification,
                    IInspectable
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    /**
     * Occurs when an error is caused when Windows attempts to raise a toast notification. Apps that are running subscribe to this event.
     * @remarks
     * The reason for the toast's failure can be found in the [ErrorCode](toastfailedeventargs_errorcode.md) property of the [ToastFailedEventArgs](toastfailedeventargs.md) parameter.
     * 
     * The most common failure that you'll see when you raise a toast is a [settings](notificationsetting.md) error, for instance a block on toast notifications for this user. We recommend that you call [ToastNotifier.Setting](toastnotifier_setting.md) before you call [Show](toastnotifier_show_184420709.md) instead of handling that situation through this event.
     * @type {TypedEventHandler<ToastNotification, ToastFailedEventArgs>}
    */
    OnFailed {
        get {
            if(!this.HasProp("__OnFailed")){
                this.__OnFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{95e3e803-c969-5e3a-9753-ea2ad22a9a33}"),
                    ToastNotification,
                    ToastFailedEventArgs
                )
                this.__OnFailedToken := this.add_Failed(this.__OnFailed.iface)
            }
            return this.__OnFailed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDismissedToken")) {
            this.remove_Dismissed(this.__OnDismissedToken)
            this.__OnDismissed.iface.Dispose()
        }

        if(this.HasProp("__OnActivatedToken")) {
            this.remove_Activated(this.__OnActivatedToken)
            this.__OnActivated.iface.Dispose()
        }

        if(this.HasProp("__OnFailedToken")) {
            this.remove_Failed(this.__OnFailedToken)
            this.__OnFailed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_Content() {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.get_Content()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.get_ExpirationTime()
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotification, ToastDismissedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Dismissed(handler) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.add_Dismissed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Dismissed(token) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.remove_Dismissed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotification, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Activated(token) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.remove_Activated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotification, ToastFailedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Failed(handler) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.add_Failed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Failed(token) {
        if (!this.HasProp("__IToastNotification")) {
            if ((queryResult := this.QueryInterface(IToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification := IToastNotification(outPtr)
        }

        return this.__IToastNotification.remove_Failed(token)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.get_Tag()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.put_Group(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.get_Group()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SuppressPopup(value) {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.put_SuppressPopup(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SuppressPopup() {
        if (!this.HasProp("__IToastNotification2")) {
            if ((queryResult := this.QueryInterface(IToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification2 := IToastNotification2(outPtr)
        }

        return this.__IToastNotification2.get_SuppressPopup()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationMirroring() {
        if (!this.HasProp("__IToastNotification3")) {
            if ((queryResult := this.QueryInterface(IToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification3 := IToastNotification3(outPtr)
        }

        return this.__IToastNotification3.get_NotificationMirroring()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NotificationMirroring(value) {
        if (!this.HasProp("__IToastNotification3")) {
            if ((queryResult := this.QueryInterface(IToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification3 := IToastNotification3(outPtr)
        }

        return this.__IToastNotification3.put_NotificationMirroring(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IToastNotification3")) {
            if ((queryResult := this.QueryInterface(IToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification3 := IToastNotification3(outPtr)
        }

        return this.__IToastNotification3.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IToastNotification3")) {
            if ((queryResult := this.QueryInterface(IToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification3 := IToastNotification3(outPtr)
        }

        return this.__IToastNotification3.put_RemoteId(value)
    }

    /**
     * 
     * @returns {NotificationData} 
     */
    get_Data() {
        if (!this.HasProp("__IToastNotification4")) {
            if ((queryResult := this.QueryInterface(IToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification4 := IToastNotification4(outPtr)
        }

        return this.__IToastNotification4.get_Data()
    }

    /**
     * 
     * @param {NotificationData} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IToastNotification4")) {
            if ((queryResult := this.QueryInterface(IToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification4 := IToastNotification4(outPtr)
        }

        return this.__IToastNotification4.put_Data(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        if (!this.HasProp("__IToastNotification4")) {
            if ((queryResult := this.QueryInterface(IToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification4 := IToastNotification4(outPtr)
        }

        return this.__IToastNotification4.get_Priority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        if (!this.HasProp("__IToastNotification4")) {
            if ((queryResult := this.QueryInterface(IToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification4 := IToastNotification4(outPtr)
        }

        return this.__IToastNotification4.put_Priority(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExpiresOnReboot() {
        if (!this.HasProp("__IToastNotification6")) {
            if ((queryResult := this.QueryInterface(IToastNotification6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification6 := IToastNotification6(outPtr)
        }

        return this.__IToastNotification6.get_ExpiresOnReboot()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ExpiresOnReboot(value) {
        if (!this.HasProp("__IToastNotification6")) {
            if ((queryResult := this.QueryInterface(IToastNotification6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotification6 := IToastNotification6(outPtr)
        }

        return this.__IToastNotification6.put_ExpiresOnReboot(value)
    }

;@endregion Instance Methods
}
