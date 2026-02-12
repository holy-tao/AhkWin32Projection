#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationManagerStatics5.ahk
#Include .\IToastNotificationManagerStatics.ahk
#Include .\IToastNotificationManagerStatics4.ahk
#Include .\IToastNotificationManagerStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates [ToastNotifier](toastnotifier.md) objects that you use to raise toast notifications. This class also provides access to the XML content of the system-provided toast templates so that you can customize that content for use in your notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationManager extends IInspectable {
;@region Static Properties
    /**
     * Gets the [ToastNotificationHistory](toastnotificationhistory.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.history
     * @type {ToastNotificationHistory} 
     */
    static History {
        get => ToastNotificationManager.get_History()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a toast notification manager for the current user.
     * @returns {ToastNotificationManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.getdefault
     */
    static GetDefault() {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics5.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics5 := IToastNotificationManagerStatics5(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics5.GetDefault()
    }

    /**
     * Creates and initializes a new instance of the [ToastNotification](toastnotification.md), bound to a specified app, usually another app in the same package.
     * @remarks
     * The app identified by *applicationId* must belong to the same package as the caller.
     * 
     * Use this form of the method if your app uses a background voice-over-Internet protocol (VOIP) agent, to specify the app ID required to show a toast in that case.
     * @returns {ToastNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.createtoastnotifier
     */
    static CreateToastNotifier() {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics := IToastNotificationManagerStatics(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics.CreateToastNotifier()
    }

    /**
     * Creates and initializes a new instance of the [ToastNotification](toastnotification.md), bound to the calling application, that lets you raise a toast notification to that app.
     * @remarks
     * Do not use this overload when creating a toast notifier for a desktop app. Use [CreateToastNotifier(appID)](toastnotificationmanager_createtoastnotifier_163337301.md) to supply the required [AppUserModelID](/windows/desktop/shell/appids).
     * 
     * If your app uses a background voice-over-Internet protocol (VOIP) agent, it must specify the app ID to show a toast. Use the [CreateToastNotifier(appID)](toastnotificationmanager_createtoastnotifier_163337301.md) method overload.
     * @param {HSTRING} applicationId 
     * @returns {ToastNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.createtoastnotifier
     */
    static CreateToastNotifierWithId(applicationId) {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics := IToastNotificationManagerStatics(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics.CreateToastNotifierWithId(applicationId)
    }

    /**
     * Gets the XML content of one of the predefined toast templates so that you can customize it for use in your notification.
     * @remarks
     * Instead of creating the full XML payload yourself, you can get a template and then use Document Object Model (DOM) manipulation functions to customize the part of the content that you want to change. You package this XML in a [ToastNotification](toastnotification.md) and send it to the tile through the [ToastNotifier](toastnotifier.md) that you create through the other methods of this class.
     * 
     * See [tile schema](/uwp/schemas/tiles/tilesschema/schema-root) for an explanation of tile elements and attributes.
     * @param {Integer} type One of the system-provided toast templates.
     * @returns {XmlDocument} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.gettemplatecontent
     */
    static GetTemplateContent(type) {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics := IToastNotificationManagerStatics(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics.GetTemplateContent(type)
    }

    /**
     * Gets a toast notification manager for the specified user.
     * @param {User} user_ The user who will receive the toast notifications.
     * @returns {ToastNotificationManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.getforuser
     */
    static GetForUser(user_) {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics4.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics4 := IToastNotificationManagerStatics4(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics4.GetForUser(user_)
    }

    /**
     * Specifies whether notification mirroring is allowed. Notification mirroring enables a notification to be broadcast on multiple devices.
     * @param {Integer} value One of the enumeration values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanager.configurenotificationmirroring
     */
    static ConfigureNotificationMirroring(value) {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics4.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics4 := IToastNotificationManagerStatics4(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics4.ConfigureNotificationMirroring(value)
    }

    /**
     * 
     * @returns {ToastNotificationHistory} 
     */
    static get_History() {
        if (!ToastNotificationManager.HasProp("__IToastNotificationManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ToastNotificationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationManagerStatics2.IID)
            ToastNotificationManager.__IToastNotificationManagerStatics2 := IToastNotificationManagerStatics2(factoryPtr)
        }

        return ToastNotificationManager.__IToastNotificationManagerStatics2.get_History()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
