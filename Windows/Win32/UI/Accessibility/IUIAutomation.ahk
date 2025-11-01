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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CompareElements", "CompareRuntimeIds", "GetRootElement", "ElementFromHandle", "ElementFromPoint", "GetFocusedElement", "GetRootElementBuildCache", "ElementFromHandleBuildCache", "ElementFromPointBuildCache", "GetFocusedElementBuildCache", "CreateTreeWalker", "get_ControlViewWalker", "get_ContentViewWalker", "get_RawViewWalker", "get_RawViewCondition", "get_ControlViewCondition", "get_ContentViewCondition", "CreateCacheRequest", "CreateTrueCondition", "CreateFalseCondition", "CreatePropertyCondition", "CreatePropertyConditionEx", "CreateAndCondition", "CreateAndConditionFromArray", "CreateAndConditionFromNativeArray", "CreateOrCondition", "CreateOrConditionFromArray", "CreateOrConditionFromNativeArray", "CreateNotCondition", "AddAutomationEventHandler", "RemoveAutomationEventHandler", "AddPropertyChangedEventHandlerNativeArray", "AddPropertyChangedEventHandler", "RemovePropertyChangedEventHandler", "AddStructureChangedEventHandler", "RemoveStructureChangedEventHandler", "AddFocusChangedEventHandler", "RemoveFocusChangedEventHandler", "RemoveAllEventHandlers", "IntNativeArrayToSafeArray", "IntSafeArrayToNativeArray", "RectToVariant", "VariantToRect", "SafeArrayToRectNativeArray", "CreateProxyFactoryEntry", "get_ProxyFactoryMapping", "GetPropertyProgrammaticName", "GetPatternProgrammaticName", "PollForPotentialSupportedPatterns", "PollForPotentialSupportedProperties", "CheckNotSupported", "get_ReservedNotSupportedValue", "get_ReservedMixedAttributeValue", "ElementFromIAccessible", "ElementFromIAccessibleBuildCache"]

    /**
     * 
     * @param {IUIAutomationElement} el1 
     * @param {IUIAutomationElement} el2 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-compareelements
     */
    CompareElements(el1, el2, areSame) {
        result := ComCall(3, this, "ptr", el1, "ptr", el2, "ptr", areSame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} runtimeId1 
     * @param {Pointer<SAFEARRAY>} runtimeId2 
     * @param {Pointer<BOOL>} areSame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-compareruntimeids
     */
    CompareRuntimeIds(runtimeId1, runtimeId2, areSame) {
        result := ComCall(4, this, "ptr", runtimeId1, "ptr", runtimeId2, "ptr", areSame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} root 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelement
     */
    GetRootElement(root) {
        result := ComCall(5, this, "ptr*", root, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandle
     */
    ElementFromHandle(hwnd, element) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompoint
     */
    ElementFromPoint(pt, element) {
        result := ComCall(7, this, "ptr", pt, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelement
     */
    GetFocusedElement(element) {
        result := ComCall(8, this, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} root 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelementbuildcache
     */
    GetRootElementBuildCache(cacheRequest, root) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", root, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandlebuildcache
     */
    ElementFromHandleBuildCache(hwnd, cacheRequest, element) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "ptr", cacheRequest, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompointbuildcache
     */
    ElementFromPointBuildCache(pt, cacheRequest, element) {
        result := ComCall(11, this, "ptr", pt, "ptr", cacheRequest, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelementbuildcache
     */
    GetFocusedElementBuildCache(cacheRequest, element) {
        result := ComCall(12, this, "ptr", cacheRequest, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCondition} pCondition 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtreewalker
     */
    CreateTreeWalker(pCondition, walker) {
        result := ComCall(13, this, "ptr", pCondition, "ptr*", walker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewwalker
     */
    get_ControlViewWalker(walker) {
        result := ComCall(14, this, "ptr*", walker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewwalker
     */
    get_ContentViewWalker(walker) {
        result := ComCall(15, this, "ptr*", walker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTreeWalker>} walker 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewwalker
     */
    get_RawViewWalker(walker) {
        result := ComCall(16, this, "ptr*", walker, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewcondition
     */
    get_RawViewCondition(condition) {
        result := ComCall(17, this, "ptr*", condition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewcondition
     */
    get_ControlViewCondition(condition) {
        result := ComCall(18, this, "ptr*", condition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewcondition
     */
    get_ContentViewCondition(condition) {
        result := ComCall(19, this, "ptr*", condition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCacheRequest>} cacheRequest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest
     */
    CreateCacheRequest(cacheRequest) {
        result := ComCall(20, this, "ptr*", cacheRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtruecondition
     */
    CreateTrueCondition(newCondition) {
        result := ComCall(21, this, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createfalsecondition
     */
    CreateFalseCondition(newCondition) {
        result := ComCall(22, this, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertycondition
     */
    CreatePropertyCondition(propertyId, value, newCondition) {
        result := ComCall(23, this, "int", propertyId, "ptr", value, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @param {Integer} flags 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertyconditionex
     */
    CreatePropertyConditionEx(propertyId, value, flags, newCondition) {
        result := ComCall(24, this, "int", propertyId, "ptr", value, "int", flags, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition1 
     * @param {IUIAutomationCondition} condition2 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandcondition
     */
    CreateAndCondition(condition1, condition2, newCondition) {
        result := ComCall(25, this, "ptr", condition1, "ptr", condition2, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromarray
     */
    CreateAndConditionFromArray(conditions, newCondition) {
        result := ComCall(26, this, "ptr", conditions, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromnativearray
     */
    CreateAndConditionFromNativeArray(conditions, conditionCount, newCondition) {
        result := ComCall(27, this, "ptr*", conditions, "int", conditionCount, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition1 
     * @param {IUIAutomationCondition} condition2 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorcondition
     */
    CreateOrCondition(condition1, condition2, newCondition) {
        result := ComCall(28, this, "ptr", condition1, "ptr", condition2, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromarray
     */
    CreateOrConditionFromArray(conditions, newCondition) {
        result := ComCall(29, this, "ptr", conditions, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromnativearray
     */
    CreateOrConditionFromNativeArray(conditions, conditionCount, newCondition) {
        result := ComCall(30, this, "ptr*", conditions, "int", conditionCount, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition 
     * @param {Pointer<IUIAutomationCondition>} newCondition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createnotcondition
     */
    CreateNotCondition(condition, newCondition) {
        result := ComCall(31, this, "ptr", condition, "ptr*", newCondition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler
     */
    AddAutomationEventHandler(eventId, element, scope, cacheRequest, handler) {
        result := ComCall(32, this, "int", eventId, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eventId 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-removeautomationeventhandler
     */
    RemoveAutomationEventHandler(eventId, element, handler) {
        result := ComCall(33, this, "int", eventId, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationPropertyChangedEventHandler} handler 
     * @param {Pointer<Integer>} propertyArray 
     * @param {Integer} propertyCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandlernativearray
     */
    AddPropertyChangedEventHandlerNativeArray(element, scope, cacheRequest, handler, propertyArray, propertyCount) {
        result := ComCall(34, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "int*", propertyArray, "int", propertyCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationPropertyChangedEventHandler} handler 
     * @param {Pointer<SAFEARRAY>} propertyArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler
     */
    AddPropertyChangedEventHandler(element, scope, cacheRequest, handler, propertyArray) {
        result := ComCall(35, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "ptr", propertyArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationPropertyChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-removepropertychangedeventhandler
     */
    RemovePropertyChangedEventHandler(element, handler) {
        result := ComCall(36, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationStructureChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler
     */
    AddStructureChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(37, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationStructureChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-removestructurechangedeventhandler
     */
    RemoveStructureChangedEventHandler(element, handler) {
        result := ComCall(38, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {IUIAutomationFocusChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler
     */
    AddFocusChangedEventHandler(cacheRequest, handler) {
        result := ComCall(39, this, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationFocusChangedEventHandler} handler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-removefocuschangedeventhandler
     */
    RemoveFocusChangedEventHandler(handler) {
        result := ComCall(40, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-removealleventhandlers
     */
    RemoveAllEventHandlers() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} array 
     * @param {Integer} arrayCount 
     * @param {Pointer<Pointer<SAFEARRAY>>} safeArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-intnativearraytosafearray
     */
    IntNativeArrayToSafeArray(array, arrayCount, safeArray) {
        result := ComCall(42, this, "int*", array, "int", arrayCount, "ptr*", safeArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} intArray 
     * @param {Pointer<Pointer<Integer>>} array 
     * @param {Pointer<Integer>} arrayCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-intsafearraytonativearray
     */
    IntSafeArrayToNativeArray(intArray, array, arrayCount) {
        result := ComCall(43, this, "ptr", intArray, "ptr*", array, "int*", arrayCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} rc 
     * @param {Pointer<VARIANT>} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-recttovariant
     */
    RectToVariant(rc, var) {
        result := ComCall(44, this, "ptr", rc, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} var 
     * @param {Pointer<RECT>} rc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-varianttorect
     */
    VariantToRect(var, rc) {
        result := ComCall(45, this, "ptr", var, "ptr", rc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} rects 
     * @param {Pointer<Pointer<RECT>>} rectArray 
     * @param {Pointer<Integer>} rectArrayCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-safearraytorectnativearray
     */
    SafeArrayToRectNativeArray(rects, rectArray, rectArrayCount) {
        result := ComCall(46, this, "ptr", rects, "ptr*", rectArray, "int*", rectArrayCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationProxyFactory} factory 
     * @param {Pointer<IUIAutomationProxyFactoryEntry>} factoryEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createproxyfactoryentry
     */
    CreateProxyFactoryEntry(factory, factoryEntry) {
        result := ComCall(47, this, "ptr", factory, "ptr*", factoryEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationProxyFactoryMapping>} factoryMapping 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_proxyfactorymapping
     */
    get_ProxyFactoryMapping(factoryMapping) {
        result := ComCall(48, this, "ptr*", factoryMapping, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getpropertyprogrammaticname
     */
    GetPropertyProgrammaticName(property, name) {
        result := ComCall(49, this, "int", property, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pattern 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getpatternprogrammaticname
     */
    GetPatternProgrammaticName(pattern, name) {
        result := ComCall(50, this, "int", pattern, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} pElement 
     * @param {Pointer<Pointer<SAFEARRAY>>} patternIds 
     * @param {Pointer<Pointer<SAFEARRAY>>} patternNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-pollforpotentialsupportedpatterns
     */
    PollForPotentialSupportedPatterns(pElement, patternIds, patternNames) {
        result := ComCall(51, this, "ptr", pElement, "ptr*", patternIds, "ptr*", patternNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} pElement 
     * @param {Pointer<Pointer<SAFEARRAY>>} propertyIds 
     * @param {Pointer<Pointer<SAFEARRAY>>} propertyNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-pollforpotentialsupportedproperties
     */
    PollForPotentialSupportedProperties(pElement, propertyIds, propertyNames) {
        result := ComCall(52, this, "ptr", pElement, "ptr*", propertyIds, "ptr*", propertyNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @param {Pointer<BOOL>} isNotSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-checknotsupported
     */
    CheckNotSupported(value, isNotSupported) {
        result := ComCall(53, this, "ptr", value, "ptr", isNotSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} notSupportedValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservednotsupportedvalue
     */
    get_ReservedNotSupportedValue(notSupportedValue) {
        result := ComCall(54, this, "ptr*", notSupportedValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} mixedAttributeValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservedmixedattributevalue
     */
    get_ReservedMixedAttributeValue(mixedAttributeValue) {
        result := ComCall(55, this, "ptr*", mixedAttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAccessible} accessible 
     * @param {Integer} childId 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessible
     */
    ElementFromIAccessible(accessible, childId, element) {
        result := ComCall(56, this, "ptr", accessible, "int", childId, "ptr*", element, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAccessible} accessible 
     * @param {Integer} childId 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} element 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessiblebuildcache
     */
    ElementFromIAccessibleBuildCache(accessible, childId, cacheRequest, element) {
        result := ComCall(57, this, "ptr", accessible, "int", childId, "ptr", cacheRequest, "ptr*", element, "HRESULT")
        return result
    }
}
