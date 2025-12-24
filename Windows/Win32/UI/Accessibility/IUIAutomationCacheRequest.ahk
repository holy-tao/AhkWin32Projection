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
     * @type {Integer} 
     */
    TreeScope {
        get => this.get_TreeScope()
        set => this.put_TreeScope(value)
    }

    /**
     * @type {IUIAutomationCondition} 
     */
    TreeFilter {
        get => this.get_TreeFilter()
        set => this.put_TreeFilter(value)
    }

    /**
     * @type {Integer} 
     */
    AutomationElementMode {
        get => this.get_AutomationElementMode()
        set => this.put_AutomationElementMode(value)
    }

    /**
     * Adds a property to the cache request.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * A property identifier.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addproperty
     */
    AddProperty(propertyId) {
        result := ComCall(3, this, "int", propertyId, "HRESULT")
        return result
    }

    /**
     * Adds a control pattern to the cache request.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern to add to the cache request. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addpattern
     */
    AddPattern(patternId) {
        result := ComCall(4, this, "int", patternId, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the cache request.
     * @returns {IUIAutomationCacheRequest} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>**</b>
     * 
     * Receives a pointer to the copy of the cache request.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-clone
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &clonedRequest := 0, "HRESULT")
        return IUIAutomationCacheRequest(clonedRequest)
    }

    /**
     * Specifies the scope of caching.
     * @remarks
     * 
     * When an element is retrieved, caching can be performed  for only the element itself (the default behavior), or for the element and its children or descendants. This property describes the scope of the request.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treescope
     */
    get_TreeScope() {
        result := ComCall(6, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Specifies the scope of caching.
     * @remarks
     * 
     * When an element is retrieved, caching can be performed  for only the element itself (the default behavior), or for the element and its children or descendants. This property describes the scope of the request.
     * 
     * 
     * @param {Integer} scope 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treescope
     */
    put_TreeScope(scope) {
        result := ComCall(7, this, "int", scope, "HRESULT")
        return result
    }

    /**
     * Specifies the view of the UI Automation element tree that is used when caching.
     * @returns {IUIAutomationCondition} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treefilter
     */
    get_TreeFilter() {
        result := ComCall(8, this, "ptr*", &filter := 0, "HRESULT")
        return IUIAutomationCondition(filter)
    }

    /**
     * Specifies the view of the UI Automation element tree that is used when caching.
     * @param {IUIAutomationCondition} filter 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treefilter
     */
    put_TreeFilter(filter) {
        result := ComCall(9, this, "ptr", filter, "HRESULT")
        return result
    }

    /**
     * Indicates whether returned elements contain full references to the underlying UI, or only cached information.
     * @remarks
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_Full</a> is the default value, and specifies that returned elements contain a full reference to the underlying UI. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> specifies that the returned elements have no reference to the underlying UI, and contain only cached information.
     * 
     * Certain operations on elements, including <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">GetCurrentPropertyValue</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus">SetFocus</a>, require a full reference; attempting to perform these on an element that has none results in an error.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> can be more efficient when only properties are needed, as it avoids the overhead involved in setting up full references.
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_automationelementmode
     */
    get_AutomationElementMode() {
        result := ComCall(10, this, "int*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * Indicates whether returned elements contain full references to the underlying UI, or only cached information.
     * @remarks
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_Full</a> is the default value, and specifies that returned elements contain a full reference to the underlying UI. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> specifies that the returned elements have no reference to the underlying UI, and contain only cached information.
     * 
     * Certain operations on elements, including <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">GetCurrentPropertyValue</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus">SetFocus</a>, require a full reference; attempting to perform these on an element that has none results in an error.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> can be more efficient when only properties are needed, as it avoids the overhead involved in setting up full references.
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_automationelementmode
     */
    put_AutomationElementMode(mode) {
        result := ComCall(11, this, "int", mode, "HRESULT")
        return result
    }
}
