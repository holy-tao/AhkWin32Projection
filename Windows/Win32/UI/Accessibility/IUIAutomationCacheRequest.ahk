#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AutomationElementMode.ahk" { AutomationElementMode }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import ".\UIA_PATTERN_ID.ahk" { UIA_PATTERN_ID }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\TreeScope.ahk" { TreeScope }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes properties and methods of a cache request. Client applications use this interface to specify the properties and control patterns to be cached when a Microsoft UI Automation element is obtained.
 * @remarks
 * Retrieving properties and control patterns through UI Automation requires cross-process calls that can slow down performance. By caching values of proprieties and control patterns in a batch operation, you can enhance the performance of your application.
 * 
 * Create a new cache request by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest">CreateCacheRequest</a>, and configure the request by calling methods of <b>IUIAutomationCacheRequest</b>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationCacheRequest extends IUnknown {
    /**
     * The interface identifier for IUIAutomationCacheRequest
     * @type {Guid}
     */
    static IID := Guid("{b32a92b5-bc25-4078-9c08-d7ee95c48e03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationCacheRequest interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddProperty               : IntPtr
        AddPattern                : IntPtr
        Clone                     : IntPtr
        get_TreeScope             : IntPtr
        put_TreeScope             : IntPtr
        get_TreeFilter            : IntPtr
        put_TreeFilter            : IntPtr
        get_AutomationElementMode : IntPtr
        put_AutomationElementMode : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationCacheRequest.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {TreeScope} 
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
     * @type {AutomationElementMode} 
     */
    AutomationElementMode {
        get => this.get_AutomationElementMode()
        set => this.put_AutomationElementMode(value)
    }

    /**
     * Adds a property to the cache request.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * A property identifier.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addproperty
     */
    AddProperty(propertyId) {
        result := ComCall(3, this, UIA_PROPERTY_ID, propertyId, "HRESULT")
        return result
    }

    /**
     * Adds a control pattern to the cache request.
     * @remarks
     * Adding a control pattern that is already in the cache request has no effect.
     * @param {UIA_PATTERN_ID} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern to add to the cache request. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-addpattern
     */
    AddPattern(patternId) {
        result := ComCall(4, this, UIA_PATTERN_ID, patternId, "HRESULT")
        return result
    }

    /**
     * Creates a copy of the cache request.
     * @returns {IUIAutomationCacheRequest} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>**</b>
     * 
     * Receives a pointer to the copy of the cache request.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-clone
     */
    Clone() {
        result := ComCall(5, this, "ptr*", &clonedRequest := 0, "HRESULT")
        return IUIAutomationCacheRequest(clonedRequest)
    }

    /**
     * Specifies the scope of caching. (Get)
     * @remarks
     * When an element is retrieved, caching can be performed  for only the element itself (the default behavior), or for the element and its children or descendants. This property describes the scope of the request.
     * @returns {TreeScope} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treescope
     */
    get_TreeScope() {
        result := ComCall(6, this, "int*", &scope := 0, "HRESULT")
        return scope
    }

    /**
     * Specifies the scope of caching. (Put)
     * @remarks
     * When an element is retrieved, caching can be performed  for only the element itself (the default behavior), or for the element and its children or descendants. This property describes the scope of the request.
     * @param {TreeScope} scope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treescope
     */
    put_TreeScope(scope) {
        result := ComCall(7, this, TreeScope, scope, "HRESULT")
        return result
    }

    /**
     * Specifies the view of the UI Automation element tree that is used when caching. (Get)
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_treefilter
     */
    get_TreeFilter() {
        result := ComCall(8, this, "ptr*", &filter := 0, "HRESULT")
        return IUIAutomationCondition(filter)
    }

    /**
     * Specifies the view of the UI Automation element tree that is used when caching. (Put)
     * @param {IUIAutomationCondition} filter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_treefilter
     */
    put_TreeFilter(filter) {
        result := ComCall(9, this, "ptr", filter, "HRESULT")
        return result
    }

    /**
     * Indicates whether returned elements contain full references to the underlying UI, or only cached information. (Get)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_Full</a> is the default value, and specifies that returned elements contain a full reference to the underlying UI. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> specifies that the returned elements have no reference to the underlying UI, and contain only cached information.
     * 
     * Certain operations on elements, including <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">GetCurrentPropertyValue</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus">SetFocus</a>, require a full reference; attempting to perform these on an element that has none results in an error.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> can be more efficient when only properties are needed, as it avoids the overhead involved in setting up full references.
     * @returns {AutomationElementMode} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-get_automationelementmode
     */
    get_AutomationElementMode() {
        result := ComCall(10, this, "int*", &_mode := 0, "HRESULT")
        return _mode
    }

    /**
     * Indicates whether returned elements contain full references to the underlying UI, or only cached information. (Put)
     * @remarks
     * <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_Full</a> is the default value, and specifies that returned elements contain a full reference to the underlying UI. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> specifies that the returned elements have no reference to the underlying UI, and contain only cached information.
     * 
     * Certain operations on elements, including <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">GetCurrentPropertyValue</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus">SetFocus</a>, require a full reference; attempting to perform these on an element that has none results in an error.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-automationelementmode">AutomationElementMode_None</a> can be more efficient when only properties are needed, as it avoids the overhead involved in setting up full references.
     * @param {AutomationElementMode} _mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationcacherequest-put_automationelementmode
     */
    put_AutomationElementMode(_mode) {
        result := ComCall(11, this, AutomationElementMode, _mode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationCacheRequest.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddProperty := CallbackCreate(GetMethod(implObj, "AddProperty"), flags, 2)
        this.vtbl.AddPattern := CallbackCreate(GetMethod(implObj, "AddPattern"), flags, 2)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
        this.vtbl.get_TreeScope := CallbackCreate(GetMethod(implObj, "get_TreeScope"), flags, 2)
        this.vtbl.put_TreeScope := CallbackCreate(GetMethod(implObj, "put_TreeScope"), flags, 2)
        this.vtbl.get_TreeFilter := CallbackCreate(GetMethod(implObj, "get_TreeFilter"), flags, 2)
        this.vtbl.put_TreeFilter := CallbackCreate(GetMethod(implObj, "put_TreeFilter"), flags, 2)
        this.vtbl.get_AutomationElementMode := CallbackCreate(GetMethod(implObj, "get_AutomationElementMode"), flags, 2)
        this.vtbl.put_AutomationElementMode := CallbackCreate(GetMethod(implObj, "put_AutomationElementMode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddProperty)
        CallbackFree(this.vtbl.AddPattern)
        CallbackFree(this.vtbl.Clone)
        CallbackFree(this.vtbl.get_TreeScope)
        CallbackFree(this.vtbl.put_TreeScope)
        CallbackFree(this.vtbl.get_TreeFilter)
        CallbackFree(this.vtbl.put_TreeFilter)
        CallbackFree(this.vtbl.get_AutomationElementMode)
        CallbackFree(this.vtbl.put_AutomationElementMode)
    }
}
