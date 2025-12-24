#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUIAutomationElementArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to information exposed by a UI Automation provider for an element that can be dragged as part of a drag-and-drop operation.
 * @remarks
 * 
 * Microsoft UI Automation clients use this interface to access the dragging properties and functionality of a control or UI element that the user can drag-and-drop on a drop target.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationdragpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationDragPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationDragPattern
     * @type {Guid}
     */
    static IID => Guid("{1dc7b570-1f54-4bad-bcda-d36a722fb7bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentIsGrabbed", "get_CachedIsGrabbed", "get_CurrentDropEffect", "get_CachedDropEffect", "get_CurrentDropEffects", "get_CachedDropEffects", "GetCurrentGrabbedItems", "GetCachedGrabbedItems"]

    /**
     * @type {BOOL} 
     */
    CurrentIsGrabbed {
        get => this.get_CurrentIsGrabbed()
    }

    /**
     * @type {BOOL} 
     */
    CachedIsGrabbed {
        get => this.get_CachedIsGrabbed()
    }

    /**
     * @type {BSTR} 
     */
    CurrentDropEffect {
        get => this.get_CurrentDropEffect()
    }

    /**
     * @type {BSTR} 
     */
    CachedDropEffect {
        get => this.get_CachedDropEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CurrentDropEffects {
        get => this.get_CurrentDropEffects()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    CachedDropEffects {
        get => this.get_CachedDropEffects()
    }

    /**
     * Indicates whether the user has grabbed this element as part of a drag-and-drop operation.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentisgrabbed
     */
    get_CurrentIsGrabbed() {
        result := ComCall(3, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether this element has been grabbed as part of a drag-and-drop operation.
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cachedisgrabbed
     */
    get_CachedIsGrabbed() {
        result := ComCall(4, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a localized string that indicates what happens when the user drops this element as part of a drag-drop operation.
     * @remarks
     * 
     * In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffect
     */
    get_CurrentDropEffect() {
        retVal := BSTR()
        result := ComCall(5, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached localized string that indicates what happens when the user drops this element as part of a drag-and-drop operation.
     * @remarks
     * 
     * In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffect
     */
    get_CachedDropEffect() {
        retVal := BSTR()
        result := ComCall(6, this, "ptr", retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when this element as part of a drag-and-drop operation.
     * @remarks
     * 
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffects
     */
    get_CurrentDropEffects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of localized strings that enumerate the full set of effects that can happen when the user drops this element as part of a drag-and-drop operation.
     * @remarks
     * 
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects">DropEffects</a> property of the dragged element.  This property can contain short strings such as "move", or  longer ones such as "insert into Main group".  The strings are always localized.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffects
     */
    get_CachedDropEffects() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a collection of elements that represent the full set of items that the user is dragging as part of a drag operation.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IAutomationElementArray</a>**</b>
     * 
     * The collection of elements that the user is dragging. This property is <b>NULL</b> or an empty array if only a single item is being dragged. The default value is an empty array.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcurrentgrabbeditems
     */
    GetCurrentGrabbedItems() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached collection of elements that represent the full set of items that the user is dragging as part of a drag operation.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IAutomationElementArray</a>**</b>
     * 
     * The cached collection of elements that the user is dragging. This property is <b>NULL</b> or an empty array if only a single item is being dragged. The default value is an empty array.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcachedgrabbeditems
     */
    GetCachedGrabbedItems() {
        result := ComCall(10, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
