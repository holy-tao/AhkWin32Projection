#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationCacheRequest.ahk
#Include .\IUIAutomationCondition.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods of a cache request. Client applications use this interface to specify the properties and control patterns to be cached when a Microsoft UI Automation element is obtained.
 * @remarks
 * 
  * Retrieving properties and control patterns through UI Automation requires cross-process calls that can slow down performance. By caching values of proprieties and control patterns in a batch operation, you can enhance the performance of your application.
  * 
  * Create a new cache request by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest">CreateCacheRequest</a>, and configure the request by calling methods of <b>IUIAutomationCacheRequest</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationCacheRequest extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationCacheRequest
     * @type {Guid}
     */
    static IID => Guid("{b32a92b5-bc25-4078-9c08-d7ee95c48e03}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProperty", "AddPattern", "Clone", "get_TreeScope", "put_TreeScope", "get_TreeFilter", "put_TreeFilter", "get_AutomationElementMode", "put_AutomationElementMode"]

    /**
     * 
     * @param {Integer} propertyId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addproperty
     */
    AddProperty(propertyId) {
        result := ComCall(3, this, "int", propertyId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addpattern
     */
    AddPattern(patternId) {
        result := ComCall(4, this, "int", patternId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUIAutomationCacheRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-clone
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &clonedRequest := 0, "HRESULT")
        return IUIAutomationCacheRequest(clonedRequest)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treescope
     */
    get_TreeScope() {
        result := ComCall(6, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treescope
     */
    put_TreeScope(scope) {
        result := ComCall(7, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treefilter
     */
    get_TreeFilter() {
        result := ComCall(8, this, "ptr*", &filter := 0, "HRESULT")
        return IUIAutomationCondition(filter)
    }

    /**
     * 
     * @param {IUIAutomationCondition} filter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treefilter
     */
    put_TreeFilter(filter) {
        result := ComCall(9, this, "ptr", filter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_automationelementmode
     */
    get_AutomationElementMode() {
        result := ComCall(10, this, "int*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_automationelementmode
     */
    put_AutomationElementMode(mode) {
        result := ComCall(11, this, "int", mode, "HRESULT")
        return result
    }
}
