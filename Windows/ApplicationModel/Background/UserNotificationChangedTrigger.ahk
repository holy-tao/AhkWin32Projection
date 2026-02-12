#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IUserNotificationChangedTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that fires when a [UserNotification](../windows.ui.notifications/usernotification.md) is added or removed.
 * @remarks
 * The user notification listener requires that explicit user permission be granted before it may be used. Call [BackgroundExecutionManager.RequestAccessAsync](/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.RequestAccessAsync) from the UI thread before attempting to access notifications.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.usernotificationchangedtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class UserNotificationChangedTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the **UserNotificationChangedTrigger** class.
     * @param {Integer} notificationKinds_ The kind of notification trigger.
     * @returns {UserNotificationChangedTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.usernotificationchangedtrigger.#ctor
     */
    static Create(notificationKinds_) {
        if (!UserNotificationChangedTrigger.HasProp("__IUserNotificationChangedTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.UserNotificationChangedTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserNotificationChangedTriggerFactory.IID)
            UserNotificationChangedTrigger.__IUserNotificationChangedTriggerFactory := IUserNotificationChangedTriggerFactory(factoryPtr)
        }

        return UserNotificationChangedTrigger.__IUserNotificationChangedTriggerFactory.Create(notificationKinds_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
