#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IToastNotificationActionTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that causes a background task to run when the user performs an action on an interactive toast notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.toastnotificationactiontrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ToastNotificationActionTrigger extends IInspectable {
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
     * Creates and initializes a new instance of the [ToastNotificationActionTrigger](toastnotificationactiontrigger.md) class for the app with the specified identifier.
     * @param {HSTRING} applicationId The identifier of the app for which you want to create an instance of the [ToastNotificationActionTrigger](toastnotificationactiontrigger.md) class.
     * @returns {ToastNotificationActionTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.toastnotificationactiontrigger.#ctor
     */
    static Create(applicationId) {
        if (!ToastNotificationActionTrigger.HasProp("__IToastNotificationActionTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ToastNotificationActionTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationActionTriggerFactory.IID)
            ToastNotificationActionTrigger.__IToastNotificationActionTriggerFactory := IToastNotificationActionTriggerFactory(factoryPtr)
        }

        return ToastNotificationActionTrigger.__IToastNotificationActionTriggerFactory.Create(applicationId)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [ToastNotificationActionTrigger](toastnotificationactiontrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ToastNotificationActionTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
