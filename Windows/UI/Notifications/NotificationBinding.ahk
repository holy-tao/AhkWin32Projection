#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotificationBinding.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the binding element of an adaptive notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationbinding
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class NotificationBinding extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotificationBinding

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotificationBinding.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the template for this binding visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationbinding.template
     * @type {HSTRING} 
     */
    Template {
        get => this.get_Template()
        set => this.put_Template(value)
    }

    /**
     * Gets or sets the language for this notification binding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationbinding.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets the formatting hints for the notification binding.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationbinding.hints
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Hints {
        get => this.get_Hints()
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
    get_Template() {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.get_Template()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Template(value) {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.put_Template(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.put_Language(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Hints() {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.get_Hints()
    }

    /**
     * Retrieves the text elements of this binding.
     * @returns {IVectorView<AdaptiveNotificationText>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.notificationbinding.gettextelements
     */
    GetTextElements() {
        if (!this.HasProp("__INotificationBinding")) {
            if ((queryResult := this.QueryInterface(INotificationBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotificationBinding := INotificationBinding(outPtr)
        }

        return this.__INotificationBinding.GetTextElements()
    }

;@endregion Instance Methods
}
