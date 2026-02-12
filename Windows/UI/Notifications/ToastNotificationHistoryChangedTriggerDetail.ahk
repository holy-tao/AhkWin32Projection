#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationHistoryChangedTriggerDetail.ahk
#Include .\IToastNotificationHistoryChangedTriggerDetail2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the details of a toast history changed trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistorychangedtriggerdetail
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationHistoryChangedTriggerDetail extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotificationHistoryChangedTriggerDetail

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotificationHistoryChangedTriggerDetail.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value representing the kind of change that caused the toast history changed trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistorychangedtriggerdetail.changetype
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * Gets the ID of the notification group to which the notification that caused the change trigger belongs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistorychangedtriggerdetail.collectionid
     * @type {HSTRING} 
     */
    CollectionId {
        get => this.get_CollectionId()
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
    get_ChangeType() {
        if (!this.HasProp("__IToastNotificationHistoryChangedTriggerDetail")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistoryChangedTriggerDetail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistoryChangedTriggerDetail := IToastNotificationHistoryChangedTriggerDetail(outPtr)
        }

        return this.__IToastNotificationHistoryChangedTriggerDetail.get_ChangeType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CollectionId() {
        if (!this.HasProp("__IToastNotificationHistoryChangedTriggerDetail2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistoryChangedTriggerDetail2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistoryChangedTriggerDetail2 := IToastNotificationHistoryChangedTriggerDetail2(outPtr)
        }

        return this.__IToastNotificationHistoryChangedTriggerDetail2.get_CollectionId()
    }

;@endregion Instance Methods
}
