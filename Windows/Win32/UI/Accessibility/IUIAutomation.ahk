#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include .\IUIAutomationTreeWalker.ahk
#Include .\IUIAutomationCondition.ahk
#Include .\IUIAutomationCacheRequest.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IUIAutomationProxyFactoryEntry.ahk
#Include .\IUIAutomationProxyFactoryMapping.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-compareelements
     */
    CompareElements(el1, el2) {
        result := ComCall(3, this, "ptr", el1, "ptr", el2, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} runtimeId1 
     * @param {Pointer<SAFEARRAY>} runtimeId2 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-compareruntimeids
     */
    CompareRuntimeIds(runtimeId1, runtimeId2) {
        result := ComCall(4, this, "ptr", runtimeId1, "ptr", runtimeId2, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelement
     */
    GetRootElement() {
        result := ComCall(5, this, "ptr*", &root := 0, "HRESULT")
        return IUIAutomationElement(root)
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandle
     */
    ElementFromHandle(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {POINT} pt 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompoint
     */
    ElementFromPoint(pt) {
        result := ComCall(7, this, "ptr", pt, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelement
     */
    GetFocusedElement() {
        result := ComCall(8, this, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelementbuildcache
     */
    GetRootElementBuildCache(cacheRequest) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", &root := 0, "HRESULT")
        return IUIAutomationElement(root)
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandlebuildcache
     */
    ElementFromHandleBuildCache(hwnd, cacheRequest) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompointbuildcache
     */
    ElementFromPointBuildCache(pt, cacheRequest) {
        result := ComCall(11, this, "ptr", pt, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelementbuildcache
     */
    GetFocusedElementBuildCache(cacheRequest) {
        result := ComCall(12, this, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {IUIAutomationCondition} pCondition 
     * @returns {IUIAutomationTreeWalker} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtreewalker
     */
    CreateTreeWalker(pCondition) {
        result := ComCall(13, this, "ptr", pCondition, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * 
     * @returns {IUIAutomationTreeWalker} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewwalker
     */
    get_ControlViewWalker() {
        result := ComCall(14, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * 
     * @returns {IUIAutomationTreeWalker} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewwalker
     */
    get_ContentViewWalker() {
        result := ComCall(15, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * 
     * @returns {IUIAutomationTreeWalker} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewwalker
     */
    get_RawViewWalker() {
        result := ComCall(16, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewcondition
     */
    get_RawViewCondition() {
        result := ComCall(17, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewcondition
     */
    get_ControlViewCondition() {
        result := ComCall(18, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewcondition
     */
    get_ContentViewCondition() {
        result := ComCall(19, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * 
     * @returns {IUIAutomationCacheRequest} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest
     */
    CreateCacheRequest() {
        result := ComCall(20, this, "ptr*", &cacheRequest := 0, "HRESULT")
        return IUIAutomationCacheRequest(cacheRequest)
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtruecondition
     */
    CreateTrueCondition() {
        result := ComCall(21, this, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createfalsecondition
     */
    CreateFalseCondition() {
        result := ComCall(22, this, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertycondition
     */
    CreatePropertyCondition(propertyId, value) {
        result := ComCall(23, this, "int", propertyId, "ptr", value, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @param {Integer} flags 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertyconditionex
     */
    CreatePropertyConditionEx(propertyId, value, flags) {
        result := ComCall(24, this, "int", propertyId, "ptr", value, "int", flags, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition1 
     * @param {IUIAutomationCondition} condition2 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandcondition
     */
    CreateAndCondition(condition1, condition2) {
        result := ComCall(25, this, "ptr", condition1, "ptr", condition2, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromarray
     */
    CreateAndConditionFromArray(conditions) {
        result := ComCall(26, this, "ptr", conditions, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromnativearray
     */
    CreateAndConditionFromNativeArray(conditions, conditionCount) {
        result := ComCall(27, this, "ptr*", conditions, "int", conditionCount, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition1 
     * @param {IUIAutomationCondition} condition2 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorcondition
     */
    CreateOrCondition(condition1, condition2) {
        result := ComCall(28, this, "ptr", condition1, "ptr", condition2, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} conditions 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromarray
     */
    CreateOrConditionFromArray(conditions) {
        result := ComCall(29, this, "ptr", conditions, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} conditions 
     * @param {Integer} conditionCount 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromnativearray
     */
    CreateOrConditionFromNativeArray(conditions, conditionCount) {
        result := ComCall(30, this, "ptr*", conditions, "int", conditionCount, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * 
     * @param {IUIAutomationCondition} condition 
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createnotcondition
     */
    CreateNotCondition(condition) {
        result := ComCall(31, this, "ptr", condition, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
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
        propertyArrayMarshal := propertyArray is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, propertyArrayMarshal, propertyArray, "int", propertyCount, "HRESULT")
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
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-intnativearraytosafearray
     */
    IntNativeArrayToSafeArray(array, arrayCount) {
        arrayMarshal := array is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, arrayMarshal, array, "int", arrayCount, "ptr*", &safeArray := 0, "HRESULT")
        return safeArray
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} intArray 
     * @param {Pointer<Pointer<Integer>>} array 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-intsafearraytonativearray
     */
    IntSafeArrayToNativeArray(intArray, array) {
        arrayMarshal := array is VarRef ? "ptr*" : "ptr"

        result := ComCall(43, this, "ptr", intArray, arrayMarshal, array, "int*", &arrayCount := 0, "HRESULT")
        return arrayCount
    }

    /**
     * 
     * @param {RECT} rc 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-recttovariant
     */
    RectToVariant(rc) {
        var := VARIANT()
        result := ComCall(44, this, "ptr", rc, "ptr", var, "HRESULT")
        return var
    }

    /**
     * 
     * @param {VARIANT} var 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-varianttorect
     */
    VariantToRect(var) {
        rc := RECT()
        result := ComCall(45, this, "ptr", var, "ptr", rc, "HRESULT")
        return rc
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} rects 
     * @param {Pointer<Pointer<RECT>>} rectArray 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-safearraytorectnativearray
     */
    SafeArrayToRectNativeArray(rects, rectArray) {
        rectArrayMarshal := rectArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(46, this, "ptr", rects, rectArrayMarshal, rectArray, "int*", &rectArrayCount := 0, "HRESULT")
        return rectArrayCount
    }

    /**
     * 
     * @param {IUIAutomationProxyFactory} factory 
     * @returns {IUIAutomationProxyFactoryEntry} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createproxyfactoryentry
     */
    CreateProxyFactoryEntry(factory) {
        result := ComCall(47, this, "ptr", factory, "ptr*", &factoryEntry := 0, "HRESULT")
        return IUIAutomationProxyFactoryEntry(factoryEntry)
    }

    /**
     * 
     * @returns {IUIAutomationProxyFactoryMapping} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_proxyfactorymapping
     */
    get_ProxyFactoryMapping() {
        result := ComCall(48, this, "ptr*", &factoryMapping := 0, "HRESULT")
        return IUIAutomationProxyFactoryMapping(factoryMapping)
    }

    /**
     * 
     * @param {Integer} property 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getpropertyprogrammaticname
     */
    GetPropertyProgrammaticName(property) {
        name := BSTR()
        result := ComCall(49, this, "int", property, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {Integer} pattern 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-getpatternprogrammaticname
     */
    GetPatternProgrammaticName(pattern) {
        name := BSTR()
        result := ComCall(50, this, "int", pattern, "ptr", name, "HRESULT")
        return name
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
        patternIdsMarshal := patternIds is VarRef ? "ptr*" : "ptr"
        patternNamesMarshal := patternNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ptr", pElement, patternIdsMarshal, patternIds, patternNamesMarshal, patternNames, "HRESULT")
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
        propertyIdsMarshal := propertyIds is VarRef ? "ptr*" : "ptr"
        propertyNamesMarshal := propertyNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(52, this, "ptr", pElement, propertyIdsMarshal, propertyIds, propertyNamesMarshal, propertyNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} value 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-checknotsupported
     */
    CheckNotSupported(value) {
        result := ComCall(53, this, "ptr", value, "int*", &isNotSupported := 0, "HRESULT")
        return isNotSupported
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservednotsupportedvalue
     */
    get_ReservedNotSupportedValue() {
        result := ComCall(54, this, "ptr*", &notSupportedValue := 0, "HRESULT")
        return IUnknown(notSupportedValue)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservedmixedattributevalue
     */
    get_ReservedMixedAttributeValue() {
        result := ComCall(55, this, "ptr*", &mixedAttributeValue := 0, "HRESULT")
        return IUnknown(mixedAttributeValue)
    }

    /**
     * 
     * @param {IAccessible} accessible 
     * @param {Integer} childId 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessible
     */
    ElementFromIAccessible(accessible, childId) {
        result := ComCall(56, this, "ptr", accessible, "int", childId, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * 
     * @param {IAccessible} accessible 
     * @param {Integer} childId 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessiblebuildcache
     */
    ElementFromIAccessibleBuildCache(accessible, childId, cacheRequest) {
        result := ComCall(57, this, "ptr", accessible, "int", childId, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }
}
