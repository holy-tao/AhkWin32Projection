#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserNotificationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info when a user notification changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotificationchangedeventargs
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class UserNotificationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserNotificationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserNotificationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of change this triggered the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotificationchangedeventargs.changekind
     * @type {Integer} 
     */
    ChangeKind {
        get => this.get_ChangeKind()
    }

    /**
     * Gets the ID of the user notification that changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotificationchangedeventargs.usernotificationid
     * @type {Integer} 
     */
    UserNotificationId {
        get => this.get_UserNotificationId()
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
    get_ChangeKind() {
        if (!this.HasProp("__IUserNotificationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserNotificationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationChangedEventArgs := IUserNotificationChangedEventArgs(outPtr)
        }

        return this.__IUserNotificationChangedEventArgs.get_ChangeKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserNotificationId() {
        if (!this.HasProp("__IUserNotificationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserNotificationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationChangedEventArgs := IUserNotificationChangedEventArgs(outPtr)
        }

        return this.__IUserNotificationChangedEventArgs.get_UserNotificationId()
    }

;@endregion Instance Methods
}
