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
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getruntimeid
     */
    GetRuntimeId() {
        result := ComCall(4, this, "ptr*", &runtimeId := 0, "HRESULT")
        return runtimeId
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst
     */
    FindFirst(scope, condition) {
        result := ComCall(5, this, "int", scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall
     */
    FindAll(scope, condition) {
        result := ComCall(6, this, "int", scope, "ptr", condition, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirstbuildcache
     */
    FindFirstBuildCache(scope, condition, cacheRequest) {
        result := ComCall(7, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElement(found)
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findallbuildcache
     */
    FindAllBuildCache(scope, condition, cacheRequest) {
        result := ComCall(8, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", &found := 0, "HRESULT")
        return IUIAutomationElementArray(found)
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-buildupdatedcache
     */
    BuildUpdatedCache(cacheRequest) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", &updatedElement := 0, "HRESULT")
        return IUIAutomationElement(updatedElement)
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue
     */
    GetCurrentPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(10, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalueex
     */
    GetCurrentPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(11, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue
     */
    GetCachedPropertyValue(propertyId) {
        retVal := VARIANT()
        result := ComCall(12, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalueex
     */
    GetCachedPropertyValueEx(propertyId, ignoreDefaultValue) {
        retVal := VARIANT()
        result := ComCall(13, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpatternas
     */
    GetCurrentPatternAs(patternId, riid) {
        result := ComCall(14, this, "int", patternId, "ptr", riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpatternas
     */
    GetCachedPatternAs(patternId, riid) {
        result := ComCall(15, this, "int", patternId, "ptr", riid, "ptr*", &patternObject := 0, "HRESULT")
        return patternObject
    }

    /**
     * 
     * @param {Integer} patternId 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern
     */
    GetCurrentPattern(patternId) {
        result := ComCall(16, this, "int", patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * 
     * @param {Integer} patternId 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpattern
     */
    GetCachedPattern(patternId) {
        result := ComCall(17, this, "int", patternId, "ptr*", &patternObject := 0, "HRESULT")
        return IUnknown(patternObject)
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedparent
     */
    GetCachedParent() {
        result := ComCall(18, this, "ptr*", &parent := 0, "HRESULT")
        return IUIAutomationElement(parent)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedchildren
     */
    GetCachedChildren() {
        result := ComCall(19, this, "ptr*", &children := 0, "HRESULT")
        return IUIAutomationElementArray(children)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentprocessid
     */
    get_CurrentProcessId() {
        result := ComCall(20, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontroltype
     */
    get_CurrentControlType() {
        result := ComCall(21, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlocalizedcontroltype
     */
    get_CurrentLocalizedControlType() {
        retVal := BSTR()
        result := ComCall(22, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentname
     */
    get_CurrentName() {
        retVal := BSTR()
        result := ComCall(23, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentacceleratorkey
     */
    get_CurrentAcceleratorKey() {
        retVal := BSTR()
        result := ComCall(24, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentaccesskey
     */
    get_CurrentAccessKey() {
        retVal := BSTR()
        result := ComCall(25, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthaskeyboardfocus
     */
    get_CurrentHasKeyboardFocus() {
        result := ComCall(26, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiskeyboardfocusable
     */
    get_CurrentIsKeyboardFocusable() {
        result := ComCall(27, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisenabled
     */
    get_CurrentIsEnabled() {
        result := ComCall(28, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentautomationid
     */
    get_CurrentAutomationId() {
        retVal := BSTR()
        result := ComCall(29, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname
     */
    get_CurrentClassName() {
        retVal := BSTR()
        result := ComCall(30, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthelptext
     */
    get_CurrentHelpText() {
        retVal := BSTR()
        result := ComCall(31, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentculture
     */
    get_CurrentCulture() {
        result := ComCall(32, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontrolelement
     */
    get_CurrentIsControlElement() {
        result := ComCall(33, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontentelement
     */
    get_CurrentIsContentElement() {
        result := ComCall(34, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentispassword
     */
    get_CurrentIsPassword() {
        result := ComCall(35, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentnativewindowhandle
     */
    get_CurrentNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(36, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemtype
     */
    get_CurrentItemType() {
        retVal := BSTR()
        result := ComCall(37, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisoffscreen
     */
    get_CurrentIsOffscreen() {
        result := ComCall(38, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentorientation
     */
    get_CurrentOrientation() {
        result := ComCall(39, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentframeworkid
     */
    get_CurrentFrameworkId() {
        retVal := BSTR()
        result := ComCall(40, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisrequiredforform
     */
    get_CurrentIsRequiredForForm() {
        result := ComCall(41, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemstatus
     */
    get_CurrentItemStatus() {
        retVal := BSTR()
        result := ComCall(42, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentboundingrectangle
     */
    get_CurrentBoundingRectangle() {
        retVal := RECT()
        result := ComCall(43, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlabeledby
     */
    get_CurrentLabeledBy() {
        result := ComCall(44, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariarole
     */
    get_CurrentAriaRole() {
        retVal := BSTR()
        result := ComCall(45, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariaproperties
     */
    get_CurrentAriaProperties() {
        retVal := BSTR()
        result := ComCall(46, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisdatavalidforform
     */
    get_CurrentIsDataValidForForm() {
        result := ComCall(47, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontrollerfor
     */
    get_CurrentControllerFor() {
        result := ComCall(48, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentdescribedby
     */
    get_CurrentDescribedBy() {
        result := ComCall(49, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentflowsto
     */
    get_CurrentFlowsTo() {
        result := ComCall(50, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentproviderdescription
     */
    get_CurrentProviderDescription() {
        retVal := BSTR()
        result := ComCall(51, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedprocessid
     */
    get_CachedProcessId() {
        result := ComCall(52, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontroltype
     */
    get_CachedControlType() {
        result := ComCall(53, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlocalizedcontroltype
     */
    get_CachedLocalizedControlType() {
        retVal := BSTR()
        result := ComCall(54, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedname
     */
    get_CachedName() {
        retVal := BSTR()
        result := ComCall(55, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedacceleratorkey
     */
    get_CachedAcceleratorKey() {
        retVal := BSTR()
        result := ComCall(56, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedaccesskey
     */
    get_CachedAccessKey() {
        retVal := BSTR()
        result := ComCall(57, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhaskeyboardfocus
     */
    get_CachedHasKeyboardFocus() {
        result := ComCall(58, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediskeyboardfocusable
     */
    get_CachedIsKeyboardFocusable() {
        result := ComCall(59, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisenabled
     */
    get_CachedIsEnabled() {
        result := ComCall(60, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedautomationid
     */
    get_CachedAutomationId() {
        retVal := BSTR()
        result := ComCall(61, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname
     */
    get_CachedClassName() {
        retVal := BSTR()
        result := ComCall(62, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext
     */
    get_CachedHelpText() {
        retVal := BSTR()
        result := ComCall(63, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedculture
     */
    get_CachedCulture() {
        result := ComCall(64, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontrolelement
     */
    get_CachedIsControlElement() {
        result := ComCall(65, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontentelement
     */
    get_CachedIsContentElement() {
        result := ComCall(66, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedispassword
     */
    get_CachedIsPassword() {
        result := ComCall(67, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachednativewindowhandle
     */
    get_CachedNativeWindowHandle() {
        retVal := HWND()
        result := ComCall(68, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemtype
     */
    get_CachedItemType() {
        retVal := BSTR()
        result := ComCall(69, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisoffscreen
     */
    get_CachedIsOffscreen() {
        result := ComCall(70, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedorientation
     */
    get_CachedOrientation() {
        result := ComCall(71, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedframeworkid
     */
    get_CachedFrameworkId() {
        retVal := BSTR()
        result := ComCall(72, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisrequiredforform
     */
    get_CachedIsRequiredForForm() {
        result := ComCall(73, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemstatus
     */
    get_CachedItemStatus() {
        retVal := BSTR()
        result := ComCall(74, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedboundingrectangle
     */
    get_CachedBoundingRectangle() {
        retVal := RECT()
        result := ComCall(75, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlabeledby
     */
    get_CachedLabeledBy() {
        result := ComCall(76, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElement(retVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariarole
     */
    get_CachedAriaRole() {
        retVal := BSTR()
        result := ComCall(77, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariaproperties
     */
    get_CachedAriaProperties() {
        retVal := BSTR()
        result := ComCall(78, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisdatavalidforform
     */
    get_CachedIsDataValidForForm() {
        result := ComCall(79, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontrollerfor
     */
    get_CachedControllerFor() {
        result := ComCall(80, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheddescribedby
     */
    get_CachedDescribedBy() {
        result := ComCall(81, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedflowsto
     */
    get_CachedFlowsTo() {
        result := ComCall(82, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedproviderdescription
     */
    get_CachedProviderDescription() {
        retVal := BSTR()
        result := ComCall(83, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * 
     * @param {Pointer<POINT>} clickable 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getclickablepoint
     */
    GetClickablePoint(clickable) {
        result := ComCall(84, this, "ptr", clickable, "int*", &gotClickable := 0, "HRESULT")
        return gotClickable
    }
}
