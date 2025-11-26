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
     * @type {IUIAutomationTreeWalker} 
     */
    ControlViewWalker {
        get => this.get_ControlViewWalker()
    }

    /**
     * @type {IUIAutomationTreeWalker} 
     */
    ContentViewWalker {
        get => this.get_ContentViewWalker()
    }

    /**
     * @type {IUIAutomationTreeWalker} 
     */
    RawViewWalker {
        get => this.get_RawViewWalker()
    }

    /**
     * @type {IUIAutomationCondition} 
     */
    RawViewCondition {
        get => this.get_RawViewCondition()
    }

    /**
     * @type {IUIAutomationCondition} 
     */
    ControlViewCondition {
        get => this.get_ControlViewCondition()
    }

    /**
     * @type {IUIAutomationCondition} 
     */
    ContentViewCondition {
        get => this.get_ContentViewCondition()
    }

    /**
     * @type {IUIAutomationProxyFactoryMapping} 
     */
    ProxyFactoryMapping {
        get => this.get_ProxyFactoryMapping()
    }

    /**
     * @type {IUnknown} 
     */
    ReservedNotSupportedValue {
        get => this.get_ReservedNotSupportedValue()
    }

    /**
     * @type {IUnknown} 
     */
    ReservedMixedAttributeValue {
        get => this.get_ReservedMixedAttributeValue()
    }

    /**
     * Compares two UI Automation elements to determine whether they represent the same underlying UI element.
     * @param {IUIAutomationElement} el1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the first element to compare.
     * @param {IUIAutomationElement} el2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the second element to compare.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the run-time identifiers of the elements are the same, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-compareelements
     */
    CompareElements(el1, el2) {
        result := ComCall(3, this, "ptr", el1, "ptr", el2, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * Compares two integer arrays containing run-time identifiers (IDs) to determine whether their content is the same and they belong to the same UI element.
     * @param {Pointer<SAFEARRAY>} runtimeId1 Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * The first ID to compare.
     * @param {Pointer<SAFEARRAY>} runtimeId2 Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * The second ID to compare
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the IDs are the same, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-compareruntimeids
     */
    CompareRuntimeIds(runtimeId1, runtimeId2) {
        result := ComCall(4, this, "ptr", runtimeId1, "ptr", runtimeId2, "int*", &areSame := 0, "HRESULT")
        return areSame
    }

    /**
     * Retrieves the UI Automation element that represents the desktop.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelement
     */
    GetRootElement() {
        result := ComCall(5, this, "ptr*", &root := 0, "HRESULT")
        return IUIAutomationElement(root)
    }

    /**
     * Retrieves a UI Automation element for the specified window.
     * @param {HWND} hwnd Type: <b>UIA_HWND</b>
     * 
     * The window handle.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandle
     */
    ElementFromHandle(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the UI Automation element at the specified point on the desktop.
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The desktop coordinates of the UI Automation element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompoint
     */
    ElementFromPoint(pt) {
        result := ComCall(7, this, "ptr", pt, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the UI Automation element that has the input focus.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelement
     */
    GetFocusedElement() {
        result := ComCall(8, this, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the UI Automation element that represents the desktop, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to the cache request, which specifies the properties and control patterns to store in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getrootelementbuildcache
     */
    GetRootElementBuildCache(cacheRequest) {
        result := ComCall(9, this, "ptr", cacheRequest, "ptr*", &root := 0, "HRESULT")
        return IUIAutomationElement(root)
    }

    /**
     * Retrieves a UI Automation element for the specified window, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {HWND} hwnd Type: <b>UIA_HWND</b>
     * 
     * The window handle.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to the cache request, which specifies the properties and control patterns to store in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromhandlebuildcache
     */
    ElementFromHandleBuildCache(hwnd, cacheRequest) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the UI Automation element at the specified point on the desktop, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {POINT} pt Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The desktop coordinates of the UI Automation element.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to the cache request, which specifies the properties and control patterns to store in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfrompointbuildcache
     */
    ElementFromPointBuildCache(pt, cacheRequest) {
        result := ComCall(11, this, "ptr", pt, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves the UI Automation element that has the input focus, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to the cache request, which specifies the properties and control patterns to store in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getfocusedelementbuildcache
     */
    GetFocusedElementBuildCache(cacheRequest) {
        result := ComCall(12, this, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves a tree walker object that can be used to traverse the Microsoft UI Automation tree.
     * @param {IUIAutomationCondition} pCondition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to  a condition that specifies the elements of interest.
     * @returns {IUIAutomationTreeWalker} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationtreewalker">IUIAutomationTreeWalker</a>**</b>
     * 
     * Receives a pointer to the tree walker object.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createtreewalker
     */
    CreateTreeWalker(pCondition) {
        result := ComCall(13, this, "ptr", pCondition, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * Retrieves an IUIAutomationTreeWalker interface used to discover control elements.
     * @returns {IUIAutomationTreeWalker} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewwalker
     */
    get_ControlViewWalker() {
        result := ComCall(14, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * Retrieves an IUIAutomationTreeWalker interface used to discover content elements.
     * @returns {IUIAutomationTreeWalker} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewwalker
     */
    get_ContentViewWalker() {
        result := ComCall(15, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * Retrieves a tree walker object used to traverse an unfiltered view of the Microsoft UI Automation tree.
     * @returns {IUIAutomationTreeWalker} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewwalker
     */
    get_RawViewWalker() {
        result := ComCall(16, this, "ptr*", &walker := 0, "HRESULT")
        return IUIAutomationTreeWalker(walker)
    }

    /**
     * Retrieves a predefined IUIAutomationCondition interface that selects all UI elements in an unfiltered view.
     * @remarks
     * 
     * Used by itself, the condition is functionally identical to the one retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-createtruecondition">IUIAutomation::CreateTrueCondition</a>.
     * 
     * 
     * @returns {IUIAutomationCondition} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_rawviewcondition
     */
    get_RawViewCondition() {
        result := ComCall(17, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * Retrieves a predefined IUIAutomationCondition interface that selects control elements.
     * @returns {IUIAutomationCondition} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_controlviewcondition
     */
    get_ControlViewCondition() {
        result := ComCall(18, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * Retrieves a predefined IUIAutomationCondition interface that selects content elements.
     * @returns {IUIAutomationCondition} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_contentviewcondition
     */
    get_ContentViewCondition() {
        result := ComCall(19, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    /**
     * Creates a cache request.
     * @returns {IUIAutomationCacheRequest} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>**</b>
     * 
     * The address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createcacherequest
     */
    CreateCacheRequest() {
        result := ComCall(20, this, "ptr*", &cacheRequest := 0, "HRESULT")
        return IUIAutomationCacheRequest(cacheRequest)
    }

    /**
     * Retrieves a predefined condition that selects all elements.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the true condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createtruecondition
     */
    CreateTrueCondition() {
        result := ComCall(21, this, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that is always false.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the false condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createfalsecondition
     */
    CreateFalseCondition() {
        result := ComCall(22, this, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that selects elements that have a property with the specified value.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The property value.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the new condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertycondition
     */
    CreatePropertyCondition(propertyId, value) {
        result := ComCall(23, this, "int", propertyId, "ptr", value, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that selects elements that have a property with the specified value, using optional flags.
     * @param {Integer} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * The property value.
     * @param {Integer} flags 
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the new condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createpropertyconditionex
     */
    CreatePropertyConditionEx(propertyId, value, flags) {
        result := ComCall(24, this, "int", propertyId, "ptr", value, "int", flags, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that selects elements that match both of two conditions.
     * @param {IUIAutomationCondition} condition1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to the first condition to match.
     * @param {IUIAutomationCondition} condition2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to the second condition to match.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createandcondition
     */
    CreateAndCondition(condition1, condition2) {
        result := ComCall(25, this, "ptr", condition1, "ptr", condition2, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that selects elements based on multiple conditions, all of which must be true.
     * @param {Pointer<SAFEARRAY>} conditions Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the conditions to be combined.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromarray
     */
    CreateAndConditionFromArray(conditions) {
        result := ComCall(26, this, "ptr", conditions, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that selects elements from a native array, based on multiple conditions that must all be true.
     * @param {Pointer<IUIAutomationCondition>} conditions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * A pointer to an array of conditions to be combined.
     * @param {Integer} conditionCount Type: <b>int</b>
     * 
     * The number of elements in the <i>conditions</i> array.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createandconditionfromnativearray
     */
    CreateAndConditionFromNativeArray(conditions, conditionCount) {
        result := ComCall(27, this, "ptr*", conditions, "int", conditionCount, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a combination of two conditions where a match exists if either of the conditions is true.
     * @param {IUIAutomationCondition} condition1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to the first condition.
     * @param {IUIAutomationCondition} condition2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to the second condition.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createorcondition
     */
    CreateOrCondition(condition1, condition2) {
        result := ComCall(28, this, "ptr", condition1, "ptr", condition2, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a combination of two or more conditions where a match exists if any of the conditions is true.
     * @param {Pointer<SAFEARRAY>} conditions Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the conditions.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromarray
     */
    CreateOrConditionFromArray(conditions) {
        result := ComCall(29, this, "ptr", conditions, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a combination of two or more conditions where a match exists if any one of the conditions is true.
     * @param {Pointer<IUIAutomationCondition>} conditions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * A pointer to an array of conditions to combine.
     * @param {Integer} conditionCount Type: <b>int</b>
     * 
     * The number of elements in <i>conditions</i>.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the combined condition.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createorconditionfromnativearray
     */
    CreateOrConditionFromNativeArray(conditions, conditionCount) {
        result := ComCall(30, this, "ptr*", conditions, "int", conditionCount, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Creates a condition that is the negative of a specified condition.
     * @param {IUIAutomationCondition} condition Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>*</b>
     * 
     * A pointer to the initial condition.
     * @returns {IUIAutomationCondition} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcondition">IUIAutomationCondition</a>**</b>
     * 
     * Receives a pointer to the negative of the initial condition specified by the <i>condition</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createnotcondition
     */
    CreateNotCondition(condition) {
        result := ComCall(31, this, "ptr", condition, "ptr*", &newCondition := 0, "HRESULT")
        return IUIAutomationCondition(newCondition)
    }

    /**
     * Registers a method that handles Microsoft UI Automation events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @param {Integer} eventId Type: <b>EVENTID</b>
     * 
     * The identifier of the event that the method handles. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element to associate with the event handler.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationeventhandler">IUIAutomationEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler
     */
    AddAutomationEventHandler(eventId, element, scope, cacheRequest, handler) {
        result := ComCall(32, this, "int", eventId, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes the specified UI Automation event handler.
     * @param {Integer} eventId Type: <b>EVENTID</b>
     * 
     * The identifier of the event being handled. For a list of event IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">Event Identifiers</a>.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element that is handling the event.
     * @param {IUIAutomationEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationeventhandler">IUIAutomationEventHandler</a>*</b>
     * 
     * A pointer to the handler method that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addautomationeventhandler">IUIAutomation::AddAutomationEventHandler</a> for the specified event identifier and UI Automation element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-removeautomationeventhandler
     */
    RemoveAutomationEventHandler(eventId, element, handler) {
        result := ComCall(33, this, "int", eventId, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles a native array of property-changed events.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationPropertyChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationpropertychangedeventhandler">IUIAutomationPropertyChangedEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the event.
     * @param {Pointer<Integer>} propertyArray Type: <b>PROPERTYID*</b>
     * 
     * A pointer to the identifiers of the UI Automation properties of interest.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Integer} propertyCount Type: <b>int</b>
     * 
     * The number of property identifiers in <i>propertyArray</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandlernativearray
     */
    AddPropertyChangedEventHandlerNativeArray(element, scope, cacheRequest, handler, propertyArray, propertyCount) {
        propertyArrayMarshal := propertyArray is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, propertyArrayMarshal, propertyArray, "int", propertyCount, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles and array of property-changed events.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationPropertyChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationpropertychangedeventhandler">IUIAutomationPropertyChangedEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the event.
     * @param {Pointer<SAFEARRAY>} propertyArray Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the UI Automation properties of interest. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler
     */
    AddPropertyChangedEventHandler(element, scope, cacheRequest, handler, propertyArray) {
        result := ComCall(35, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "ptr", propertyArray, "HRESULT")
        return result
    }

    /**
     * Removes a property-changed event handler.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationPropertyChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationpropertychangedeventhandler">IUIAutomationPropertyChangedEventHandler</a>*</b>
     * 
     * A pointer to the interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler">IUIAutomation::AddPropertyChangedEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-removepropertychangedeventhandler
     */
    RemovePropertyChangedEventHandler(element, handler) {
        result := ComCall(36, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles structure-changed events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element associated with the event handler.
     * @param {Integer} scope 
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationStructureChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationstructurechangedeventhandler">IUIAutomationStructureChangedEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the structure-changed event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler
     */
    AddStructureChangedEventHandler(element, scope, cacheRequest, handler) {
        result := ComCall(37, this, "ptr", element, "int", scope, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a structure-changed event handler.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the UI Automation element from which to remove the handler.
     * @param {IUIAutomationStructureChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationstructurechangedeventhandler">IUIAutomationStructureChangedEventHandler</a>*</b>
     * 
     * A pointer to the  interface that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addstructurechangedeventhandler">IUIAutomation::AddStructureChangedEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-removestructurechangedeventhandler
     */
    RemoveStructureChangedEventHandler(element, handler) {
        result := ComCall(38, this, "ptr", element, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Registers a method that handles focus-changed events.Note  Before implementing an event handler, you should be familiar with the threading issues described in Understanding Threading Issues.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request, or <b>NULL</b> if no caching is wanted.
     * @param {IUIAutomationFocusChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationfocuschangedeventhandler">IUIAutomationFocusChangedEventHandler</a>*</b>
     * 
     * A pointer to the object that handles the event.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler
     */
    AddFocusChangedEventHandler(cacheRequest, handler) {
        result := ComCall(39, this, "ptr", cacheRequest, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes a focus-changed event handler.
     * @param {IUIAutomationFocusChangedEventHandler} handler Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationfocuschangedeventhandler">IUIAutomationFocusChangedEventHandler</a>*</b>
     * 
     * A pointer to the event handler that was passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addfocuschangedeventhandler">IUIAutomation::AddFocusChangedEventHandler</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-removefocuschangedeventhandler
     */
    RemoveFocusChangedEventHandler(handler) {
        result := ComCall(40, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Removes all registered Microsoft UI Automation event handlers.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-removealleventhandlers
     */
    RemoveAllEventHandlers() {
        result := ComCall(41, this, "HRESULT")
        return result
    }

    /**
     * Converts an array of integers to a SAFEARRAY.
     * @param {Pointer<Integer>} array Type: <b>int*</b>
     * 
     * A pointer to an array of integers.
     * @param {Integer} arrayCount Type: <b>int</b>
     * 
     * The number of elements in <i>array</i>.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to the allocated SAFEARRAY.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-intnativearraytosafearray
     */
    IntNativeArrayToSafeArray(array, arrayCount) {
        arrayMarshal := array is VarRef ? "int*" : "ptr"

        result := ComCall(42, this, arrayMarshal, array, "int", arrayCount, "ptr*", &safeArray := 0, "HRESULT")
        return safeArray
    }

    /**
     * Converts a SAFEARRAY of integers to an array.
     * @param {Pointer<SAFEARRAY>} intArray Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to the SAFEARRAY to convert.
     * @param {Pointer<Pointer<Integer>>} array Type: <b>int**</b>
     * 
     * Receives a pointer to the allocated array.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of elements in <i>array</i>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-intsafearraytonativearray
     */
    IntSafeArrayToNativeArray(intArray, array) {
        arrayMarshal := array is VarRef ? "ptr*" : "ptr"

        result := ComCall(43, this, "ptr", intArray, arrayMarshal, array, "int*", &arrayCount := 0, "HRESULT")
        return arrayCount
    }

    /**
     * Creates a VARIANT that contains the coordinates of a rectangle.
     * @param {RECT} rc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a structure that contains the coordinates of the rectangle.
     * @returns {VARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a>*</b>
     * 
     * Receives the coordinates of the rectangle.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-recttovariant
     */
    RectToVariant(rc) {
        var := VARIANT()
        result := ComCall(44, this, "ptr", rc, "ptr", var, "HRESULT")
        return var
    }

    /**
     * Converts a VARIANT containing rectangle coordinates to a RECT.
     * @param {VARIANT} var Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The coordinates of a rectangle.
     * @returns {RECT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Receives the converted rectangle coordinates.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-varianttorect
     */
    VariantToRect(var) {
        rc := RECT()
        result := ComCall(45, this, "ptr", var, "ptr", rc, "HRESULT")
        return rc
    }

    /**
     * Converts a SAFEARRAY containing rectangle coordinates to an array of type RECT.
     * @param {Pointer<SAFEARRAY>} rects Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>*</b>
     * 
     * A pointer to an array containing rectangle coordinates.
     * @param {Pointer<Pointer<RECT>>} rectArray Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>**</b>
     * 
     * Receives a pointer to an array of structures containing rectangle coordinates.
     * @returns {Integer} Type: <b>int*</b>
     * 
     * Receives the number of elements in <i>rectArray</i>.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-safearraytorectnativearray
     */
    SafeArrayToRectNativeArray(rects, rectArray) {
        rectArrayMarshal := rectArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(46, this, "ptr", rects, rectArrayMarshal, rectArray, "int*", &rectArrayCount := 0, "HRESULT")
        return rectArrayCount
    }

    /**
     * Creates a new instance of a proxy factory object.
     * @param {IUIAutomationProxyFactory} factory Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactory">IUIAutomationProxyFactory</a>*</b>
     * 
     * A pointer to  the proxy factory object.
     * @returns {IUIAutomationProxyFactoryEntry} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationproxyfactoryentry">IUIAutomationProxyFactoryEntry</a>**</b>
     * 
     * Receives a pointer to the newly created instance of the proxy factory object.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-createproxyfactoryentry
     */
    CreateProxyFactoryEntry(factory) {
        result := ComCall(47, this, "ptr", factory, "ptr*", &factoryEntry := 0, "HRESULT")
        return IUIAutomationProxyFactoryEntry(factoryEntry)
    }

    /**
     * Retrieves an object that represents the mapping of Window classnames and associated data to individual proxy factories.
     * @returns {IUIAutomationProxyFactoryMapping} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_proxyfactorymapping
     */
    get_ProxyFactoryMapping() {
        result := ComCall(48, this, "ptr*", &factoryMapping := 0, "HRESULT")
        return IUIAutomationProxyFactoryMapping(factoryMapping)
    }

    /**
     * Retrieves the registered programmatic name of a property.
     * @param {Integer} property Type: <b>PROPERTYID</b>
     * 
     * The property identifier.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the registered programmatic name.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getpropertyprogrammaticname
     */
    GetPropertyProgrammaticName(property) {
        name := BSTR()
        result := ComCall(49, this, "int", property, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves the registered programmatic name of a control pattern.
     * @param {Integer} pattern Type: <b>PATTERNID</b>
     * 
     * The identifier of the control pattern. For a list of control pattern IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-controlpattern-ids">Control Pattern Identifiers</a>.
     * @returns {BSTR} Type: <b>BSTR*</b>
     * 
     * Receives the registered programmatic name.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-getpatternprogrammaticname
     */
    GetPatternProgrammaticName(pattern) {
        name := BSTR()
        result := ComCall(50, this, "int", pattern, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Retrieves the control patterns that might be supported on a UI Automation element.
     * @param {IUIAutomationElement} pElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * The address of the element to poll.
     * @param {Pointer<Pointer<SAFEARRAY>>} patternIds Type: <b>SAFEARRAY(int)**</b>
     * 
     * Receives a pointer to an array of control pattern identifiers.
     * @param {Pointer<Pointer<SAFEARRAY>>} patternNames Type: <b>SAFEARRAY(BSTR)**</b>
     * 
     * Receives a pointer to an array of control pattern names.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-pollforpotentialsupportedpatterns
     */
    PollForPotentialSupportedPatterns(pElement, patternIds, patternNames) {
        patternIdsMarshal := patternIds is VarRef ? "ptr*" : "ptr"
        patternNamesMarshal := patternNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(51, this, "ptr", pElement, patternIdsMarshal, patternIds, patternNamesMarshal, patternNames, "HRESULT")
        return result
    }

    /**
     * Retrieves the properties that might be supported on a UI Automation element.
     * @param {IUIAutomationElement} pElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * The address of the UI Automation element to poll.
     * @param {Pointer<Pointer<SAFEARRAY>>} propertyIds Type: <b>SAFEARRAY(int)**</b>
     * 
     * Receives a pointer to an array of property identifiers.  For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {Pointer<Pointer<SAFEARRAY>>} propertyNames Type: <b>SAFEARRAY(BSTR)**</b>
     * 
     * Receives a pointer to an array of property names.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-pollforpotentialsupportedproperties
     */
    PollForPotentialSupportedProperties(pElement, propertyIds, propertyNames) {
        propertyIdsMarshal := propertyIds is VarRef ? "ptr*" : "ptr"
        propertyNamesMarshal := propertyNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(52, this, "ptr", pElement, propertyIdsMarshal, propertyIds, propertyNamesMarshal, propertyNames, "HRESULT")
        return result
    }

    /**
     * Checks a provided VARIANT to see if it contains the Not Supported identifier.
     * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The value to check.
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Receives <b>TRUE</b> if the provided <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> contains the Not Supported identifier, or <b>FALSE</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-checknotsupported
     */
    CheckNotSupported(value) {
        result := ComCall(53, this, "ptr", value, "int*", &isNotSupported := 0, "HRESULT")
        return isNotSupported
    }

    /**
     * Retrieves a static token object representing a property or text attribute that is not supported.
     * @remarks
     * 
     *  This object can be used for comparison with the results from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpropertyvalue">IUIAutomationElement::GetCurrentPropertyValue</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue">IUIAutomationTextRange::GetAttributeValue</a>.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservednotsupportedvalue
     */
    get_ReservedNotSupportedValue() {
        result := ComCall(54, this, "ptr*", &notSupportedValue := 0, "HRESULT")
        return IUnknown(notSupportedValue)
    }

    /**
     * Retrieves a static token object representing a text attribute that is a mixed attribute.
     * @remarks
     * 
     *  The object retrieved by <b>IUIAutomation::ReservedMixedAttributeValue</b> can be used for comparison with the results from <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextrange-getattributevalue">IUIAutomationTextRange::GetAttributeValue</a> to determine if a text range contains more than one value for a particular text attribute.
     * 
     * 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-get_reservedmixedattributevalue
     */
    get_ReservedMixedAttributeValue() {
        result := ComCall(55, this, "ptr*", &mixedAttributeValue := 0, "HRESULT")
        return IUnknown(mixedAttributeValue)
    }

    /**
     * Retrieves a UI Automation element for the specified accessible object from a Microsoft Active Accessibility server.
     * @param {IAccessible} accessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface of the accessible object.
     * @param {Integer} childId Type: <b>int</b>
     * 
     * The child ID of the accessible object.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessible
     */
    ElementFromIAccessible(accessible, childId) {
        result := ComCall(56, this, "ptr", accessible, "int", childId, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }

    /**
     * Retrieves a UI Automation element for the specified accessible object from a Microsoft Active Accessibility server, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @param {IAccessible} accessible Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface of the accessible object.
     * @param {Integer} childId Type: <b>int</b>
     * 
     * The child ID of the accessible object.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>**</b>
     * 
     * The address of the cache request that specifies the properties and control patterns to store in the cache.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the UI Automation element.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomation-elementfromiaccessiblebuildcache
     */
    ElementFromIAccessibleBuildCache(accessible, childId, cacheRequest) {
        result := ComCall(57, this, "ptr", accessible, "int", childId, "ptr", cacheRequest, "ptr*", &element := 0, "HRESULT")
        return IUIAutomationElement(element)
    }
}
