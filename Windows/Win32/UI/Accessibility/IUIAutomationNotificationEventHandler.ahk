#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method to handle Microsoft UI Automation notification events.
 * @remarks
 * 
  * This interface is implemented by the application to handle events that it has subscribed to by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler">AddNotificationEventHandler</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationnotificationeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationNotificationEventHandler extends IUnknown{
    /**
     * The interface identifier for IUIAutomationNotificationEventHandler
     * @type {Guid}
     */
    static IID => Guid("{c7cb2637-e6c2-4d0c-85de-4948c02175c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} sender 
     * @param {Integer} notificationKind 
     * @param {Integer} notificationProcessing 
     * @param {BSTR} displayString 
     * @param {BSTR} activityId 
     * @returns {HRESULT} 
     */
    HandleNotificationEvent(sender, notificationKind, notificationProcessing, displayString, activityId) {
        displayString := displayString is String ? BSTR.Alloc(displayString).Value : displayString
        activityId := activityId is String ? BSTR.Alloc(activityId).Value : activityId

        result := ComCall(3, this, "ptr", sender, "int", notificationKind, "int", notificationProcessing, "ptr", displayString, "ptr", activityId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
