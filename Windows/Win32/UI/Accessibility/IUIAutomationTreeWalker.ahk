#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCacheRequest.ahk" { IUIAutomationCacheRequest }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Exposes properties and methods that UI Automation client applications use to view and navigate the UI Automation elements on the desktop.
 * @remarks
 * UI Automation clients view the elements on the desktop as a set of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomation">IUIAutomation</a> objects arranged in a tree structure. Using the <b>IUIAutomationTreeWalker</b> interface, a client application can navigate by selecting a view of the tree and stepping from one element to another in a specified direction using methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelement">GetFirstChildElement</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelement">GetNextSiblingElement</a>.
 * 
 * Navigating the tree using <b>IUIAutomationTreeWalker</b> can result in cross-process calls and is not as efficient as locating an element using the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall">IUIAutomationElement::FindAll</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst">IUIAutomationElement::FindFirst</a> methods.
 * 
 * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationtreewalker
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationTreeWalker extends IUnknown {
    /**
     * The interface identifier for IUIAutomationTreeWalker
     * @type {Guid}
     */
    static IID := Guid("{4042c624-389c-4afc-a630-9df854a541fc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationTreeWalker interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParentElement                    : IntPtr
        GetFirstChildElement                : IntPtr
        GetLastChildElement                 : IntPtr
        GetNextSiblingElement               : IntPtr
        GetPreviousSiblingElement           : IntPtr
        NormalizeElement                    : IntPtr
        GetParentElementBuildCache          : IntPtr
        GetFirstChildElementBuildCache      : IntPtr
        GetLastChildElementBuildCache       : IntPtr
        GetNextSiblingElementBuildCache     : IntPtr
        GetPreviousSiblingElementBuildCache : IntPtr
        NormalizeElementBuildCache          : IntPtr
        get_Condition                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationTreeWalker.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUIAutomationCondition} 
     */
    Condition {
        get => this.get_Condition()
    }

    /**
     * Retrieves the parent element of the specified UI Automation element.
     * @remarks
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the  parent element will be returned as the parent on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the parent.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the parent element, or <b>NULL</b> if there is no parent element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getparentelement
     */
    GetParentElement(element) {
        result := ComCall(3, this, "ptr", element, "ptr*", &parent := 0, "HRESULT")
        return IUIAutomationElement(parent)
    }

    /**
     * Retrieves the first child element of the specified UI Automation element.
     * @remarks
     * An element can have additional child elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the first child element will be returned as the first child on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to  the element for which to retrieve the first child.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the first child element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelement
     */
    GetFirstChildElement(element) {
        result := ComCall(4, this, "ptr", element, "ptr*", &first := 0, "HRESULT")
        return IUIAutomationElement(first)
    }

    /**
     * Retrieves the last child element of the specified UI Automation element.
     * @remarks
     * An element can have additional child elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the last child element will be returned as the last child on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to  the element for which to retrieve the last child.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the last child element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getlastchildelement
     */
    GetLastChildElement(element) {
        result := ComCall(5, this, "ptr", element, "ptr*", &last := 0, "HRESULT")
        return IUIAutomationElement(last)
    }

    /**
     * Retrieves the next sibling element of the specified UI Automation element.
     * @remarks
     * An element can have additional sibling elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the next sibling element will be returned as the next sibling on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the next sibling.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the next sibling element, or <b>NULL</b> if there is no sibling element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelement
     */
    GetNextSiblingElement(element) {
        result := ComCall(6, this, "ptr", element, "ptr*", &next := 0, "HRESULT")
        return IUIAutomationElement(next)
    }

    /**
     * Retrieves the previous sibling element of the specified UI Automation element.
     * @remarks
     * An element can have additional sibling elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the previous sibling element will be returned as the previous sibling on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the previous sibling.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the previous sibling element, or <b>NULL</b> if there is no sibling element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getprevioussiblingelement
     */
    GetPreviousSiblingElement(element) {
        result := ComCall(7, this, "ptr", element, "ptr*", &previous := 0, "HRESULT")
        return IUIAutomationElement(previous)
    }

    /**
     * Retrieves the ancestor element nearest to the specified Microsoft UI Automation element in the tree view.
     * @remarks
     * The element is normalized by navigating up the ancestor chain in the tree until an element that satisfies the view condition (specified by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-get_condition">IUIAutomationTreeWalker::Condition</a>) is reached. But first, the passed element is tested to see if it matches a normalization condition. If so, the passed element is returned, even though it is not an ancestor.
     * 
     *  The method returns <b>UIA_E_ELEMENTNOTAVAILABLE</b> if no matching element has been found.
     * 
     * This method is useful for applications that obtain references to UI Automation elements by hit-testing. The application might want to work only with specific types of elements, and can use <b>IUIAutomationTreeWalker::Normalize</b> to make sure that no matter what element is initially retrieved (for example, when a scroll bar gets the input focus), only the element of interest (such as a content element) is ultimately retrieved.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element from which to start the normalization.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the ancestor element nearest to the specified element in the tree view.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-normalizeelement
     */
    NormalizeElement(element) {
        result := ComCall(8, this, "ptr", element, "ptr*", &normalized := 0, "HRESULT")
        return IUIAutomationElement(normalized)
    }

    /**
     * Retrieves the parent element of the specified UI Automation element, and caches properties and control patterns.
     * @remarks
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the  parent element will be returned as the parent on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the parent.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the parent element, or <b>NULL</b> if there is no parent element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getparentelementbuildcache
     */
    GetParentElementBuildCache(element, cacheRequest) {
        result := ComCall(9, this, "ptr", element, "ptr", cacheRequest, "ptr*", &parent := 0, "HRESULT")
        return IUIAutomationElement(parent)
    }

    /**
     * Retrieves the first child element of the specified UI Automation element, and caches properties and control patterns.
     * @remarks
     * An element can have additional child elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the first child element will be returned as the first child on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the first child.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to  a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the first child element, or <b>NULL</b> if there is no child element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelementbuildcache
     */
    GetFirstChildElementBuildCache(element, cacheRequest) {
        result := ComCall(10, this, "ptr", element, "ptr", cacheRequest, "ptr*", &first := 0, "HRESULT")
        return IUIAutomationElement(first)
    }

    /**
     * Retrieves the last child element of the specified UI Automation element, and caches properties and control patterns.
     * @remarks
     * An element can have additional child elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the last child element will be returned as the last child on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the last child.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the last child element, or <b>NULL</b> if there is no child element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getlastchildelementbuildcache
     */
    GetLastChildElementBuildCache(element, cacheRequest) {
        result := ComCall(11, this, "ptr", element, "ptr", cacheRequest, "ptr*", &last := 0, "HRESULT")
        return IUIAutomationElement(last)
    }

    /**
     * Retrieves the next sibling element of the specified UI Automation element, and caches properties and control patterns.
     * @remarks
     * An element can have additional sibling elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the next sibling element will be returned as the next sibling on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the next sibling.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the next sibling element, or <b>NULL</b> if there is no sibling element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelementbuildcache
     */
    GetNextSiblingElementBuildCache(element, cacheRequest) {
        result := ComCall(12, this, "ptr", element, "ptr", cacheRequest, "ptr*", &next := 0, "HRESULT")
        return IUIAutomationElement(next)
    }

    /**
     * Retrieves the previous sibling element of the specified UI Automation element, and caches properties and control patterns.
     * @remarks
     * An element can have additional sibling elements that do not match the current view condition and thus are not returned when navigating the element tree.
     * 
     * The structure of the Microsoft UI Automation tree changes as the visible UI elements on the desktop change. It is not guaranteed that an element returned as the previous sibling element will be returned as the previous sibling on subsequent passes.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element for which to retrieve the previous sibling.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the previous sibling element, or <b>NULL</b> if there is no sibling element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getprevioussiblingelementbuildcache
     */
    GetPreviousSiblingElementBuildCache(element, cacheRequest) {
        result := ComCall(13, this, "ptr", element, "ptr", cacheRequest, "ptr*", &previous := 0, "HRESULT")
        return IUIAutomationElement(previous)
    }

    /**
     * Retrieves the ancestor element nearest to the specified Microsoft UI Automation element in the tree view, prefetches the requested properties and control patterns, and stores the prefetched items in the cache.
     * @remarks
     * The element is normalized by navigating up the ancestor chain in the tree until an element that satisfies the view condition (specified by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-get_condition">IUIAutomationTreeWalker::Condition</a>) is reached. If the root element is reached, the root element is returned, even if it does not satisfy the view condition. 
     *             
     * 
     * This method is useful for applications that obtain references to UI Automation elements by hit-testing. The application might want to work only with specific types of elements, and can use <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-normalizeelement">IUIAutomationTreeWalker::NormalizeElement</a> to make sure that no matter what element is initially retrieved (for example, when a scroll bar gets the input focus), only the element of interest (such as a content element) is ultimately retrieved.
     * @param {IUIAutomationElement} element Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element from which to start the normalization.
     * @param {IUIAutomationCacheRequest} cacheRequest Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationcacherequest">IUIAutomationCacheRequest</a>*</b>
     * 
     * A pointer to a cache request that specifies the properties and control patterns to cache on the returned element.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the ancestor element nearest to the specified element in the tree view.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-normalizeelementbuildcache
     */
    NormalizeElementBuildCache(element, cacheRequest) {
        result := ComCall(14, this, "ptr", element, "ptr", cacheRequest, "ptr*", &normalized := 0, "HRESULT")
        return IUIAutomationElement(normalized)
    }

    /**
     * Retrieves the condition that defines the view of the UI Automation tree.
     * @returns {IUIAutomationCondition} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-get_condition
     */
    get_Condition() {
        result := ComCall(15, this, "ptr*", &condition := 0, "HRESULT")
        return IUIAutomationCondition(condition)
    }

    Query(iid) {
        if (IUIAutomationTreeWalker.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParentElement := CallbackCreate(GetMethod(implObj, "GetParentElement"), flags, 3)
        this.vtbl.GetFirstChildElement := CallbackCreate(GetMethod(implObj, "GetFirstChildElement"), flags, 3)
        this.vtbl.GetLastChildElement := CallbackCreate(GetMethod(implObj, "GetLastChildElement"), flags, 3)
        this.vtbl.GetNextSiblingElement := CallbackCreate(GetMethod(implObj, "GetNextSiblingElement"), flags, 3)
        this.vtbl.GetPreviousSiblingElement := CallbackCreate(GetMethod(implObj, "GetPreviousSiblingElement"), flags, 3)
        this.vtbl.NormalizeElement := CallbackCreate(GetMethod(implObj, "NormalizeElement"), flags, 3)
        this.vtbl.GetParentElementBuildCache := CallbackCreate(GetMethod(implObj, "GetParentElementBuildCache"), flags, 4)
        this.vtbl.GetFirstChildElementBuildCache := CallbackCreate(GetMethod(implObj, "GetFirstChildElementBuildCache"), flags, 4)
        this.vtbl.GetLastChildElementBuildCache := CallbackCreate(GetMethod(implObj, "GetLastChildElementBuildCache"), flags, 4)
        this.vtbl.GetNextSiblingElementBuildCache := CallbackCreate(GetMethod(implObj, "GetNextSiblingElementBuildCache"), flags, 4)
        this.vtbl.GetPreviousSiblingElementBuildCache := CallbackCreate(GetMethod(implObj, "GetPreviousSiblingElementBuildCache"), flags, 4)
        this.vtbl.NormalizeElementBuildCache := CallbackCreate(GetMethod(implObj, "NormalizeElementBuildCache"), flags, 4)
        this.vtbl.get_Condition := CallbackCreate(GetMethod(implObj, "get_Condition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParentElement)
        CallbackFree(this.vtbl.GetFirstChildElement)
        CallbackFree(this.vtbl.GetLastChildElement)
        CallbackFree(this.vtbl.GetNextSiblingElement)
        CallbackFree(this.vtbl.GetPreviousSiblingElement)
        CallbackFree(this.vtbl.NormalizeElement)
        CallbackFree(this.vtbl.GetParentElementBuildCache)
        CallbackFree(this.vtbl.GetFirstChildElementBuildCache)
        CallbackFree(this.vtbl.GetLastChildElementBuildCache)
        CallbackFree(this.vtbl.GetNextSiblingElementBuildCache)
        CallbackFree(this.vtbl.GetPreviousSiblingElementBuildCache)
        CallbackFree(this.vtbl.NormalizeElementBuildCache)
        CallbackFree(this.vtbl.get_Condition)
    }
}
