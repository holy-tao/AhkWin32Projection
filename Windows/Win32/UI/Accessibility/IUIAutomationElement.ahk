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
     * Sets the keyboard focus to the specified window. The window must be attached to the calling thread's message queue.
     * @returns {HRESULT} Type: **HWND**
     * 
     * If the function succeeds, the return value is the handle to the window that previously had the keyboard focus. If the *hWnd* parameter is invalid or the window is not attached to the calling thread's message queue, the return value is NULL. To get extended error information, call [GetLastError function](../errhandlingapi/nf-errhandlingapi-getlasterror.md).
     * 
     * Extended error ERROR_INVALID_PARAMETER (0x57) means that window is in disabled state.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-setfocus
     */
    SetFocus() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} runtimeId 
     * @returns {HRESULT} 
     */
    GetRuntimeId(runtimeId) {
        result := ComCall(4, this, "ptr", runtimeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     */
    FindFirst(scope, condition, found) {
        result := ComCall(5, this, "int", scope, "ptr", condition, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     */
    FindAll(scope, condition, found) {
        result := ComCall(6, this, "int", scope, "ptr", condition, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} found 
     * @returns {HRESULT} 
     */
    FindFirstBuildCache(scope, condition, cacheRequest, found) {
        result := ComCall(7, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElementArray>} found 
     * @returns {HRESULT} 
     */
    FindAllBuildCache(scope, condition, cacheRequest, found) {
        result := ComCall(8, this, "int", scope, "ptr", condition, "ptr", cacheRequest, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} updatedElement 
     * @returns {HRESULT} 
     */
    BuildUpdatedCache(cacheRequest, updatedElement) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr", updatedElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentPropertyValue(propertyId, retVal) {
        result := ComCall(10, this, "int", propertyId, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     */
    GetCurrentPropertyValueEx(propertyId, ignoreDefaultValue, retVal) {
        result := ComCall(11, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedPropertyValue(propertyId, retVal) {
        result := ComCall(12, this, "int", propertyId, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {BOOL} ignoreDefaultValue 
     * @param {Pointer<VARIANT>} retVal 
     * @returns {HRESULT} 
     */
    GetCachedPropertyValueEx(propertyId, ignoreDefaultValue, retVal) {
        result := ComCall(13, this, "int", propertyId, "int", ignoreDefaultValue, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} patternObject 
     * @returns {HRESULT} 
     */
    GetCurrentPatternAs(patternId, riid, patternObject) {
        result := ComCall(14, this, "int", patternId, "ptr", riid, "ptr", patternObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} patternObject 
     * @returns {HRESULT} 
     */
    GetCachedPatternAs(patternId, riid, patternObject) {
        result := ComCall(15, this, "int", patternId, "ptr", riid, "ptr", patternObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<IUnknown>} patternObject 
     * @returns {HRESULT} 
     */
    GetCurrentPattern(patternId, patternObject) {
        result := ComCall(16, this, "int", patternId, "ptr", patternObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} patternId 
     * @param {Pointer<IUnknown>} patternObject 
     * @returns {HRESULT} 
     */
    GetCachedPattern(patternId, patternObject) {
        result := ComCall(17, this, "int", patternId, "ptr", patternObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} parent 
     * @returns {HRESULT} 
     */
    GetCachedParent(parent) {
        result := ComCall(18, this, "ptr", parent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} children 
     * @returns {HRESULT} 
     */
    GetCachedChildren(children) {
        result := ComCall(19, this, "ptr", children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentProcessId(retVal) {
        result := ComCall(20, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentControlType(retVal) {
        result := ComCall(21, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLocalizedControlType(retVal) {
        result := ComCall(22, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentName(retVal) {
        result := ComCall(23, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAcceleratorKey(retVal) {
        result := ComCall(24, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAccessKey(retVal) {
        result := ComCall(25, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentHasKeyboardFocus(retVal) {
        result := ComCall(26, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsKeyboardFocusable(retVal) {
        result := ComCall(27, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsEnabled(retVal) {
        result := ComCall(28, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAutomationId(retVal) {
        result := ComCall(29, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentClassName(retVal) {
        result := ComCall(30, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentHelpText(retVal) {
        result := ComCall(31, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentCulture(retVal) {
        result := ComCall(32, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsControlElement(retVal) {
        result := ComCall(33, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsContentElement(retVal) {
        result := ComCall(34, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsPassword(retVal) {
        result := ComCall(35, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentNativeWindowHandle(retVal) {
        result := ComCall(36, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentItemType(retVal) {
        result := ComCall(37, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsOffscreen(retVal) {
        result := ComCall(38, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentOrientation(retVal) {
        result := ComCall(39, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentFrameworkId(retVal) {
        result := ComCall(40, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsRequiredForForm(retVal) {
        result := ComCall(41, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentItemStatus(retVal) {
        result := ComCall(42, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentBoundingRectangle(retVal) {
        result := ComCall(43, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentLabeledBy(retVal) {
        result := ComCall(44, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAriaRole(retVal) {
        result := ComCall(45, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentAriaProperties(retVal) {
        result := ComCall(46, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentIsDataValidForForm(retVal) {
        result := ComCall(47, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentControllerFor(retVal) {
        result := ComCall(48, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentDescribedBy(retVal) {
        result := ComCall(49, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentFlowsTo(retVal) {
        result := ComCall(50, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CurrentProviderDescription(retVal) {
        result := ComCall(51, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedProcessId(retVal) {
        result := ComCall(52, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedControlType(retVal) {
        result := ComCall(53, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLocalizedControlType(retVal) {
        result := ComCall(54, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedName(retVal) {
        result := ComCall(55, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAcceleratorKey(retVal) {
        result := ComCall(56, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAccessKey(retVal) {
        result := ComCall(57, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedHasKeyboardFocus(retVal) {
        result := ComCall(58, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsKeyboardFocusable(retVal) {
        result := ComCall(59, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsEnabled(retVal) {
        result := ComCall(60, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAutomationId(retVal) {
        result := ComCall(61, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedClassName(retVal) {
        result := ComCall(62, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedHelpText(retVal) {
        result := ComCall(63, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedCulture(retVal) {
        result := ComCall(64, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsControlElement(retVal) {
        result := ComCall(65, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsContentElement(retVal) {
        result := ComCall(66, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsPassword(retVal) {
        result := ComCall(67, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedNativeWindowHandle(retVal) {
        result := ComCall(68, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedItemType(retVal) {
        result := ComCall(69, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsOffscreen(retVal) {
        result := ComCall(70, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedOrientation(retVal) {
        result := ComCall(71, this, "int*", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedFrameworkId(retVal) {
        result := ComCall(72, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsRequiredForForm(retVal) {
        result := ComCall(73, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedItemStatus(retVal) {
        result := ComCall(74, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedBoundingRectangle(retVal) {
        result := ComCall(75, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedLabeledBy(retVal) {
        result := ComCall(76, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAriaRole(retVal) {
        result := ComCall(77, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedAriaProperties(retVal) {
        result := ComCall(78, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedIsDataValidForForm(retVal) {
        result := ComCall(79, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedControllerFor(retVal) {
        result := ComCall(80, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedDescribedBy(retVal) {
        result := ComCall(81, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElementArray>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedFlowsTo(retVal) {
        result := ComCall(82, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retVal 
     * @returns {HRESULT} 
     */
    get_CachedProviderDescription(retVal) {
        result := ComCall(83, this, "ptr", retVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<POINT>} clickable 
     * @param {Pointer<BOOL>} gotClickable 
     * @returns {HRESULT} 
     */
    GetClickablePoint(clickable, gotClickable) {
        result := ComCall(84, this, "ptr", clickable, "ptr", gotClickable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
