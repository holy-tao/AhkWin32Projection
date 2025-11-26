#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Exposes methods and properties for a UI Automation element, which represents a UI item.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement
     * @type {Guid}
     */
    static IID => Guid("{d22108aa-8ac5-49a5-837b-37bbb3d7591e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFocus", "GetRuntimeId", "FindFirst", "FindAll", "FindFirstBuildCache", "FindAllBuildCache", "BuildUpdatedCache", "GetCurrentPropertyValue", "GetCurrentPropertyValueEx", "GetCachedPropertyValue", "GetCachedPropertyValueEx", "GetCurrentPatternAs", "GetCachedPatternAs", "GetCurrentPattern", "GetCachedPattern", "GetCachedParent", "GetCachedChildren", "get_CurrentProcessId", "get_CurrentControlType", "get_CurrentLocalizedControlType", "get_CurrentName", "get_CurrentAcceleratorKey", "get_CurrentAccessKey", "get_CurrentHasKeyboardFocus", "get_CurrentIsKeyboardFocusable", "get_CurrentIsEnabled", "get_CurrentAutomationId", "get_CurrentClassName", "get_CurrentHelpText", "get_CurrentCulture", "get_CurrentIsControlElement", "get_CurrentIsContentElement", "get_CurrentIsPassword", "get_CurrentNativeWindowHandle", "get_CurrentItemType", "get_CurrentIsOffscreen", "get_CurrentOrientation", "get_CurrentFrameworkId", "get_CurrentIsRequiredForForm", "get_CurrentItemStatus", "get_CurrentBoundingRectangle", "get_CurrentLabeledBy", "get_CurrentAriaRole", "get_CurrentAriaProperties", "get_CurrentIsDataValidForForm", "get_CurrentControllerFor", "get_CurrentDescribedBy", "get_CurrentFlowsTo", "get_CurrentProviderDescription", "get_CachedProcessId", "get_CachedControlType", "get_CachedLocalizedControlType", "get_CachedName", "get_CachedAcceleratorKey", "get_CachedAccessKey", "get_CachedHasKeyboardFocus", "get_CachedIsKeyboardFocusable", "get_CachedIsEnabled", "get_CachedAutomationId", "get_CachedClassName", "get_CachedHelpText", "get_CachedCulture", "get_CachedIsControlElement", "get_CachedIsContentElement", "get_CachedIsPassword", "get_CachedNativeWindowHandle", "get_CachedItemType", "get_CachedIsOffscreen", "get_CachedOrientation", "get_CachedFrameworkId", "get_CachedIsRequiredForForm", "get_CachedItemStatus", "get_CachedBoundingRectangle", "get_CachedLabeledBy", "get_CachedAriaRole", "get_CachedAriaProperties", "get_CachedIsDataValidForForm", "get_CachedControllerFor", "get_CachedDescribedBy", "get_CachedFlowsTo", "get_CachedProviderDescription", "GetClickablePoint"]

    /**
     * @type {Integer} 
     */
    CurrentProcessId {
        get => this.get_CurrentProcessId()
    }

    /**
     * @type {Integer} 
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
     * @type {Integer} 
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
     * @type {Integer} 
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
     * @type {Integer} 
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
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-setfocus
     */
    SetFocus() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the unique identifier assigned to the UI element.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the runtime ID as an array of integers.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getruntimeid
     */
    GetRuntimeId() {
        result := ComCall(4, this, "ptr*", &runtimeId := 0, "HRESULT")
        return runtimeId
    }

    /**
     * Retrieves the first child or descendant element that matches the specified condition.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element. <b>NULL</b> is returned if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst
     */
    FindFirst(scope, condition) {
        result := ComCall(5, this, "int", scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Returns all UI Automation elements that satisfy the specified condition.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to an array of matching elements. Returns an empty array if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall
     */
    FindAll(scope, condition) {
        result := ComCall(6, this, "int", scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Retrieves the first child or descendant element that matches the specified condition, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the matching element, or <b>NULL</b> if no matching element is found.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirstbuildcache
     */
    FindFirstBuildCache(scope, condition, cacheRequest) {
        result := ComCall(7, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * Returns all UI Automation elements that satisfy the specified condition, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to a condition that represents the criteria to match.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to an array of matching elements. If there are no matches, <b>NULL</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-findallbuildcache
     */
    FindAllBuildCache(scope, condition, cacheRequest) {
        result := ComCall(8, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * Retrieves a new UI Automation element with an updated cache.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the control patterns and properties to include in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the new UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-buildupdatedcache
     */
    BuildUpdatedCache(cacheRequest) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", &updatedElement := 0, "HRESULT")
        return IUIAutomationElement(updatedElement)
    }

    /**
     * Retrieves the current value of a property for this UI Automation element.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue
     */
    GetCurrentPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(10, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value for this UI Automation element, optionally ignoring any default value.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {BOOL} ignoreDefaultValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether a default value should be ignored if the specified property is not supported: <b>TRUE</b> if the default value is not to be returned, or <b>FALSE</b> if it is to be returned.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the property value.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalueex
     */
    GetCurrentPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(11, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value from the cache for this UI Automation element.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the cached property.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue
     */
    GetCachedPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(12, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a property value from the cache for this UI Automation element, optionally ignoring any default value.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {BOOL} ignoreDefaultValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A value that specifies whether a default value should be ignored if the specified property is not supported: <b>TRUE</b> if the default value is not to be returned, or <b>FALSE</b> if it is to be returned.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalueex
     */
    GetCachedPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(13, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the control pattern interface of the specified pattern on this UI Automation element.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpatternas
     */
    GetCurrentPatternAs(patternId, riid) {
        result := ComCall(14, this, "int", patternId, "ptr", riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * Retrieves the control pattern interface of the specified pattern from the cache of this UI Automation element.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the IID of the interface to retrieve through <i>ppv</i>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives the interface pointer requested in <i>riid</i>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpatternas
     */
    GetCachedPatternAs(patternId, riid) {
        result := ComCall(15, this, "int", patternId, "ptr", riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * Retrieves the IUnknown interface of the specified control pattern on this UI Automation element.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern
     */
    GetCurrentPattern(patternId) {
        result := ComCall(16, this, "int", patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * Retrieves from the cache the IUnknown interface of the specified control pattern of this UI Automation element.
     * @param {Integer} patternId Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {IUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>**</b>
     * 
     * Receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpattern
     */
    GetCachedPattern(patternId) {
        result := ComCall(17, this, "int", patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * Retrieves from the cache the parent of this UI Automation element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the cached parent element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedparent
     */
    GetCachedParent() {
        result := ComCall(18, this, "ptr*", &parent := 0, "HRESULT")
        return IUIAutomationElement(parent)
    }

    /**
     * Retrieves the cached child elements of this UI Automation element.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IUIAutomationElementArray</a>**</b>
     * 
     * Receives a pointer to a collection of the cached child elements.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedchildren
     */
    GetCachedChildren() {
        result := ComCall(19, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }

    /**
     * Retrieves the identifier of the process that hosts the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentprocessid
     */
    get_CurrentProcessId() {
        result := ComCall(20, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the control type of the element.
     * @remarks
     * 
     * Control types describe a known interaction model for UI Automation elements without relying on a localized control type or combination of complex logic rules.
     * This property cannot change at run time unless the control supports the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern">IUIAutomationMultipleViewPattern</a> interface. An example is the Win32 ListView control, which can change from a data grid to a list, depending on the current view.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontroltype
     */
    get_CurrentControlType() {
        result := ComCall(21, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a localized description of the control type of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlocalizedcontroltype
     */
    get_CurrentLocalizedControlType() {
        retVal := BSTR()
        result := ComCall(22, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the element.
     * @remarks
     * 
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentname
     */
    get_CurrentName() {
        retVal := BSTR()
        result := ComCall(23, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the accelerator key for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentacceleratorkey
     */
    get_CurrentAcceleratorKey() {
        retVal := BSTR()
        result := ComCall(24, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the access key character for the element.
     * @remarks
     * 
     * An access key is a character in the text of a menu, menu item, or label of a control such as a button that activates the attached menu function. For example, the letter "O" is often used to invoke the Open file common dialog box from a File menu. Microsoft UI Automation elements that have the access key property set always implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentaccesskey
     */
    get_CurrentAccessKey() {
        retVal := BSTR()
        result := ComCall(25, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element has keyboard focus.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthaskeyboardfocus
     */
    get_CurrentHasKeyboardFocus() {
        result := ComCall(26, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element can accept keyboard focus.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiskeyboardfocusable
     */
    get_CurrentIsKeyboardFocusable() {
        result := ComCall(27, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is enabled.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisenabled
     */
    get_CurrentIsEnabled() {
        result := ComCall(28, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the Microsoft UI Automation identifier of the element.
     * @remarks
     * 
     * The identifier is unique among sibling elements in a container, and is the same in all instances of the application.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentautomationid
     */
    get_CurrentAutomationId() {
        retVal := BSTR()
        result := ComCall(29, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the class name of the element.
     * @remarks
     * 
     * The value of this property is implementation-defined. The property is useful in testing environments.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname
     */
    get_CurrentClassName() {
        retVal := BSTR()
        result := ComCall(30, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the help text for the element.
     * @remarks
     * 
     * This information is typically obtained from tooltips.
     * 
     * <div class="alert"><b>Caution</b>  Do not retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext">CachedHelpText</a> property from a control that is based on the SysListview32 class. Doing so could cause the system to become unstable and data to be lost. A client application can discover whether a control is based on SysListview32 by retrieving the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname">CachedClassName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname">CurrentClassName</a> property from the control.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthelptext
     */
    get_CurrentHelpText() {
        retVal := BSTR()
        result := ComCall(31, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the culture identifier for the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentculture
     */
    get_CurrentCulture() {
        result := ComCall(32, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is a control element.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontrolelement
     */
    get_CurrentIsControlElement() {
        result := ComCall(33, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is a content element.
     * @remarks
     * 
     * A content element contains data that is presented to the user. Examples of content elements are the items in a list box or a button in a dialog box. Non-content elements, also called peripheral elements, are typically used to manipulate the content in a composite control; for example, the button on a drop-down control.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontentelement
     */
    get_CurrentIsContentElement() {
        result := ComCall(34, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element contains a disguised password.
     * @remarks
     * 
     * This property enables applications such as screen-readers to determine whether the text content of a control should be read aloud.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentispassword
     */
    get_CurrentIsPassword() {
        result := ComCall(35, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the window handle of the element.
     * @returns {HWND} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentnativewindowhandle
     */
    get_CurrentNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(36, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a description of the type of UI item represented by the element.
     * @remarks
     * 
     * This property is used to obtain information about items in a list, tree view, or data grid. For example, an item in a file directory view might be a "Document File" or a "Folder".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemtype
     */
    get_CurrentItemType() {
        retVal := BSTR()
        result := ComCall(37, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is off-screen.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisoffscreen
     */
    get_CurrentIsOffscreen() {
        result := ComCall(38, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a value that indicates the orientation of the element.
     * @remarks
     * 
     * This property is supported by controls such as scroll bars and sliders that can have either a vertical or a horizontal orientation.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentorientation
     */
    get_CurrentOrientation() {
        result := ComCall(39, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the name of the underlying UI framework.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentframeworkid
     */
    get_CurrentFrameworkId() {
        retVal := BSTR()
        result := ComCall(40, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element is required to be filled out on a form.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisrequiredforform
     */
    get_CurrentIsRequiredForForm() {
        result := ComCall(41, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the description of the status of an item in an element.
     * @remarks
     * 
     * This property enables a client to ascertain whether an element is conveying status about an item. For example, an item associated with a contact in a messaging application might be "Busy" or "Connected".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemstatus
     */
    get_CurrentItemStatus() {
        retVal := BSTR()
        result := ComCall(42, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the coordinates of the rectangle that completely encloses the element.
     * @returns {RECT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentboundingrectangle
     */
    get_CurrentBoundingRectangle() {
        retVal := RECT()
        result := ComCall(43, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the element that contains the text label for this element.
     * @remarks
     * 
     * This property could be used to retrieve, for example, the static text label for a combo box.
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>labeledby</b> property.
     * 
     * 
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlabeledby
     */
    get_CurrentLabeledBy() {
        result := ComCall(44, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the Accessible Rich Internet Applications (ARIA) role of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariarole
     */
    get_CurrentAriaRole() {
        retVal := BSTR()
        result := ComCall(45, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the Accessible Rich Internet Applications (ARIA) properties of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariaproperties
     */
    get_CurrentAriaProperties() {
        retVal := BSTR()
        result := ComCall(46, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Indicates whether the element contains valid data for a form.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisdatavalidforform
     */
    get_CurrentIsDataValidForForm() {
        result := ComCall(47, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements for which this element serves as the controller.
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontrollerfor
     */
    get_CurrentControllerFor() {
        result := ComCall(48, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of elements that describe this element.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>describedby</b> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentdescribedby
     */
    get_CurrentDescribedBy() {
        result := ComCall(49, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves an array of elements that indicates the reading order after the current element.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>flowto</b> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentflowsto
     */
    get_CurrentFlowsTo() {
        result := ComCall(50, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a description of the provider for this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentproviderdescription
     */
    get_CurrentProviderDescription() {
        retVal := BSTR()
        result := ComCall(51, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached ID of the process that hosts the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedprocessid
     */
    get_CachedProcessId() {
        result := ComCall(52, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the control type of the element.
     * @remarks
     * 
     * Control types describe a known interaction model for UI Automation elements without relying on a localized control type or combination of complex logic rules. This property cannot change at run time unless the control supports the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationmultipleviewpattern">IUIAutomationMultipleViewPattern</a> interface. An example is the Win32 ListView control, which can change from a data grid to a list, depending on the current view.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontroltype
     */
    get_CachedControlType() {
        result := ComCall(53, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached localized description of the control type of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlocalizedcontroltype
     */
    get_CachedLocalizedControlType() {
        retVal := BSTR()
        result := ComCall(54, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the element.
     * @remarks
     * 
     * The name of an element can be used to find the element in the element tree when the automation ID property is not supported on the element.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedname
     */
    get_CachedName() {
        retVal := BSTR()
        result := ComCall(55, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached accelerator key for the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedacceleratorkey
     */
    get_CachedAcceleratorKey() {
        retVal := BSTR()
        result := ComCall(56, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached access key character for the element.
     * @remarks
     * 
     * An access key is a character in the text of a menu, menu item, or label of a control such as a button that activates the attached menu function. For example, the letter "O" is often used to invoke the Open file common dialog box from a File menu. Microsoft UI Automation elements that have the access key property set always implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedaccesskey
     */
    get_CachedAccessKey() {
        retVal := BSTR()
        result := ComCall(57, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * A cached value that indicates whether the element has keyboard focus.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhaskeyboardfocus
     */
    get_CachedHasKeyboardFocus() {
        result := ComCall(58, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element can accept keyboard focus.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediskeyboardfocusable
     */
    get_CachedIsKeyboardFocusable() {
        result := ComCall(59, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is enabled.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisenabled
     */
    get_CachedIsEnabled() {
        result := ComCall(60, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached Microsoft UI Automation identifier of the element.
     * @remarks
     * 
     * The  UI Automation identifier is unique among sibling elements in a container, and is the same in all instances of the application.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedautomationid
     */
    get_CachedAutomationId() {
        retVal := BSTR()
        result := ComCall(61, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached class name of the element.
     * @remarks
     * 
     * The value of this property is implementation-defined. The property is useful in testing environments.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname
     */
    get_CachedClassName() {
        retVal := BSTR()
        result := ComCall(62, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached help text for the element.
     * @remarks
     * 
     * This information is typically obtained from ToolTips.
     * 
     * <div class="alert"><b>Caution</b>  Do not retrieve the <b>CachedHelpText</b> property from a control that is based on the SysListview32 class. Doing so could cause the system to become unstable and data to be lost. A client application can discover whether a control is based on SysListview32 by retrieving the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname">CachedClassName</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname">CurrentClassName</a> property from the control.</div>
     * <div> </div>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext
     */
    get_CachedHelpText() {
        retVal := BSTR()
        result := ComCall(63, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the culture associated with the element.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedculture
     */
    get_CachedCulture() {
        result := ComCall(64, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is a control element.
     * @remarks
     * 
     * Controls are elements in the UI that display information, or that can be manipulated by the user to perform an action.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontrolelement
     */
    get_CachedIsControlElement() {
        result := ComCall(65, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * A cached value that indicates whether the element is a content element.
     * @remarks
     * 
     * A content element contains data that is presented to the user. Examples of content elements are the items in a list box or a button in a dialog box. Non-content elements, also called peripheral elements, are typically used to manipulate the content in a composite control; for example, the button on a drop-down control.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontentelement
     */
    get_CachedIsContentElement() {
        result := ComCall(66, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element contains a disguised password.
     * @remarks
     * 
     * This property enables applications such as screen-readers to determine whether the text content of a control should be read aloud.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedispassword
     */
    get_CachedIsPassword() {
        result := ComCall(67, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached window handle of the element.
     * @returns {HWND} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachednativewindowhandle
     */
    get_CachedNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(68, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached string that describes the type of item represented by the element.
     * @remarks
     * 
     * This property is used to obtain information about items in a list, tree view, or data grid. For example, an item in a file directory view might be a "Document File" or a "Folder".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemtype
     */
    get_CachedItemType() {
        retVal := BSTR()
        result := ComCall(69, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is off-screen.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisoffscreen
     */
    get_CachedIsOffscreen() {
        result := ComCall(70, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the orientation of the element.
     * @remarks
     * 
     * This property is supported by controls such as scroll bars and sliders that can have either a vertical or a horizontal orientation.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedorientation
     */
    get_CachedOrientation() {
        result := ComCall(71, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached name of the underlying UI framework associated with the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedframeworkid
     */
    get_CachedFrameworkId() {
        retVal := BSTR()
        result := ComCall(72, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element is required to be filled out on a form.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisrequiredforform
     */
    get_CachedIsRequiredForForm() {
        result := ComCall(73, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached description of the status of an item within an element.
     * @remarks
     * 
     * This property enables a client to ascertain whether an element is conveying status about an item. For example, an item associated with a contact in a messaging application might be "Busy" or "Connected".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemstatus
     */
    get_CachedItemStatus() {
        retVal := BSTR()
        result := ComCall(74, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached coordinates of the rectangle that completely encloses the element.
     * @returns {RECT} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedboundingrectangle
     */
    get_CachedBoundingRectangle() {
        retVal := RECT()
        result := ComCall(75, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached element that contains the text label for this element.
     * @remarks
     * 
     * This property could be used to retrieve, for example, the static text label for a combo box.
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>labeledby</b> property.
     * 
     * 
     * @returns {IUIAutomationElement} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlabeledby
     */
    get_CachedLabeledBy() {
        result := ComCall(76, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * Retrieves the cached Accessible Rich Internet Applications (ARIA) role of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariarole
     */
    get_CachedAriaRole() {
        retVal := BSTR()
        result := ComCall(77, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves the cached Accessible Rich Internet Applications (ARIA) properties of the element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariaproperties
     */
    get_CachedAriaProperties() {
        retVal := BSTR()
        result := ComCall(78, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the element contains valid data for the form.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisdatavalidforform
     */
    get_CachedIsDataValidForForm() {
        result := ComCall(79, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of UI Automation elements for which this element serves as the controller.
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontrollerfor
     */
    get_CachedControllerFor() {
        result := ComCall(80, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that describe this element.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>describedby</b> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheddescribedby
     */
    get_CachedDescribedBy() {
        result := ComCall(81, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that indicate the reading order after the current element.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA) <b>flowto</b> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedflowsto
     */
    get_CachedFlowsTo() {
        result := ComCall(82, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached description of the provider for this element.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedproviderdescription
     */
    get_CachedProviderDescription() {
        retVal := BSTR()
        result := ComCall(83, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a point on the element that can be clicked.
     * @param {Pointer<POINT>} clickable Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a>*</b>
     * 
     * Receives the physical screen coordinates of a point that can be used by a client to click this element.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if a clickable point was retrieved, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement-getclickablepoint
     */
    GetClickablePoint(clickable) {
        result := ComCall(84, this, "ptr", clickable, "int*", &gotClickable := 0, "HRESULT")
        return gotClickable
    }
}
