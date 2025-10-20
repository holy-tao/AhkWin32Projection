#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * @param {Pointer<Pointer<SAFEARRAY>>} runtimeId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getruntimeid
     */
    GetRuntimeId(runtimeId) {
        result := ComCall(4, this, "ptr*", runtimeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst
     */
    FindFirst(scope, condition, found) {
        result := ComCall(5, this, "int", scope, "ptr", condition, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall
     */
    FindAll(scope, condition, found) {
        result := ComCall(6, this, "int", scope, "ptr", condition, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirstbuildcache
     */
    FindFirstBuildCache(scope, condition, cacheRequest, found) {
        result := ComCall(7, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {IUIAutomationCondition} condition 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findallbuildcache
     */
    FindAllBuildCache(scope, condition, cacheRequest, found) {
        result := ComCall(8, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr*", found, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} updatedElement 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-buildupdatedcache
     */
    BuildUpdatedCache(cacheRequest, updatedElement) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", updatedElement, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue
     */
    GetCurrentPropertyValue(propertyId, retVal) {
        result := ComCall(10, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalueex
     */
    GetCurrentPropertyValueEx(propertyId, ignoreDefaultValue, retVal) {
        result := ComCall(11, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalue
     */
    GetCachedPropertyValue(propertyId, retVal) {
        result := ComCall(12, this, "int", propertyId, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpropertyvalueex
     */
    GetCachedPropertyValueEx(propertyId, ignoreDefaultValue, retVal) {
        result := ComCall(13, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} patternObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpatternas
     */
    GetCurrentPatternAs(patternId, riid, patternObject) {
        result := ComCall(14, this, "int", patternId, "ptr", riid, "ptr*", patternObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} patternObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpatternas
     */
    GetCachedPatternAs(patternId, riid, patternObject) {
        result := ComCall(15, this, "int", patternId, "ptr", riid, "ptr*", patternObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<IUnknown>} patternObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern
     */
    GetCurrentPattern(patternId, patternObject) {
        result := ComCall(16, this, "int", patternId, "ptr*", patternObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<IUnknown>} patternObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedpattern
     */
    GetCachedPattern(patternId, patternObject) {
        result := ComCall(17, this, "int", patternId, "ptr*", patternObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} parent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedparent
     */
    GetCachedParent(parent) {
        result := ComCall(18, this, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcachedchildren
     */
    GetCachedChildren(children) {
        result := ComCall(19, this, "ptr*", children, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentprocessid
     */
    get_CurrentProcessId(retVal) {
        result := ComCall(20, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontroltype
     */
    get_CurrentControlType(retVal) {
        result := ComCall(21, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlocalizedcontroltype
     */
    get_CurrentLocalizedControlType(retVal) {
        result := ComCall(22, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentname
     */
    get_CurrentName(retVal) {
        result := ComCall(23, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentacceleratorkey
     */
    get_CurrentAcceleratorKey(retVal) {
        result := ComCall(24, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentaccesskey
     */
    get_CurrentAccessKey(retVal) {
        result := ComCall(25, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthaskeyboardfocus
     */
    get_CurrentHasKeyboardFocus(retVal) {
        result := ComCall(26, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiskeyboardfocusable
     */
    get_CurrentIsKeyboardFocusable(retVal) {
        result := ComCall(27, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisenabled
     */
    get_CurrentIsEnabled(retVal) {
        result := ComCall(28, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentautomationid
     */
    get_CurrentAutomationId(retVal) {
        result := ComCall(29, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentclassname
     */
    get_CurrentClassName(retVal) {
        result := ComCall(30, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currenthelptext
     */
    get_CurrentHelpText(retVal) {
        result := ComCall(31, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentculture
     */
    get_CurrentCulture(retVal) {
        result := ComCall(32, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontrolelement
     */
    get_CurrentIsControlElement(retVal) {
        result := ComCall(33, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentiscontentelement
     */
    get_CurrentIsContentElement(retVal) {
        result := ComCall(34, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentispassword
     */
    get_CurrentIsPassword(retVal) {
        result := ComCall(35, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentnativewindowhandle
     */
    get_CurrentNativeWindowHandle(retVal) {
        result := ComCall(36, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemtype
     */
    get_CurrentItemType(retVal) {
        result := ComCall(37, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisoffscreen
     */
    get_CurrentIsOffscreen(retVal) {
        result := ComCall(38, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentorientation
     */
    get_CurrentOrientation(retVal) {
        result := ComCall(39, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentframeworkid
     */
    get_CurrentFrameworkId(retVal) {
        result := ComCall(40, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisrequiredforform
     */
    get_CurrentIsRequiredForForm(retVal) {
        result := ComCall(41, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentitemstatus
     */
    get_CurrentItemStatus(retVal) {
        result := ComCall(42, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentboundingrectangle
     */
    get_CurrentBoundingRectangle(retVal) {
        result := ComCall(43, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentlabeledby
     */
    get_CurrentLabeledBy(retVal) {
        result := ComCall(44, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariarole
     */
    get_CurrentAriaRole(retVal) {
        result := ComCall(45, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentariaproperties
     */
    get_CurrentAriaProperties(retVal) {
        result := ComCall(46, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentisdatavalidforform
     */
    get_CurrentIsDataValidForForm(retVal) {
        result := ComCall(47, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentcontrollerfor
     */
    get_CurrentControllerFor(retVal) {
        result := ComCall(48, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentdescribedby
     */
    get_CurrentDescribedBy(retVal) {
        result := ComCall(49, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentflowsto
     */
    get_CurrentFlowsTo(retVal) {
        result := ComCall(50, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_currentproviderdescription
     */
    get_CurrentProviderDescription(retVal) {
        result := ComCall(51, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedprocessid
     */
    get_CachedProcessId(retVal) {
        result := ComCall(52, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontroltype
     */
    get_CachedControlType(retVal) {
        result := ComCall(53, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlocalizedcontroltype
     */
    get_CachedLocalizedControlType(retVal) {
        result := ComCall(54, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedname
     */
    get_CachedName(retVal) {
        result := ComCall(55, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedacceleratorkey
     */
    get_CachedAcceleratorKey(retVal) {
        result := ComCall(56, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedaccesskey
     */
    get_CachedAccessKey(retVal) {
        result := ComCall(57, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhaskeyboardfocus
     */
    get_CachedHasKeyboardFocus(retVal) {
        result := ComCall(58, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediskeyboardfocusable
     */
    get_CachedIsKeyboardFocusable(retVal) {
        result := ComCall(59, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisenabled
     */
    get_CachedIsEnabled(retVal) {
        result := ComCall(60, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedautomationid
     */
    get_CachedAutomationId(retVal) {
        result := ComCall(61, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedclassname
     */
    get_CachedClassName(retVal) {
        result := ComCall(62, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedhelptext
     */
    get_CachedHelpText(retVal) {
        result := ComCall(63, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedculture
     */
    get_CachedCulture(retVal) {
        result := ComCall(64, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontrolelement
     */
    get_CachedIsControlElement(retVal) {
        result := ComCall(65, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachediscontentelement
     */
    get_CachedIsContentElement(retVal) {
        result := ComCall(66, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedispassword
     */
    get_CachedIsPassword(retVal) {
        result := ComCall(67, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachednativewindowhandle
     */
    get_CachedNativeWindowHandle(retVal) {
        result := ComCall(68, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemtype
     */
    get_CachedItemType(retVal) {
        result := ComCall(69, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisoffscreen
     */
    get_CachedIsOffscreen(retVal) {
        result := ComCall(70, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedorientation
     */
    get_CachedOrientation(retVal) {
        result := ComCall(71, this, "int*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedframeworkid
     */
    get_CachedFrameworkId(retVal) {
        result := ComCall(72, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisrequiredforform
     */
    get_CachedIsRequiredForForm(retVal) {
        result := ComCall(73, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheditemstatus
     */
    get_CachedItemStatus(retVal) {
        result := ComCall(74, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedboundingrectangle
     */
    get_CachedBoundingRectangle(retVal) {
        result := ComCall(75, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedlabeledby
     */
    get_CachedLabeledBy(retVal) {
        result := ComCall(76, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariarole
     */
    get_CachedAriaRole(retVal) {
        result := ComCall(77, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedariaproperties
     */
    get_CachedAriaProperties(retVal) {
        result := ComCall(78, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedisdatavalidforform
     */
    get_CachedIsDataValidForForm(retVal) {
        result := ComCall(79, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedcontrollerfor
     */
    get_CachedControllerFor(retVal) {
        result := ComCall(80, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cacheddescribedby
     */
    get_CachedDescribedBy(retVal) {
        result := ComCall(81, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedflowsto
     */
    get_CachedFlowsTo(retVal) {
        result := ComCall(82, this, "ptr*", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-get_cachedproviderdescription
     */
    get_CachedProviderDescription(retVal) {
        result := ComCall(83, this, "ptr", retVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} clickable 
     * @param {Pointer<BOOL>} gotClickable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getclickablepoint
     */
    GetClickablePoint(clickable, gotClickable) {
        result := ComCall(84, this, "ptr", clickable, "ptr", gotClickable, "HRESULT")
        return result
    }
}
