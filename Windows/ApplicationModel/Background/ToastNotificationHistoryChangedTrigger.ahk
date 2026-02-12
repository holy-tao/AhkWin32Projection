#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IToastNotificationHistoryChangedTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that causes a background task to run when the history of toast notifications for the app is cleared, when one or more toast notifications are added to or removed from the notification history for the app, or when one or more toast notifications for the app expire and are removed from the notification history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.toastnotificationhistorychangedtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ToastNotificationHistoryChangedTrigger extends IInspectable {
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
     * Creates and initializes a new instance of the [ToastNotificationHistoryChangedTrigger](toastnotificationhistorychangedtrigger.md) class for the app with the specified identifier.
     * @param {HSTRING} applicationId The identifier of the app for which you want to create an instance of the [ToastNotificationHistoryChangedTrigger](toastnotificationhistorychangedtrigger.md) class.
     * @returns {ToastNotificationHistoryChangedTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.toastnotificationhistorychangedtrigger.#ctor
     */
    static Create(applicationId) {
        if (!ToastNotificationHistoryChangedTrigger.HasProp("__IToastNotificationHistoryChangedTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ToastNotificationHistoryChangedTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToastNotificationHistoryChangedTriggerFactory.IID)
            ToastNotificationHistoryChangedTrigger.__IToastNotificationHistoryChangedTriggerFactory := IToastNotificationHistoryChangedTriggerFactory(factoryPtr)
        }

        return ToastNotificationHistoryChangedTrigger.__IToastNotificationHistoryChangedTriggerFactory.Create(applicationId)
    }

;@endregion Static Methods

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [ToastNotificationHistoryChangedTrigger](toastnotificationhistorychangedtrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ToastNotificationHistoryChangedTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
