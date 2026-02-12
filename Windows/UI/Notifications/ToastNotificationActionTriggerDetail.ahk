#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationActionTriggerDetail.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the details of a toast action trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationactiontriggerdetail
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationActionTriggerDetail extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotificationActionTriggerDetail

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotificationActionTriggerDetail.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value representing the argument that was passed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationactiontriggerdetail.argument
     * @type {HSTRING} 
     */
    Argument {
        get => this.get_Argument()
    }

    /**
     * Gets a value indicating the user's action.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationactiontriggerdetail.userinput
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
    get_Argument() {
        if (!this.HasProp("__IToastNotificationActionTriggerDetail")) {
            if ((queryResult := this.QueryInterface(IToastNotificationActionTriggerDetail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationActionTriggerDetail := IToastNotificationActionTriggerDetail(outPtr)
        }

        return this.__IToastNotificationActionTriggerDetail.get_Argument()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_UserInput() {
        if (!this.HasProp("__IToastNotificationActionTriggerDetail")) {
            if ((queryResult := this.QueryInterface(IToastNotificationActionTriggerDetail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationActionTriggerDetail := IToastNotificationActionTriggerDetail(outPtr)
        }

        return this.__IToastNotificationActionTriggerDetail.get_UserInput()
    }

;@endregion Instance Methods
}
