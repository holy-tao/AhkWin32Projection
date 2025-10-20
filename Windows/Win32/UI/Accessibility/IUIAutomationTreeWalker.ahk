#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes properties and methods that UI Automation client applications use to view and navigate the UI Automation elements on the desktop.
 * @remarks
 * 
  * UI Automation clients view the elements on the desktop as a set of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomation">IUIAutomation</a> objects arranged in a tree structure. Using the <b>IUIAutomationTreeWalker</b> interface, a client application can navigate by selecting a view of the tree and stepping from one element to another in a specified direction using methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelement">GetFirstChildElement</a> and <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelement">GetNextSiblingElement</a>.
  * 
  * Navigating the tree using <b>IUIAutomationTreeWalker</b> can result in cross-process calls and is not as efficient as locating an element using the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findall">IUIAutomationElement::FindAll</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst">IUIAutomationElement::FindFirst</a> methods.
  * 
  * If your client application might try to find elements in its own user interface, you must make all UI Automation calls on a separate thread.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtreewalker
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTreeWalker extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTreeWalker
     * @type {Guid}
     */
    static IID => Guid("{4042c624-389c-4afc-a630-9df854a541fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParentElement", "GetFirstChildElement", "GetLastChildElement", "GetNextSiblingElement", "GetPreviousSiblingElement", "NormalizeElement", "GetParentElementBuildCache", "GetFirstChildElementBuildCache", "GetLastChildElementBuildCache", "GetNextSiblingElementBuildCache", "GetPreviousSiblingElementBuildCache", "NormalizeElementBuildCache", "get_Condition"]

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} parent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getparentelement
     */
    GetParentElement(element, parent) {
        result := ComCall(3, this, "ptr", element, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} first 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelement
     */
    GetFirstChildElement(element, first) {
        result := ComCall(4, this, "ptr", element, "ptr*", first, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} last 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getlastchildelement
     */
    GetLastChildElement(element, last) {
        result := ComCall(5, this, "ptr", element, "ptr*", last, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} next 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelement
     */
    GetNextSiblingElement(element, next) {
        result := ComCall(6, this, "ptr", element, "ptr*", next, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} previous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getprevioussiblingelement
     */
    GetPreviousSiblingElement(element, previous) {
        result := ComCall(7, this, "ptr", element, "ptr*", previous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {Pointer<IUIAutomationElement>} normalized 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-normalizeelement
     */
    NormalizeElement(element, normalized) {
        result := ComCall(8, this, "ptr", element, "ptr*", normalized, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} parent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getparentelementbuildcache
     */
    GetParentElementBuildCache(element, cacheRequest, parent) {
        result := ComCall(9, this, "ptr", element, "ptr", cacheRequest, "ptr*", parent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} first 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getfirstchildelementbuildcache
     */
    GetFirstChildElementBuildCache(element, cacheRequest, first) {
        result := ComCall(10, this, "ptr", element, "ptr", cacheRequest, "ptr*", first, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} last 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getlastchildelementbuildcache
     */
    GetLastChildElementBuildCache(element, cacheRequest, last) {
        result := ComCall(11, this, "ptr", element, "ptr", cacheRequest, "ptr*", last, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} next 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getnextsiblingelementbuildcache
     */
    GetNextSiblingElementBuildCache(element, cacheRequest, next) {
        result := ComCall(12, this, "ptr", element, "ptr", cacheRequest, "ptr*", next, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} previous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-getprevioussiblingelementbuildcache
     */
    GetPreviousSiblingElementBuildCache(element, cacheRequest, previous) {
        result := ComCall(13, this, "ptr", element, "ptr", cacheRequest, "ptr*", previous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUIAutomationElement} element 
     * @param {IUIAutomationCacheRequest} cacheRequest 
     * @param {Pointer<IUIAutomationElement>} normalized 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-normalizeelementbuildcache
     */
    NormalizeElementBuildCache(element, cacheRequest, normalized) {
        result := ComCall(14, this, "ptr", element, "ptr", cacheRequest, "ptr*", normalized, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationCondition>} condition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtreewalker-get_condition
     */
    get_Condition(condition) {
        result := ComCall(15, this, "ptr*", condition, "HRESULT")
        return result
    }
}
