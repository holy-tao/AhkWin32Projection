#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enable Microsoft UI Automation client applications to discover, access, and filter UI Automation elements.
 * @remarks
 * 
  * Every UI Automation client application must obtain this interface to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff384838(v=vs.85)">CUIAutomation</a> object in order to gain access to the functionality of UI Automation.
  * 	        
  * 
  * The following example function creates a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff384838(v=vs.85)">CUIAutomation</a> object and obtains the <b>IUIAutomation</b> interface.
  * 
  * 
  * 
  * ```
  * IUIAutomation *g_pAutomation;
  * 
  * BOOL InitializeUIAutomation()
  * {
  *     CoInitialize(NULL);
  *     HRESULT hr = CoCreateInstance(__uuidof(CUIAutomation), NULL, CLSCTX_INPROC_SERVER, 
  *         __uuidof(IUIAutomation), (void**)&g_pAutomation);
  *     return (SUCCEEDED(hr));
  * }
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomation
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomation extends IUnknown{
    /**
     * The interface identifier for IUIAutomation
     * @type {Guid}
     */
    static IID => Guid("{30cbe57d-d9d0-452a-ab13-7ac5ac4825ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} el1 
     * @param {Pointer<IUIAutomationElement>} el2 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     */
    CompareElements(el1, el2, areSame) {
        result := ComCall(3, this, "ptr", el1, "ptr", el2, "ptr", areSame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} runtimeId1 
     * @param {Pointer<SAFEARRAY>} runtimeId2 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     */
    CompareRuntimeIds(runtimeId1, runtimeId2, areSame) {
        result := ComCall(4, this, "ptr", runtimeId1, "ptr", runtimeId2, "ptr", areSame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} root 
     * @returns {HRESULT} 
     */
    GetRootElement(root) {
        result := ComCall(5, this, "ptr", root, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromHandle(hwnd, element) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromPoint(pt, element) {
        result := ComCall(7, this, "ptr", pt, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    GetFocusedElement(element) {
        result := ComCall(8, this, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} root 
     * @returns {HRESULT} 
     */
    GetRootElementBuildCache(cacheRequest, root) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr", root, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromHandleBuildCache(hwnd, cacheRequest, element) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "ptr", cacheRequest, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromPointBuildCache(pt, cacheRequest, element) {
        result := ComCall(11, this, "ptr", pt, "ptr", cacheRequest, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    GetFocusedElementBuildCache(cacheRequest, element) {
        result := ComCall(12, this, "ptr", cacheRequest, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} pCondition 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     */
    CreateTreeWalker(pCondition, walker) {
        result := ComCall(13, this, "ptr", pCondition, "ptr", walker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     */
    get_ControlViewWalker(walker) {
        result := ComCall(14, this, "ptr", walker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     */
    get_ContentViewWalker(walker) {
        result := ComCall(15, this, "ptr", walker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     */
    get_RawViewWalker(walker) {
        result := ComCall(16, this, "ptr", walker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     */
    get_RawViewCondition(condition) {
        result := ComCall(17, this, "ptr", condition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     */
    get_ControlViewCondition(condition) {
        result := ComCall(18, this, "ptr", condition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     */
    get_ContentViewCondition(condition) {
        result := ComCall(19, this, "ptr", condition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @returns {HRESULT} 
     */
    CreateCacheRequest(cacheRequest) {
        result := ComCall(20, this, "ptr", cacheRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateTrueCondition(newCondition) {
        result := ComCall(21, this, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateFalseCondition(newCondition) {
        result := ComCall(22, this, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreatePropertyCondition(propertyId, value, newCondition) {
        result := ComCall(23, this, "int", propertyId, "ptr", value, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @param {Integer} flags 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreatePropertyConditionEx(propertyId, value, flags, newCondition) {
        result := ComCall(24, this, "int", propertyId, "ptr", value, "int", flags, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition1 
     * @param {Pointer<IUIAutomationCondition>} condition2 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateAndCondition(condition1, condition2, newCondition) {
        result := ComCall(25, this, "ptr", condition1, "ptr", condition2, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateAndConditionFromArray(conditions, newCondition) {
        result := ComCall(26, this, "ptr", conditions, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateAndConditionFromNativeArray(conditions, conditionCount, newCondition) {
        result := ComCall(27, this, "ptr", conditions, "int", conditionCount, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition1 
     * @param {Pointer<IUIAutomationCondition>} condition2 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateOrCondition(condition1, condition2, newCondition) {
        result := ComCall(28, this, "ptr", condition1, "ptr", condition2, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateOrConditionFromArray(conditions, newCondition) {
        result := ComCall(29, this, "ptr", conditions, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateOrConditionFromNativeArray(conditions, conditionCount, newCondition) {
        result := ComCall(30, this, "ptr", conditions, "int", conditionCount, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     */
    CreateNotCondition(condition, newCondition) {
        result := ComCall(31, this, "ptr", condition, "ptr", newCondition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddAutomationEventHandler(eventId, element, scope, cacheRequest, handler) {
        result := ComCall(32, this, "int", eventId, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveAutomationEventHandler(eventId, element, handler) {
        result := ComCall(33, this, "int", eventId, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationPropertyChangedEventHandler>} handler 
     * @param {Pointer<Int32>} propertyArray 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     */
    AddPropertyChangedEventHandlerNativeArray(element, scope, cacheRequest, handler, propertyArray, propertyCount) {
        result := ComCall(34, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "int*", propertyArray, "int", propertyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationPropertyChangedEventHandler>} handler 
     * @param {Pointer<SAFEARRAY>} propertyArray 
     * @returns {HRESULT} 
     */
    AddPropertyChangedEventHandler(element, scope, cacheRequest, handler, propertyArray) {
        result := ComCall(35, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "ptr", propertyArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationPropertyChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemovePropertyChangedEventHandler(element, handler) {
        result := ComCall(36, this, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Integer} scope 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationStructureChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddStructureChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(37, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @param {Pointer<IUIAutomationStructureChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveStructureChangedEventHandler(element, handler) {
        result := ComCall(38, this, "ptr", element, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationFocusChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    AddFocusChangedEventHandler(cacheRequest, handler) {
        result := ComCall(39, this, "ptr", cacheRequest, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationFocusChangedEventHandler>} handler 
     * @returns {HRESULT} 
     */
    RemoveFocusChangedEventHandler(handler) {
        result := ComCall(40, this, "ptr", handler, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveAllEventHandlers() {
        result := ComCall(41, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} array 
     * @param {Integer} arrayCount 
     * @param {Pointer<SAFEARRAY>} safeArray 
     * @returns {HRESULT} 
     */
    IntNativeArrayToSafeArray(array, arrayCount, safeArray) {
        result := ComCall(42, this, "int*", array, "int", arrayCount, "ptr", safeArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} intArray 
     * @param {Pointer<Int32>} array 
     * @param {Pointer<Int32>} arrayCount 
     * @returns {HRESULT} 
     */
    IntSafeArrayToNativeArray(intArray, array, arrayCount) {
        result := ComCall(43, this, "ptr", intArray, "int*", array, "int*", arrayCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {RECT} rc 
     * @param {Pointer<VARIANT>} var 
     * @returns {HRESULT} 
     */
    RectToVariant(rc, var) {
        result := ComCall(44, this, "ptr", rc, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @param {Pointer<RECT>} rc 
     * @returns {HRESULT} 
     */
    VariantToRect(var, rc) {
        result := ComCall(45, this, "ptr", var, "ptr", rc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} rects 
     * @param {Pointer<RECT>} rectArray 
     * @param {Pointer<Int32>} rectArrayCount 
     * @returns {HRESULT} 
     */
    SafeArrayToRectNativeArray(rects, rectArray, rectArrayCount) {
        result := ComCall(46, this, "ptr", rects, "ptr", rectArray, "int*", rectArrayCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationProxyFactory>} factory 
     * @param {Pointer<IUIAutomationProxyFactoryEntry>} factoryEntry 
     * @returns {HRESULT} 
     */
    CreateProxyFactoryEntry(factory, factoryEntry) {
        result := ComCall(47, this, "ptr", factory, "ptr", factoryEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationProxyFactoryMapping>} factoryMapping 
     * @returns {HRESULT} 
     */
    get_ProxyFactoryMapping(factoryMapping) {
        result := ComCall(48, this, "ptr", factoryMapping, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetPropertyProgrammaticName(property, name) {
        result := ComCall(49, this, "int", property, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pattern 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    GetPatternProgrammaticName(pattern, name) {
        result := ComCall(50, this, "int", pattern, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} pElement 
     * @param {Pointer<SAFEARRAY>} patternIds 
     * @param {Pointer<SAFEARRAY>} patternNames 
     * @returns {HRESULT} 
     */
    PollForPotentialSupportedPatterns(pElement, patternIds, patternNames) {
        result := ComCall(51, this, "ptr", pElement, "ptr", patternIds, "ptr", patternNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} pElement 
     * @param {Pointer<SAFEARRAY>} propertyIds 
     * @param {Pointer<SAFEARRAY>} propertyNames 
     * @returns {HRESULT} 
     */
    PollForPotentialSupportedProperties(pElement, propertyIds, propertyNames) {
        result := ComCall(52, this, "ptr", pElement, "ptr", propertyIds, "ptr", propertyNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @param {Pointer<BOOL>} isNotSupported 
     * @returns {HRESULT} 
     */
    CheckNotSupported(value, isNotSupported) {
        result := ComCall(53, this, "ptr", value, "ptr", isNotSupported, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} notSupportedValue 
     * @returns {HRESULT} 
     */
    get_ReservedNotSupportedValue(notSupportedValue) {
        result := ComCall(54, this, "ptr", notSupportedValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} mixedAttributeValue 
     * @returns {HRESULT} 
     */
    get_ReservedMixedAttributeValue(mixedAttributeValue) {
        result := ComCall(55, this, "ptr", mixedAttributeValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} accessible 
     * @param {Integer} childId 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromIAccessible(accessible, childId, element) {
        result := ComCall(56, this, "ptr", accessible, "int", childId, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAccessible>} accessible 
     * @param {Integer} childId 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     */
    ElementFromIAccessibleBuildCache(accessible, childId, cacheRequest, element) {
        result := ComCall(57, this, "ptr", accessible, "int", childId, "ptr", cacheRequest, "ptr", element, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
