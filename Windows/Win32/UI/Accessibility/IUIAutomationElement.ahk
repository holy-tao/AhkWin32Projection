#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\OrientationType.ahk" { OrientationType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\TreeScope.ahk" { TreeScope }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\UIA_PATTERN_ID.ahk" { UIA_PATTERN_ID }
#Import ".\UIA_CONTROLTYPE_ID.ahk" { UIA_CONTROLTYPE_ID }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Exposes methods and properties for a UI Automation element, which represents a UI item.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement extends IUnknown {
    /**
     * The interface identifier for IUIAutomationElement
     * @type {Guid}
     */
    static IID := Guid("{d22108aa-8ac5-49a5-837b-37bbb3d7591e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFocus                        : IntPtr
        GetRuntimeId                    : IntPtr
        FindFirst                       : IntPtr
        FindAll                         : IntPtr
        FindFirstBuildCache             : IntPtr
        FindAllBuildCache               : IntPtr
        BuildUpdatedCache               : IntPtr
        GetCurrentPropertyValue         : IntPtr
        GetCurrentPropertyValueEx       : IntPtr
        GetCachedPropertyValue          : IntPtr
        GetCachedPropertyValueEx        : IntPtr
        GetCurrentPatternAs             : IntPtr
        GetCachedPatternAs              : IntPtr
        GetCurrentPattern               : IntPtr
        GetCachedPattern                : IntPtr
        GetCachedParent                 : IntPtr
        GetCachedChildren               : IntPtr
        get_CurrentProcessId            : IntPtr
        get_CurrentControlType          : IntPtr
        get_CurrentLocalizedControlType : IntPtr
        get_CurrentName                 : IntPtr
        get_CurrentAcceleratorKey       : IntPtr
        get_CurrentAccessKey            : IntPtr
        get_CurrentHasKeyboardFocus     : IntPtr
        get_CurrentIsKeyboardFocusable  : IntPtr
        get_CurrentIsEnabled            : IntPtr
        get_CurrentAutomationId         : IntPtr
        get_CurrentClassName            : IntPtr
        get_CurrentHelpText             : IntPtr
        get_CurrentCulture              : IntPtr
        get_CurrentIsControlElement     : IntPtr
        get_CurrentIsContentElement     : IntPtr
        get_CurrentIsPassword           : IntPtr
        get_CurrentNativeWindowHandle   : IntPtr
        get_CurrentItemType             : IntPtr
        get_CurrentIsOffscreen          : IntPtr
        get_CurrentOrientation          : IntPtr
        get_CurrentFrameworkId          : IntPtr
        get_CurrentIsRequiredForForm    : IntPtr
        get_CurrentItemStatus           : IntPtr
        get_CurrentBoundingRectangle    : IntPtr
        get_CurrentLabeledBy            : IntPtr
        get_CurrentAriaRole             : IntPtr
        get_CurrentAriaProperties       : IntPtr
        get_CurrentIsDataValidForForm   : IntPtr
        get_CurrentControllerFor        : IntPtr
        get_CurrentDescribedBy          : IntPtr
        get_CurrentFlowsTo              : IntPtr
        get_CurrentProviderDescription  : IntPtr
        get_CachedProcessId             : IntPtr
        get_CachedControlType           : IntPtr
        get_CachedLocalizedControlType  : IntPtr
        get_CachedName                  : IntPtr
        get_CachedAcceleratorKey        : IntPtr
        get_CachedAccessKey             : IntPtr
        get_CachedHasKeyboardFocus      : IntPtr
        get_CachedIsKeyboardFocusable   : IntPtr
        get_CachedIsEnabled             : IntPtr
        get_CachedAutomationId          : IntPtr
        get_CachedClassName             : IntPtr
        get_CachedHelpText              : IntPtr
        get_CachedCulture               : IntPtr
        get_CachedIsControlElement      : IntPtr
        get_CachedIsContentElement      : IntPtr
        get_CachedIsPassword            : IntPtr
        get_CachedNativeWindowHandle    : IntPtr
        get_CachedItemType              : IntPtr
        get_CachedIsOffscreen           : IntPtr
        get_CachedOrientation           : IntPtr
        get_CachedFrameworkId           : IntPtr
        get_CachedIsRequiredForForm     : IntPtr
        get_CachedItemStatus            : IntPtr
        get_CachedBoundingRectangle     : IntPtr
        get_CachedLabeledBy             : IntPtr
        get_CachedAriaRole              : IntPtr
        get_CachedAriaProperties        : IntPtr
        get_CachedIsDataValidForForm    : IntPtr
        get_CachedControllerFor         : IntPtr
        get_CachedDescribedBy           : IntPtr
        get_CachedFlowsTo               : IntPtr
        get_CachedProviderDescription   : IntPtr
        GetClickablePoint               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    CurrentProcessId {
        get => this.get_CurrentProcessId()
    }

    /**
     * @type {UIA_CONTROLTYPE_ID} 
     */
    CurrentControlType {
        get => this.get_CurrentControlType()
    }

    /**
     * @type {BSTR} 
     */
    CurrentLocalizedControlType {
        get => this.get_CurrentLocalizedControlType()
    }

    /**
     * @type {BSTR} 
     */
    CurrentName {
        get => this.get_CurrentName()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAcceleratorKey {
        get => this.get_CurrentAcceleratorKey()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAccessKey {
        get => this.get_CurrentAccessKey()
    }

    /**
     * @type {BOOL} 
     */
    CurrentHasKeyboardFocus {
        get => this.get_CurrentHasKeyboardFocus()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsKeyboardFocusable {
        get => this.get_CurrentIsKeyboardFocusable()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsEnabled {
        get => this.get_CurrentIsEnabled()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAutomationId {
        get => this.get_CurrentAutomationId()
    }

    /**
     * @type {BSTR} 
     */
    CurrentClassName {
        get => this.get_CurrentClassName()
    }

    /**
     * @type {BSTR} 
     */
    CurrentHelpText {
        get => this.get_CurrentHelpText()
    }

    /**
     * @type {Integer} 
     */
    CurrentCulture {
        get => this.get_CurrentCulture()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsControlElement {
        get => this.get_CurrentIsControlElement()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsContentElement {
        get => this.get_CurrentIsContentElement()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsPassword {
        get => this.get_CurrentIsPassword()
    }

    /**
     * @type {HWND} 
     */
    CurrentNativeWindowHandle {
        get => this.get_CurrentNativeWindowHandle()
    }

    /**
     * @type {BSTR} 
     */
    CurrentItemType {
        get => this.get_CurrentItemType()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsOffscreen {
        get => this.get_CurrentIsOffscreen()
    }

    /**
     * @type {OrientationType} 
     */
    CurrentOrientation {
        get => this.get_CurrentOrientation()
    }

    /**
     * @type {BSTR} 
     */
    CurrentFrameworkId {
        get => this.get_CurrentFrameworkId()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsRequiredForForm {
        get => this.get_CurrentIsRequiredForForm()
    }

    /**
     * @type {BSTR} 
     */
    CurrentItemStatus {
        get => this.get_CurrentItemStatus()
    }

    /**
     * @type {RECT} 
     */
    CurrentBoundingRectangle {
        get => this.get_CurrentBoundingRectangle()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CurrentLabeledBy {
        get => this.get_CurrentLabeledBy()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAriaRole {
        get => this.get_CurrentAriaRole()
    }

    /**
     * @type {BSTR} 
     */
    CurrentAriaProperties {
        get => this.get_CurrentAriaProperties()
    }

    /**
     * @type {BOOL} 
     */
    CurrentIsDataValidForForm {
        get => this.get_CurrentIsDataValidForForm()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CurrentControllerFor {
        get => this.get_CurrentControllerFor()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CurrentDescribedBy {
        get => this.get_CurrentDescribedBy()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CurrentFlowsTo {
        get => this.get_CurrentFlowsTo()
    }

    /**
     * @type {BSTR} 
     */
    CurrentProviderDescription {
        get => this.get_CurrentProviderDescription()
    }

    /**
     * @type {Integer} 
     */
    CachedProcessId {
        get => this.get_CachedProcessId()
    }

    /**
     * @type {UIA_CONTROLTYPE_ID} 
     */
    CachedControlType {
        get => this.get_CachedControlType()
    }

    /**
     * @type {BSTR} 
     */
    CachedLocalizedControlType {
        get => this.get_CachedLocalizedControlType()
    }

    /**
     * @type {BSTR} 
     */
    CachedName {
        get => this.get_CachedName()
    }

    /**
     * @type {BSTR} 
     */
    CachedAcceleratorKey {
        get => this.get_CachedAcceleratorKey()
    }

    /**
     * @type {BSTR} 
     */
    CachedAccessKey {
        get => this.get_CachedAccessKey()
    }

    /**
     * @type {BOOL} 
     */
    CachedHasKeyboardFocus {
        get => this.get_CachedHasKeyboardFocus()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsKeyboardFocusable {
        get => this.get_CachedIsKeyboardFocusable()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsEnabled {
        get => this.get_CachedIsEnabled()
    }

    /**
     * @type {BSTR} 
     */
    CachedAutomationId {
        get => this.get_CachedAutomationId()
    }

    /**
     * @type {BSTR} 
     */
    CachedClassName {
        get => this.get_CachedClassName()
    }

    /**
     * @type {BSTR} 
     */
    CachedHelpText {
        get => this.get_CachedHelpText()
    }

    /**
     * @type {Integer} 
     */
    CachedCulture {
        get => this.get_CachedCulture()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsControlElement {
        get => this.get_CachedIsControlElement()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsContentElement {
        get => this.get_CachedIsContentElement()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsPassword {
        get => this.get_CachedIsPassword()
    }

    /**
     * @type {HWND} 
     */
    CachedNativeWindowHandle {
        get => this.get_CachedNativeWindowHandle()
    }

    /**
     * @type {BSTR} 
     */
    CachedItemType {
        get => this.get_CachedItemType()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsOffscreen {
        get => this.get_CachedIsOffscreen()
    }

    /**
     * @type {OrientationType} 
     */
    CachedOrientation {
        get => this.get_CachedOrientation()
    }

    /**
     * @type {BSTR} 
     */
    CachedFrameworkId {
        get => this.get_CachedFrameworkId()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsRequiredForForm {
        get => this.get_CachedIsRequiredForForm()
    }

    /**
     * @type {BSTR} 
     */
    CachedItemStatus {
        get => this.get_CachedItemStatus()
    }

    /**
     * @type {RECT} 
     */
    CachedBoundingRectangle {
        get => this.get_CachedBoundingRectangle()
    }

    /**
     * @type {IUIAutomationElement} 
     */
    CachedLabeledBy {
        get => this.get_CachedLabeledBy()
    }

    /**
     * @type {BSTR} 
     */
    CachedAriaRole {
        get => this.get_CachedAriaRole()
    }

    /**
     * @type {BSTR} 
     */
    CachedAriaProperties {
        get => this.get_CachedAriaProperties()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsDataValidForForm {
        get => this.get_CachedIsDataValidForForm()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CachedControllerFor {
        get => this.get_CachedControllerFor()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CachedDescribedBy {
        get => this.get_CachedDescribedBy()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CachedFlowsTo {
        get => this.get_CachedFlowsTo()
    }

    /**
     * @type {BSTR} 
     */
    CachedProviderDescription {
        get => this.get_CachedProviderDescription()
    }

    /**
     * Sets the keyboard focus to this UI Automation element.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus
     */
    SetFocus() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the unique identifier assigned to the UI element.
     * @remarks
     * The identifier is only guaranteed to be unique to the UI of the desktop on which it was generated. Identifiers can be reused over time.
     * 
     * The format of run-time identifiers might change in the future. The returned identifier should be treated as an opaque value and used only for comparison; for example, to determine whether a Microsoft UI Automation element is in the cache.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the runtime ID as an array of integers.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getruntimeid
     */
    GetRuntimeId() {
        result := ComCall(4, this, "ptr*", &runtimeId := 0, "HRESULT")
        return runtimeId
    }

    /**
     * Retrieves the first child or descendant element that matches the specified condition.
     * @remarks
     * The scope of the search is relative to the element on which the method is called. Elements are returned in the order in which they were encountered in the tree.
     * 
     * This function cannot search for ancestor elements in the Microsoft UI Automation tree; that is, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Ancestors</a>  is not a valid value for the <i>scope</i> parameter.
     * 
     * When searching for top-level windows on the desktop, be sure to specify <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Children</a> in the <i>scope</i> parameter, not <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Descendants</a>. A search through the entire subtree of the desktop could iterate through thousands of items and lead to a stack overflow.
     * 
     * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
     * 
     * This function ignores elements in the raw tree. Call <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirstbuildcache">FindFirstBuildCache</a> to search the raw tree by specifying the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a> passed to that function.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst
     */
    FindFirst(scope, condition) {
        result := ComCall(5, this, TreeScope, scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Returns all UI Automation elements that satisfy the specified condition.
     * @remarks
     * The scope of the search is relative to the element on which the method is called. Elements are returned in the order in which they are encountered in the tree.
     * 
     * This function cannot search for ancestor elements in the Microsoft UI Automation tree; that is, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Ancestors</a>  is not a valid value for the <i>scope</i> parameter.
     * 
     * When searching for top-level windows on the desktop, be sure to specify <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Children</a> in the <i>scope</i> parameter, not <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Descendants</a>. A search through the entire subtree of the desktop could iterate through thousands of items and lead to a stack overflow.
     * 
     * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall
     */
    FindAll(scope, condition) {
        result := ComCall(6, this, TreeScope, scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Retrieves the first child or descendant element that matches the specified condition, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @remarks
     * The scope of the search is relative to the element on which the method is called. Elements are returned in the order in which they were encountered in the tree.
     * 
     * This function cannot search for ancestor elements in the Microsoft UI Automation tree; that is, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Ancestors</a>  is not a valid value for the <i>scope</i> parameter.
     * 
     * When searching for top-level windows on the desktop, be sure to specify <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Children</a> in the <i>scope</i> parameter, not <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Descendants</a>. A search through the entire subtree of the desktop could iterate through thousands of items and lead to a stack overflow.
     * 
     * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
     * 
     * To search the raw tree, specify the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope</a> in the <i>cacheRequest</i> parameter.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the matching element, or <b>NULL</b> if no matching element is found.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirstbuildcache
     */
    FindFirstBuildCache(scope, condition, cacheRequest) {
        result := ComCall(7, this, TreeScope, scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Returns all UI Automation elements that satisfy the specified condition, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @remarks
     * The scope of the search is relative to the element on which the method is called. Elements are returned in the order in which they were encountered in the tree.
     * 
     * This function cannot search for ancestor elements in the Microsoft UI Automation tree; that is, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Ancestors</a>  is not a valid value for the <i>scope</i> parameter.
     * 
     * When searching for top-level windows on the desktop, be sure to specify <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Children</a> in the <i>scope</i> parameter, not <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Descendants</a>. A search through the entire subtree of the desktop could iterate through thousands of items and lead to a stack overflow.
     * 
     * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
     * @param {TreeScope} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to an array of matching elements. If there are no matches, <b>NULL</b> is returned.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findallbuildcache
     */
    FindAllBuildCache(scope, condition, cacheRequest) {
        result := ComCall(8, this, TreeScope, scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Retrieves a new UI Automation element with an updated cache.
     * @remarks
     * The original UI Automation element is unchanged. The new <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface refers to the same element and has the same runtime identifier.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the new UI Automation element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-buildupdatedcache
     */
    BuildUpdatedCache(cacheRequest) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", &updatedElement := 0, "HRESULT")
        return IUIAutomationElement(updatedElement)
    }

    /**
     * Retrieves the current value of a property for this UI Automation element.
     * @remarks
     * Microsoft UI Automation properties of the <b>double</b> type support Not a Number (NaN) values. When retrieving a property of the <b>double</b> type, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue
     */
    GetCurrentPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(10, this, UIA_PROPERTY_ID, propertyId, VARIANT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value for this UI Automation element, optionally ignoring any default value.
     * @remarks
     * Passing <b>FALSE</b> in the <i>ignoreDefaultValue</i> parameter is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">IUIAutomationElement::GetCurrentPropertyValue</a>.
     * 
     * If the Microsoft UI Automation provider for the element itself supports the property, the value of the property is returned. Otherwise, if <i>ignoreDefaultValue</i> is <b>FALSE</b>, a default value specified by UI Automation is returned. 
     * 
     *  This method returns a failure code if the requested property was not previously cached.
     * 
     * UI Automation properties of the <b>double</b> type support Not a Number (NaN) values. When retrieving a property of the <b>double</b> type, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {BOOL} ignoreDefaultValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether a default value should be ignored if the specified property is not supported: <b>TRUE</b> if the default value is not to be returned, or <b>FALSE</b> if it is to be returned.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the property value.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalueex
     */
    GetCurrentPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(11, this, UIA_PROPERTY_ID, propertyId, BOOL, ignoreDefaultValue, VARIANT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value from the cache for this UI Automation element.
     * @remarks
     * Microsoft UI Automation properties of the <b>double</b> type support Not a Number (NaN) values. When retrieving a property of the <b>double</b> type, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the cached property.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue
     */
    GetCachedPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(12, this, UIA_PROPERTY_ID, propertyId, VARIANT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value from the cache for this UI Automation element, optionally ignoring any default value.
     * @remarks
     * This method retrieves the specified property from the cache for the UI Automation element. To retrieve the current property, call <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalueex">IUIAutomationElement::GetCurrentPropertyValueEx</a>.
     * 
     * Passing <b>FALSE</b> in the <i>ignoreDefaultValue</i> parameter is equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue">IUIAutomationElement::GetCachedPropertyValue</a>.
     * 
     * If the Microsoft UI Automation provider for the element itself supports the property, the value of the property is returned. Otherwise, if <i>ignoreDefaultValue</i> is <b>FALSE</b>, a default value specified by UI Automation is returned. 
     * 
     * This method returns a failure code  if the requested property was not previously cached.
     * 
     * UI Automation properties of the <b>double</b> type support Not a Number (NaN) values. When retrieving a property of the <b>double</b> type, a client can use the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-6.0/aa298428(v=vs.60)">_isnan</a> function to determine whether the property is a NaN value.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {BOOL} ignoreDefaultValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether a default value should be ignored if the specified property is not supported: <b>TRUE</b> if the default value is not to be returned, or <b>FALSE</b> if it is to be returned.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalueex
     */
    GetCachedPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(13, this, UIA_PROPERTY_ID, propertyId, BOOL, ignoreDefaultValue, VARIANT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the control pattern interface of the specified pattern on this UI Automation element.
     * @remarks
     * It is recommended that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {UIA_PATTERN_ID} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpatternas
     */
    GetCurrentPatternAs(patternId, riid) {
        result := ComCall(14, this, UIA_PATTERN_ID, patternId, Guid.Ptr, riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * Retrieves the control pattern interface of the specified pattern from the cache of this UI Automation element.
     * @remarks
     * It is recommended that you use the <b>IID_PPV_ARGS</b> macro, defined in Objbase.h, to package the <i>riid</i> and <i>ppv</i> parameters. This macro provides the correct IID based on the interface pointed to by the value in <i>ppv</i>, which eliminates the possibility of a coding error.
     * @param {UIA_PATTERN_ID} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpatternas
     */
    GetCachedPatternAs(patternId, riid) {
        result := ComCall(15, this, UIA_PATTERN_ID, patternId, Guid.Ptr, riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * Retrieves the IUnknown interface of the specified control pattern on this UI Automation element.
     * @remarks
     * This method gets the specified control pattern based on its availability at the time of the call.
     * 
     * For some forms of UI, this method will incur cross-process performance overhead. Applications can reduce overhead by caching control patterns and then retrieving them by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpattern">IUIAutomationElement::GetCachedPattern</a>.
     * @param {UIA_PATTERN_ID} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern
     */
    GetCurrentPattern(patternId) {
        result := ComCall(16, this, UIA_PATTERN_ID, patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * Retrieves from the cache the IUnknown interface of the specified control pattern of this UI Automation element.
     * @param {UIA_PATTERN_ID} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpattern
     */
    GetCachedPattern(patternId) {
        result := ComCall(17, this, UIA_PATTERN_ID, patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * Retrieves from the cache the parent of this UI Automation element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the cached parent element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedparent
     */
    GetCachedParent() {
        result := ComCall(18, this, "ptr*", &parent := 0, "HRESULT")
        return IUIAutomationElement(parent)
    }

    /**
     * Retrieves the cached child elements of this UI Automation element.
     * @remarks
     * The view of the returned collection is determined by the TreeFilter property of the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a> that was active when this element was obtained.
     * 
     * Children are cached only if the scope of the cache request included <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Subtree</a>, <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Children</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/ne-uiautomationclient-treescope">TreeScope_Descendants</a>.
     * 
     * If the cache request specified that children were to be cached at this level, but there are no children, the value of this property is 0. However, if no request was made to cache children at this level, an attempt to retrieve the property returns an error.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to a collection of the cached child elements.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedchildren
     */
    GetCachedChildren() {
        result := ComCall(19, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }

    /**
     * Retrieves the identifier of the process that hosts the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentprocessid
     */
    get_CurrentProcessId() {
        result := ComCall(20, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the control type of the element.
     * @remarks
     * Control types describe a known interaction model for UI Automation elements without relying on a localized control type or combination of complex logic rules.
     * This property cannot change at run time unless the control supports the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern">IUIAutomationMultipleViewPattern</a> interface. An example is the Win32 ListView control, which can change from a data grid to a list, depending on the current view.
     * @returns {UIA_CONTROLTYPE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontroltype
     */
    get_CurrentControlType() {
        result := ComCall(21, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a localized description of the control type of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlocalizedcontroltype
     */
    get_CurrentLocalizedControlType() {
        retVal := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the element.
     * @remarks
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentname
     */
    get_CurrentName() {
        retVal := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the accelerator key for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentacceleratorkey
     */
    get_CurrentAcceleratorKey() {
        retVal := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the access key character for the element.
     * @remarks
     * An access key is a character in the text of a menu, menu item, or label of a control such as a button that activates the attached menu function. For example, the letter "O" is often used to invoke the Open file common dialog box from a File menu. Microsoft UI Automation elements that have the access key property set always implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentaccesskey
     */
    get_CurrentAccessKey() {
        retVal := BSTR.Owned()
        result := ComCall(25, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element has keyboard focus.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthaskeyboardfocus
     */
    get_CurrentHasKeyboardFocus() {
        result := ComCall(26, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can accept keyboard focus.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiskeyboardfocusable
     */
    get_CurrentIsKeyboardFocusable() {
        result := ComCall(27, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is enabled.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisenabled
     */
    get_CurrentIsEnabled() {
        result := ComCall(28, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the Microsoft UI Automation identifier of the element.
     * @remarks
     * The identifier is unique among sibling elements in a container, and is the same in all instances of the application.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentautomationid
     */
    get_CurrentAutomationId() {
        retVal := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the class name of the element.
     * @remarks
     * The value of this property is implementation-defined. The property is useful in testing environments.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname
     */
    get_CurrentClassName() {
        retVal := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the help text for the element.
     * @remarks
     * This information is typically obtained from tooltips.
     * 
     * <div class="alert"><b>Caution</b>  Do not retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext">CachedHelpText</a> property from a control that is based on the SysListview32 class. Doing so could cause the system to become unstable and data to be lost. A client application can discover whether a control is based on SysListview32 by retrieving the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname">CachedClassName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname">CurrentClassName</a> property from the control.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthelptext
     */
    get_CurrentHelpText() {
        retVal := BSTR.Owned()
        result := ComCall(31, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the culture identifier for the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentculture
     */
    get_CurrentCulture() {
        result := ComCall(32, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is a control element.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontrolelement
     */
    get_CurrentIsControlElement() {
        result := ComCall(33, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is a content element.
     * @remarks
     * A content element contains data that is presented to the user. Examples of content elements are the items in a list box or a button in a dialog box. Non-content elements, also called peripheral elements, are typically used to manipulate the content in a composite control; for example, the button on a drop-down control.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontentelement
     */
    get_CurrentIsContentElement() {
        result := ComCall(34, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element contains a disguised password.
     * @remarks
     * This property enables applications such as screen-readers to determine whether the text content of a control should be read aloud.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentispassword
     */
    get_CurrentIsPassword() {
        result := ComCall(35, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the window handle of the element.
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentnativewindowhandle
     */
    get_CurrentNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(36, this, HWND.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a description of the type of UI item represented by the element.
     * @remarks
     * This property is used to obtain information about items in a list, tree view, or data grid. For example, an item in a file directory view might be a "Document File" or a "Folder".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemtype
     */
    get_CurrentItemType() {
        retVal := BSTR.Owned()
        result := ComCall(37, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is off-screen.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisoffscreen
     */
    get_CurrentIsOffscreen() {
        result := ComCall(38, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a value that indicates the orientation of the element.
     * @remarks
     * This property is supported by controls such as scroll bars and sliders that can have either a vertical or a horizontal orientation.
     * @returns {OrientationType} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentorientation
     */
    get_CurrentOrientation() {
        result := ComCall(39, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the underlying UI framework.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentframeworkid
     */
    get_CurrentFrameworkId() {
        retVal := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is required to be filled out on a form.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisrequiredforform
     */
    get_CurrentIsRequiredForForm() {
        result := ComCall(41, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the description of the status of an item in an element.
     * @remarks
     * This property enables a client to ascertain whether an element is conveying status about an item. For example, an item associated with a contact in a messaging application might be "Busy" or "Connected".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemstatus
     */
    get_CurrentItemStatus() {
        retVal := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the coordinates of the rectangle that completely encloses the element.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentboundingrectangle
     */
    get_CurrentBoundingRectangle() {
        retVal := RECT()
        result := ComCall(43, this, RECT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the element that contains the text label for this element.
     * @remarks
     * This property could be used to retrieve, for example, the static text label for a combo box.
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>labeledby</b> property.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlabeledby
     */
    get_CurrentLabeledBy() {
        result := ComCall(44, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the Accessible Rich Internet Applications (ARIA) role of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariarole
     */
    get_CurrentAriaRole() {
        retVal := BSTR.Owned()
        result := ComCall(45, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the Accessible Rich Internet Applications (ARIA) properties of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariaproperties
     */
    get_CurrentAriaProperties() {
        retVal := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element contains valid data for a form.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisdatavalidforform
     */
    get_CurrentIsDataValidForForm() {
        result := ComCall(47, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements for which this element serves as the controller.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontrollerfor
     */
    get_CurrentControllerFor() {
        result := ComCall(48, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of elements that describe this element.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>describedby</b> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentdescribedby
     */
    get_CurrentDescribedBy() {
        result := ComCall(49, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of elements that indicates the reading order after the current element.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>flowto</b> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentflowsto
     */
    get_CurrentFlowsTo() {
        result := ComCall(50, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a description of the provider for this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentproviderdescription
     */
    get_CurrentProviderDescription() {
        retVal := BSTR.Owned()
        result := ComCall(51, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached ID of the process that hosts the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedprocessid
     */
    get_CachedProcessId() {
        result := ComCall(52, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the control type of the element.
     * @remarks
     * Control types describe a known interaction model for UI Automation elements without relying on a localized control type or combination of complex logic rules. This property cannot change at run time unless the control supports the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern">IUIAutomationMultipleViewPattern</a> interface. An example is the Win32 ListView control, which can change from a data grid to a list, depending on the current view.
     * @returns {UIA_CONTROLTYPE_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontroltype
     */
    get_CachedControlType() {
        result := ComCall(53, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached localized description of the control type of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlocalizedcontroltype
     */
    get_CachedLocalizedControlType() {
        retVal := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the element.
     * @remarks
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedname
     */
    get_CachedName() {
        retVal := BSTR.Owned()
        result := ComCall(55, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached accelerator key for the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedacceleratorkey
     */
    get_CachedAcceleratorKey() {
        retVal := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached access key character for the element.
     * @remarks
     * An access key is a character in the text of a menu, menu item, or label of a control such as a button that activates the attached menu function. For example, the letter "O" is often used to invoke the Open file common dialog box from a File menu. Microsoft UI Automation elements that have the access key property set always implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedaccesskey
     */
    get_CachedAccessKey() {
        retVal := BSTR.Owned()
        result := ComCall(57, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * A cached value that indicates whether the element has keyboard focus.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhaskeyboardfocus
     */
    get_CachedHasKeyboardFocus() {
        result := ComCall(58, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can accept keyboard focus.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediskeyboardfocusable
     */
    get_CachedIsKeyboardFocusable() {
        result := ComCall(59, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is enabled.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisenabled
     */
    get_CachedIsEnabled() {
        result := ComCall(60, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached Microsoft UI Automation identifier of the element.
     * @remarks
     * The  UI Automation identifier is unique among sibling elements in a container, and is the same in all instances of the application.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedautomationid
     */
    get_CachedAutomationId() {
        retVal := BSTR.Owned()
        result := ComCall(61, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached class name of the element.
     * @remarks
     * The value of this property is implementation-defined. The property is useful in testing environments.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname
     */
    get_CachedClassName() {
        retVal := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached help text for the element.
     * @remarks
     * This information is typically obtained from ToolTips.
     * 
     * <div class="alert"><b>Caution</b>  Do not retrieve the <b>CachedHelpText</b> property from a control that is based on the SysListview32 class. Doing so could cause the system to become unstable and data to be lost. A client application can discover whether a control is based on SysListview32 by retrieving the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname">CachedClassName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname">CurrentClassName</a> property from the control.</div>
     * <div> </div>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext
     */
    get_CachedHelpText() {
        retVal := BSTR.Owned()
        result := ComCall(63, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the culture associated with the element.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedculture
     */
    get_CachedCulture() {
        result := ComCall(64, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is a control element.
     * @remarks
     * Controls are elements in the UI that display information, or that can be manipulated by the user to perform an action.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontrolelement
     */
    get_CachedIsControlElement() {
        result := ComCall(65, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * A cached value that indicates whether the element is a content element.
     * @remarks
     * A content element contains data that is presented to the user. Examples of content elements are the items in a list box or a button in a dialog box. Non-content elements, also called peripheral elements, are typically used to manipulate the content in a composite control; for example, the button on a drop-down control.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontentelement
     */
    get_CachedIsContentElement() {
        result := ComCall(66, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element contains a disguised password.
     * @remarks
     * This property enables applications such as screen-readers to determine whether the text content of a control should be read aloud.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedispassword
     */
    get_CachedIsPassword() {
        result := ComCall(67, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached window handle of the element.
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachednativewindowhandle
     */
    get_CachedNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(68, this, HWND.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached string that describes the type of item represented by the element.
     * @remarks
     * This property is used to obtain information about items in a list, tree view, or data grid. For example, an item in a file directory view might be a "Document File" or a "Folder".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemtype
     */
    get_CachedItemType() {
        retVal := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is off-screen.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisoffscreen
     */
    get_CachedIsOffscreen() {
        result := ComCall(70, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the orientation of the element.
     * @remarks
     * This property is supported by controls such as scroll bars and sliders that can have either a vertical or a horizontal orientation.
     * @returns {OrientationType} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedorientation
     */
    get_CachedOrientation() {
        result := ComCall(71, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the underlying UI framework associated with the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedframeworkid
     */
    get_CachedFrameworkId() {
        retVal := BSTR.Owned()
        result := ComCall(72, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is required to be filled out on a form.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisrequiredforform
     */
    get_CachedIsRequiredForForm() {
        result := ComCall(73, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached description of the status of an item within an element.
     * @remarks
     * This property enables a client to ascertain whether an element is conveying status about an item. For example, an item associated with a contact in a messaging application might be "Busy" or "Connected".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemstatus
     */
    get_CachedItemStatus() {
        retVal := BSTR.Owned()
        result := ComCall(74, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached coordinates of the rectangle that completely encloses the element.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedboundingrectangle
     */
    get_CachedBoundingRectangle() {
        retVal := RECT()
        result := ComCall(75, this, RECT.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that contains the text label for this element.
     * @remarks
     * This property could be used to retrieve, for example, the static text label for a combo box.
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>labeledby</b> property.
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlabeledby
     */
    get_CachedLabeledBy() {
        result := ComCall(76, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the cached Accessible Rich Internet Applications (ARIA) role of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariarole
     */
    get_CachedAriaRole() {
        retVal := BSTR.Owned()
        result := ComCall(77, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached Accessible Rich Internet Applications (ARIA) properties of the element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariaproperties
     */
    get_CachedAriaProperties() {
        retVal := BSTR.Owned()
        result := ComCall(78, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element contains valid data for the form.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisdatavalidforform
     */
    get_CachedIsDataValidForForm() {
        result := ComCall(79, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of UI Automation elements for which this element serves as the controller.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontrollerfor
     */
    get_CachedControllerFor() {
        result := ComCall(80, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that describe this element.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>describedby</b> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheddescribedby
     */
    get_CachedDescribedBy() {
        result := ComCall(81, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that indicate the reading order after the current element.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>flowto</b> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedflowsto
     */
    get_CachedFlowsTo() {
        result := ComCall(82, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached description of the provider for this element.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedproviderdescription
     */
    get_CachedProviderDescription() {
        retVal := BSTR.Owned()
        result := ComCall(83, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a point on the element that can be clicked.
     * @remarks
     * A client application can use this method to simulate clicking the left or right mouse button. For example, to simulate clicking the right mouse button to display the context menu for a control: 
     * 
     * <ul>
     * <li>Call the <b>GetClickablePoint</b> method to find a clickable point on the control.</li>
     * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendinput">SendInput</a> function to send a right-mouse-down, right-mouse-up sequence.</li>
     * </ul>
     * @param {Pointer<POINT>} clickable Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a>*</b>
     * 
     * Receives the physical screen coordinates of a point that can be used by a client to click this element.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if a clickable point was retrieved, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getclickablepoint
     */
    GetClickablePoint(clickable) {
        result := ComCall(84, this, POINT.Ptr, clickable, BOOL.Ptr, &gotClickable := 0, "HRESULT")
        return gotClickable
    }

    Query(iid) {
        if (IUIAutomationElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFocus := CallbackCreate(GetMethod(implObj, "SetFocus"), flags, 1)
        this.vtbl.GetRuntimeId := CallbackCreate(GetMethod(implObj, "GetRuntimeId"), flags, 2)
        this.vtbl.FindFirst := CallbackCreate(GetMethod(implObj, "FindFirst"), flags, 4)
        this.vtbl.FindAll := CallbackCreate(GetMethod(implObj, "FindAll"), flags, 4)
        this.vtbl.FindFirstBuildCache := CallbackCreate(GetMethod(implObj, "FindFirstBuildCache"), flags, 5)
        this.vtbl.FindAllBuildCache := CallbackCreate(GetMethod(implObj, "FindAllBuildCache"), flags, 5)
        this.vtbl.BuildUpdatedCache := CallbackCreate(GetMethod(implObj, "BuildUpdatedCache"), flags, 3)
        this.vtbl.GetCurrentPropertyValue := CallbackCreate(GetMethod(implObj, "GetCurrentPropertyValue"), flags, 3)
        this.vtbl.GetCurrentPropertyValueEx := CallbackCreate(GetMethod(implObj, "GetCurrentPropertyValueEx"), flags, 4)
        this.vtbl.GetCachedPropertyValue := CallbackCreate(GetMethod(implObj, "GetCachedPropertyValue"), flags, 3)
        this.vtbl.GetCachedPropertyValueEx := CallbackCreate(GetMethod(implObj, "GetCachedPropertyValueEx"), flags, 4)
        this.vtbl.GetCurrentPatternAs := CallbackCreate(GetMethod(implObj, "GetCurrentPatternAs"), flags, 4)
        this.vtbl.GetCachedPatternAs := CallbackCreate(GetMethod(implObj, "GetCachedPatternAs"), flags, 4)
        this.vtbl.GetCurrentPattern := CallbackCreate(GetMethod(implObj, "GetCurrentPattern"), flags, 3)
        this.vtbl.GetCachedPattern := CallbackCreate(GetMethod(implObj, "GetCachedPattern"), flags, 3)
        this.vtbl.GetCachedParent := CallbackCreate(GetMethod(implObj, "GetCachedParent"), flags, 2)
        this.vtbl.GetCachedChildren := CallbackCreate(GetMethod(implObj, "GetCachedChildren"), flags, 2)
        this.vtbl.get_CurrentProcessId := CallbackCreate(GetMethod(implObj, "get_CurrentProcessId"), flags, 2)
        this.vtbl.get_CurrentControlType := CallbackCreate(GetMethod(implObj, "get_CurrentControlType"), flags, 2)
        this.vtbl.get_CurrentLocalizedControlType := CallbackCreate(GetMethod(implObj, "get_CurrentLocalizedControlType"), flags, 2)
        this.vtbl.get_CurrentName := CallbackCreate(GetMethod(implObj, "get_CurrentName"), flags, 2)
        this.vtbl.get_CurrentAcceleratorKey := CallbackCreate(GetMethod(implObj, "get_CurrentAcceleratorKey"), flags, 2)
        this.vtbl.get_CurrentAccessKey := CallbackCreate(GetMethod(implObj, "get_CurrentAccessKey"), flags, 2)
        this.vtbl.get_CurrentHasKeyboardFocus := CallbackCreate(GetMethod(implObj, "get_CurrentHasKeyboardFocus"), flags, 2)
        this.vtbl.get_CurrentIsKeyboardFocusable := CallbackCreate(GetMethod(implObj, "get_CurrentIsKeyboardFocusable"), flags, 2)
        this.vtbl.get_CurrentIsEnabled := CallbackCreate(GetMethod(implObj, "get_CurrentIsEnabled"), flags, 2)
        this.vtbl.get_CurrentAutomationId := CallbackCreate(GetMethod(implObj, "get_CurrentAutomationId"), flags, 2)
        this.vtbl.get_CurrentClassName := CallbackCreate(GetMethod(implObj, "get_CurrentClassName"), flags, 2)
        this.vtbl.get_CurrentHelpText := CallbackCreate(GetMethod(implObj, "get_CurrentHelpText"), flags, 2)
        this.vtbl.get_CurrentCulture := CallbackCreate(GetMethod(implObj, "get_CurrentCulture"), flags, 2)
        this.vtbl.get_CurrentIsControlElement := CallbackCreate(GetMethod(implObj, "get_CurrentIsControlElement"), flags, 2)
        this.vtbl.get_CurrentIsContentElement := CallbackCreate(GetMethod(implObj, "get_CurrentIsContentElement"), flags, 2)
        this.vtbl.get_CurrentIsPassword := CallbackCreate(GetMethod(implObj, "get_CurrentIsPassword"), flags, 2)
        this.vtbl.get_CurrentNativeWindowHandle := CallbackCreate(GetMethod(implObj, "get_CurrentNativeWindowHandle"), flags, 2)
        this.vtbl.get_CurrentItemType := CallbackCreate(GetMethod(implObj, "get_CurrentItemType"), flags, 2)
        this.vtbl.get_CurrentIsOffscreen := CallbackCreate(GetMethod(implObj, "get_CurrentIsOffscreen"), flags, 2)
        this.vtbl.get_CurrentOrientation := CallbackCreate(GetMethod(implObj, "get_CurrentOrientation"), flags, 2)
        this.vtbl.get_CurrentFrameworkId := CallbackCreate(GetMethod(implObj, "get_CurrentFrameworkId"), flags, 2)
        this.vtbl.get_CurrentIsRequiredForForm := CallbackCreate(GetMethod(implObj, "get_CurrentIsRequiredForForm"), flags, 2)
        this.vtbl.get_CurrentItemStatus := CallbackCreate(GetMethod(implObj, "get_CurrentItemStatus"), flags, 2)
        this.vtbl.get_CurrentBoundingRectangle := CallbackCreate(GetMethod(implObj, "get_CurrentBoundingRectangle"), flags, 2)
        this.vtbl.get_CurrentLabeledBy := CallbackCreate(GetMethod(implObj, "get_CurrentLabeledBy"), flags, 2)
        this.vtbl.get_CurrentAriaRole := CallbackCreate(GetMethod(implObj, "get_CurrentAriaRole"), flags, 2)
        this.vtbl.get_CurrentAriaProperties := CallbackCreate(GetMethod(implObj, "get_CurrentAriaProperties"), flags, 2)
        this.vtbl.get_CurrentIsDataValidForForm := CallbackCreate(GetMethod(implObj, "get_CurrentIsDataValidForForm"), flags, 2)
        this.vtbl.get_CurrentControllerFor := CallbackCreate(GetMethod(implObj, "get_CurrentControllerFor"), flags, 2)
        this.vtbl.get_CurrentDescribedBy := CallbackCreate(GetMethod(implObj, "get_CurrentDescribedBy"), flags, 2)
        this.vtbl.get_CurrentFlowsTo := CallbackCreate(GetMethod(implObj, "get_CurrentFlowsTo"), flags, 2)
        this.vtbl.get_CurrentProviderDescription := CallbackCreate(GetMethod(implObj, "get_CurrentProviderDescription"), flags, 2)
        this.vtbl.get_CachedProcessId := CallbackCreate(GetMethod(implObj, "get_CachedProcessId"), flags, 2)
        this.vtbl.get_CachedControlType := CallbackCreate(GetMethod(implObj, "get_CachedControlType"), flags, 2)
        this.vtbl.get_CachedLocalizedControlType := CallbackCreate(GetMethod(implObj, "get_CachedLocalizedControlType"), flags, 2)
        this.vtbl.get_CachedName := CallbackCreate(GetMethod(implObj, "get_CachedName"), flags, 2)
        this.vtbl.get_CachedAcceleratorKey := CallbackCreate(GetMethod(implObj, "get_CachedAcceleratorKey"), flags, 2)
        this.vtbl.get_CachedAccessKey := CallbackCreate(GetMethod(implObj, "get_CachedAccessKey"), flags, 2)
        this.vtbl.get_CachedHasKeyboardFocus := CallbackCreate(GetMethod(implObj, "get_CachedHasKeyboardFocus"), flags, 2)
        this.vtbl.get_CachedIsKeyboardFocusable := CallbackCreate(GetMethod(implObj, "get_CachedIsKeyboardFocusable"), flags, 2)
        this.vtbl.get_CachedIsEnabled := CallbackCreate(GetMethod(implObj, "get_CachedIsEnabled"), flags, 2)
        this.vtbl.get_CachedAutomationId := CallbackCreate(GetMethod(implObj, "get_CachedAutomationId"), flags, 2)
        this.vtbl.get_CachedClassName := CallbackCreate(GetMethod(implObj, "get_CachedClassName"), flags, 2)
        this.vtbl.get_CachedHelpText := CallbackCreate(GetMethod(implObj, "get_CachedHelpText"), flags, 2)
        this.vtbl.get_CachedCulture := CallbackCreate(GetMethod(implObj, "get_CachedCulture"), flags, 2)
        this.vtbl.get_CachedIsControlElement := CallbackCreate(GetMethod(implObj, "get_CachedIsControlElement"), flags, 2)
        this.vtbl.get_CachedIsContentElement := CallbackCreate(GetMethod(implObj, "get_CachedIsContentElement"), flags, 2)
        this.vtbl.get_CachedIsPassword := CallbackCreate(GetMethod(implObj, "get_CachedIsPassword"), flags, 2)
        this.vtbl.get_CachedNativeWindowHandle := CallbackCreate(GetMethod(implObj, "get_CachedNativeWindowHandle"), flags, 2)
        this.vtbl.get_CachedItemType := CallbackCreate(GetMethod(implObj, "get_CachedItemType"), flags, 2)
        this.vtbl.get_CachedIsOffscreen := CallbackCreate(GetMethod(implObj, "get_CachedIsOffscreen"), flags, 2)
        this.vtbl.get_CachedOrientation := CallbackCreate(GetMethod(implObj, "get_CachedOrientation"), flags, 2)
        this.vtbl.get_CachedFrameworkId := CallbackCreate(GetMethod(implObj, "get_CachedFrameworkId"), flags, 2)
        this.vtbl.get_CachedIsRequiredForForm := CallbackCreate(GetMethod(implObj, "get_CachedIsRequiredForForm"), flags, 2)
        this.vtbl.get_CachedItemStatus := CallbackCreate(GetMethod(implObj, "get_CachedItemStatus"), flags, 2)
        this.vtbl.get_CachedBoundingRectangle := CallbackCreate(GetMethod(implObj, "get_CachedBoundingRectangle"), flags, 2)
        this.vtbl.get_CachedLabeledBy := CallbackCreate(GetMethod(implObj, "get_CachedLabeledBy"), flags, 2)
        this.vtbl.get_CachedAriaRole := CallbackCreate(GetMethod(implObj, "get_CachedAriaRole"), flags, 2)
        this.vtbl.get_CachedAriaProperties := CallbackCreate(GetMethod(implObj, "get_CachedAriaProperties"), flags, 2)
        this.vtbl.get_CachedIsDataValidForForm := CallbackCreate(GetMethod(implObj, "get_CachedIsDataValidForForm"), flags, 2)
        this.vtbl.get_CachedControllerFor := CallbackCreate(GetMethod(implObj, "get_CachedControllerFor"), flags, 2)
        this.vtbl.get_CachedDescribedBy := CallbackCreate(GetMethod(implObj, "get_CachedDescribedBy"), flags, 2)
        this.vtbl.get_CachedFlowsTo := CallbackCreate(GetMethod(implObj, "get_CachedFlowsTo"), flags, 2)
        this.vtbl.get_CachedProviderDescription := CallbackCreate(GetMethod(implObj, "get_CachedProviderDescription"), flags, 2)
        this.vtbl.GetClickablePoint := CallbackCreate(GetMethod(implObj, "GetClickablePoint"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFocus)
        CallbackFree(this.vtbl.GetRuntimeId)
        CallbackFree(this.vtbl.FindFirst)
        CallbackFree(this.vtbl.FindAll)
        CallbackFree(this.vtbl.FindFirstBuildCache)
        CallbackFree(this.vtbl.FindAllBuildCache)
        CallbackFree(this.vtbl.BuildUpdatedCache)
        CallbackFree(this.vtbl.GetCurrentPropertyValue)
        CallbackFree(this.vtbl.GetCurrentPropertyValueEx)
        CallbackFree(this.vtbl.GetCachedPropertyValue)
        CallbackFree(this.vtbl.GetCachedPropertyValueEx)
        CallbackFree(this.vtbl.GetCurrentPatternAs)
        CallbackFree(this.vtbl.GetCachedPatternAs)
        CallbackFree(this.vtbl.GetCurrentPattern)
        CallbackFree(this.vtbl.GetCachedPattern)
        CallbackFree(this.vtbl.GetCachedParent)
        CallbackFree(this.vtbl.GetCachedChildren)
        CallbackFree(this.vtbl.get_CurrentProcessId)
        CallbackFree(this.vtbl.get_CurrentControlType)
        CallbackFree(this.vtbl.get_CurrentLocalizedControlType)
        CallbackFree(this.vtbl.get_CurrentName)
        CallbackFree(this.vtbl.get_CurrentAcceleratorKey)
        CallbackFree(this.vtbl.get_CurrentAccessKey)
        CallbackFree(this.vtbl.get_CurrentHasKeyboardFocus)
        CallbackFree(this.vtbl.get_CurrentIsKeyboardFocusable)
        CallbackFree(this.vtbl.get_CurrentIsEnabled)
        CallbackFree(this.vtbl.get_CurrentAutomationId)
        CallbackFree(this.vtbl.get_CurrentClassName)
        CallbackFree(this.vtbl.get_CurrentHelpText)
        CallbackFree(this.vtbl.get_CurrentCulture)
        CallbackFree(this.vtbl.get_CurrentIsControlElement)
        CallbackFree(this.vtbl.get_CurrentIsContentElement)
        CallbackFree(this.vtbl.get_CurrentIsPassword)
        CallbackFree(this.vtbl.get_CurrentNativeWindowHandle)
        CallbackFree(this.vtbl.get_CurrentItemType)
        CallbackFree(this.vtbl.get_CurrentIsOffscreen)
        CallbackFree(this.vtbl.get_CurrentOrientation)
        CallbackFree(this.vtbl.get_CurrentFrameworkId)
        CallbackFree(this.vtbl.get_CurrentIsRequiredForForm)
        CallbackFree(this.vtbl.get_CurrentItemStatus)
        CallbackFree(this.vtbl.get_CurrentBoundingRectangle)
        CallbackFree(this.vtbl.get_CurrentLabeledBy)
        CallbackFree(this.vtbl.get_CurrentAriaRole)
        CallbackFree(this.vtbl.get_CurrentAriaProperties)
        CallbackFree(this.vtbl.get_CurrentIsDataValidForForm)
        CallbackFree(this.vtbl.get_CurrentControllerFor)
        CallbackFree(this.vtbl.get_CurrentDescribedBy)
        CallbackFree(this.vtbl.get_CurrentFlowsTo)
        CallbackFree(this.vtbl.get_CurrentProviderDescription)
        CallbackFree(this.vtbl.get_CachedProcessId)
        CallbackFree(this.vtbl.get_CachedControlType)
        CallbackFree(this.vtbl.get_CachedLocalizedControlType)
        CallbackFree(this.vtbl.get_CachedName)
        CallbackFree(this.vtbl.get_CachedAcceleratorKey)
        CallbackFree(this.vtbl.get_CachedAccessKey)
        CallbackFree(this.vtbl.get_CachedHasKeyboardFocus)
        CallbackFree(this.vtbl.get_CachedIsKeyboardFocusable)
        CallbackFree(this.vtbl.get_CachedIsEnabled)
        CallbackFree(this.vtbl.get_CachedAutomationId)
        CallbackFree(this.vtbl.get_CachedClassName)
        CallbackFree(this.vtbl.get_CachedHelpText)
        CallbackFree(this.vtbl.get_CachedCulture)
        CallbackFree(this.vtbl.get_CachedIsControlElement)
        CallbackFree(this.vtbl.get_CachedIsContentElement)
        CallbackFree(this.vtbl.get_CachedIsPassword)
        CallbackFree(this.vtbl.get_CachedNativeWindowHandle)
        CallbackFree(this.vtbl.get_CachedItemType)
        CallbackFree(this.vtbl.get_CachedIsOffscreen)
        CallbackFree(this.vtbl.get_CachedOrientation)
        CallbackFree(this.vtbl.get_CachedFrameworkId)
        CallbackFree(this.vtbl.get_CachedIsRequiredForForm)
        CallbackFree(this.vtbl.get_CachedItemStatus)
        CallbackFree(this.vtbl.get_CachedBoundingRectangle)
        CallbackFree(this.vtbl.get_CachedLabeledBy)
        CallbackFree(this.vtbl.get_CachedAriaRole)
        CallbackFree(this.vtbl.get_CachedAriaProperties)
        CallbackFree(this.vtbl.get_CachedIsDataValidForForm)
        CallbackFree(this.vtbl.get_CachedControllerFor)
        CallbackFree(this.vtbl.get_CachedDescribedBy)
        CallbackFree(this.vtbl.get_CachedFlowsTo)
        CallbackFree(this.vtbl.get_CachedProviderDescription)
        CallbackFree(this.vtbl.GetClickablePoint)
    }
}
