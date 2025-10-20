#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomation4.ahk

/**
 * Extends the IUIAutomation4 interface to expose additional methods for controlling Microsoft UI Automation functionality.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation5
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation5 extends IUIAutomation4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomation5
     * @type {Guid}
     */
    static IID => Guid("{25f700c8-d816-4057-a9dc-3cbdee77e256}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 68

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddNotificationEventHandler", "RemoveNotificationEventHandler"]

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationNotificationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-addnotificationeventhandler
     */
    AddNotificationEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(68, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationNotificationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation5-removenotificationeventhandler
     */
    RemoveNotificationEventHandler(element, handler) {
        result := ComCall(69, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }
}
