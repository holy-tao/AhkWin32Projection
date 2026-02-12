#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotification.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class Notification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotification.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the notification's expiration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

    /**
     * Gets or sets the visual for the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notification.visual
     * @type {NotificationVisual} 
     */
    Visual {
        get => this.get_Visual()
        set => this.put_Visual(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [Notification](notification.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.Notification")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__INotification")) {
            if ((queryResult := this.QueryInterface(INotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotification := INotification(outPtr)
        }

        return this.__INotification.get_ExpirationTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__INotification")) {
            if ((queryResult := this.QueryInterface(INotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotification := INotification(outPtr)
        }

        return this.__INotification.put_ExpirationTime(value)
    }

    /**
     * 
     * @returns {NotificationVisual} 
     */
    get_Visual() {
        if (!this.HasProp("__INotification")) {
            if ((queryResult := this.QueryInterface(INotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotification := INotification(outPtr)
        }

        return this.__INotification.get_Visual()
    }

    /**
     * 
     * @param {NotificationVisual} value 
     * @returns {HRESULT} 
     */
    put_Visual(value) {
        if (!this.HasProp("__INotification")) {
            if ((queryResult := this.QueryInterface(INotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotification := INotification(outPtr)
        }

        return this.__INotification.put_Visual(value)
    }

;@endregion Instance Methods
}
