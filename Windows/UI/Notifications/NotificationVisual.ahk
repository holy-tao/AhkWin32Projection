#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotificationVisual.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the visual element of a notification. The visual element contains bindings, which contain the text and other visual content for the notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationvisual
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationVisual extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotificationVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotificationVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the language for this notification visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationvisual.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets the bindings for this notification visual. Bindings contain text and other visual content for the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationvisual.bindings
     * @type {IVector<NotificationBinding>} 
     */
    Bindings {
        get => this.get_Bindings()
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
    get_Language() {
        if (!this.HasProp("__INotificationVisual")) {
            if ((queryResult := this.QueryInterface(INotificationVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationVisual := INotificationVisual(outPtr)
        }

        return this.__INotificationVisual.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__INotificationVisual")) {
            if ((queryResult := this.QueryInterface(INotificationVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationVisual := INotificationVisual(outPtr)
        }

        return this.__INotificationVisual.put_Language(value)
    }

    /**
     * 
     * @returns {IVector<NotificationBinding>} 
     */
    get_Bindings() {
        if (!this.HasProp("__INotificationVisual")) {
            if ((queryResult := this.QueryInterface(INotificationVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationVisual := INotificationVisual(outPtr)
        }

        return this.__INotificationVisual.get_Bindings()
    }

    /**
     * Retrieves the binding with the specified template.
     * @param {HSTRING} templateName The template for the binding visual. You can use the properties of the [KnownNotificationBindings](knownnotificationbindings.md) class to retrieve the string for each of the available template types.
     * @returns {NotificationBinding} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationvisual.getbinding
     */
    GetBinding(templateName) {
        if (!this.HasProp("__INotificationVisual")) {
            if ((queryResult := this.QueryInterface(INotificationVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationVisual := INotificationVisual(outPtr)
        }

        return this.__INotificationVisual.GetBinding(templateName)
    }

;@endregion Instance Methods
}
