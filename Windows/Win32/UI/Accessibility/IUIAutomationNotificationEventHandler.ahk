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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleNotificationEvent"]

    /**
     * 
     * @param {IUIAutomationElement} sender 
     * @param {Integer} notificationKind 
     * @param {Integer} notificationProcessing 
     * @param {BSTR} displayString 
     * @param {BSTR} activityId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationnotificationeventhandler-handlenotificationevent
     */
    HandleNotificationEvent(sender, notificationKind, notificationProcessing, displayString, activityId) {
        displayString := displayString is String ? BSTR.Alloc(displayString).Value : displayString
        activityId := activityId is String ? BSTR.Alloc(activityId).Value : activityId

        result := ComCall(3, this, "ptr", sender, "int", notificationKind, "int", notificationProcessing, "ptr", displayString, "ptr", activityId, "HRESULT")
        return result
    }
}
