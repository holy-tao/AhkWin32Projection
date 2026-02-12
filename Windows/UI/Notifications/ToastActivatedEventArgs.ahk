#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastActivatedEventArgs.ahk
#Include .\IToastActivatedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Exposes a method that retrieves the arguments associated with a toast action initiated by the user. This lets the app tell which action was taken when multiple actions were exposed.
 * @remarks
 * This object is provided to an event handler when a [ToastNotification.Activated](toastnotification_activated.md) event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastactivatedeventargs
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the arguments associated with a toast action initiated by the user. This arguments string was included in the toast's XML payload.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastactivatedeventargs.arguments
     * @type {HSTRING} 
     */
    Arguments {
        get => this.get_Arguments()
    }

    /**
     * For toast notifications that include text boxes for user input, contains the user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastactivatedeventargs.userinput
     * @type {ValueSet} 
     */
    UserInput {
        get => this.get_UserInput()
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
    get_Arguments() {
        if (!this.HasProp("__IToastActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IToastActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastActivatedEventArgs := IToastActivatedEventArgs(outPtr)
        }

        return this.__IToastActivatedEventArgs.get_Arguments()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_UserInput() {
        if (!this.HasProp("__IToastActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IToastActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastActivatedEventArgs2 := IToastActivatedEventArgs2(outPtr)
        }

        return this.__IToastActivatedEventArgs2.get_UserInput()
    }

;@endregion Instance Methods
}
