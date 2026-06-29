#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\NotificationKind.ahk" { NotificationKind }
#Import ".\NotificationProcessing.ahk" { NotificationProcessing }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes a method to handle Microsoft UI Automation notification events.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler">AddNotificationEventHandler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationnotificationeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationNotificationEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationNotificationEventHandler
     * @type {Guid}
     */
    static IID := Guid("{c7cb2637-e6c2-4d0c-85de-4948c02175c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationNotificationEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandleNotificationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationNotificationEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles a Microsoft UI Automation notification event.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler">AddNotificationEventHandler</a>.
     * @param {IUIAutomationElement} sender A pointer to the element that raised the event.
     * @param {NotificationKind} _notificationKind 
     * @param {NotificationProcessing} _notificationProcessing 
     * @param {BSTR} displayString A string to display in the notification message.
     * @param {BSTR} activityId A unique non-localized string to identify an action or group of actions. This is used to pass additional information to the event handler.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationnotificationeventhandler-handlenotificationevent
     */
    HandleNotificationEvent(sender, _notificationKind, _notificationProcessing, displayString, activityId) {
        displayString := displayString is String ? BSTR.Alloc(displayString).Value : displayString
        activityId := activityId is String ? BSTR.Alloc(activityId).Value : activityId

        result := ComCall(3, this, "ptr", sender, NotificationKind, _notificationKind, NotificationProcessing, _notificationProcessing, BSTR, displayString, BSTR, activityId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationNotificationEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandleNotificationEvent := CallbackCreate(GetMethod(implObj, "HandleNotificationEvent"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandleNotificationEvent)
    }
}
