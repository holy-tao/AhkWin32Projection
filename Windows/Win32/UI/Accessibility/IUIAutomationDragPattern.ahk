#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to information exposed by a UI Automation provider for an element that can be dragged as part of a drag-and-drop operation.
 * @remarks
 * Microsoft UI Automation clients use this interface to access the dragging properties and functionality of a control or UI element that the user can drag-and-drop on a drop target.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationdragpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationDragPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationDragPattern
     * @type {Guid}
     */
    static IID := Guid("{1dc7b570-1f54-4bad-bcda-d36a722fb7bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationDragPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_CurrentIsGrabbed   : IntPtr
        get_CachedIsGrabbed    : IntPtr
        get_CurrentDropEffect  : IntPtr
        get_CachedDropEffect   : IntPtr
        get_CurrentDropEffects : IntPtr
        get_CachedDropEffects  : IntPtr
        GetCurrentGrabbedItems : IntPtr
        GetCachedGrabbedItems  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationDragPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentisgrabbed
     */
    get_CurrentIsGrabbed() {
        result := ComCall(3, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether this element has been grabbed as part of a drag-and-drop operation.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cachedisgrabbed
     */
    get_CachedIsGrabbed() {
        result := ComCall(4, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a localized string that indicates what happens when the user drops this element as part of a drag-drop operation.
     * @remarks
     * In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffect
     */
    get_CurrentDropEffect() {
        retVal := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached localized string that indicates what happens when the user drops this element as part of a drag-and-drop operation.
     * @remarks
     * In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffect
     */
    get_CachedDropEffect() {
        retVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, retVal, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when this element as part of a drag-and-drop operation.
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the DropEffects property of the dragged element.  This property can contain short strings such as "move", or longer ones such as "insert into Main group".  The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_currentdropeffects
     */
    get_CurrentDropEffects() {
        result := ComCall(7, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached array of localized strings that enumerate the full set of effects that can happen when the user drops this element as part of a drag-and-drop operation.
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation that is initiated with a right-click might display a menu of options for the action that occurs when the element is dropped.  In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out the set of effects that can happen when the grabbed element is dropped, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects">DropEffects</a> property of the dragged element.  This property can contain short strings such as "move", or  longer ones such as "insert into Main group".  The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-get_cacheddropeffects
     */
    get_CachedDropEffects() {
        result := ComCall(8, this, "ptr*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a collection of elements that represent the full set of items that the user is dragging as part of a drag operation.
     * @remarks
     * If the user is dragging multiple items, the items are represented by a single master element with an associated set of grabbed elements.  The master item fires the appropriate events, to avoid having a large set of duplicate events.  The client can query the GrabbedItems property to get the full list of grabbed items.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IAutomationElementArray</a>**</b>
     * 
     * The collection of elements that the user is dragging. This property is <b>NULL</b> or an empty array if only a single item is being dragged. The default value is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcurrentgrabbeditems
     */
    GetCurrentGrabbedItems() {
        result := ComCall(9, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached collection of elements that represent the full set of items that the user is dragging as part of a drag operation.
     * @remarks
     * If the user is dragging multiple items, the items are represented by a single master element with an associated set of grabbed elements.  The master item fires the appropriate events, to avoid having a large set of duplicate events.  The client can query the GrabbedItems property to get the full list of grabbed items.
     * @returns {IUIAutomationElementArray} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelementarray">IAutomationElementArray</a>**</b>
     * 
     * The cached collection of elements that the user is dragging. This property is <b>NULL</b> or an empty array if only a single item is being dragged. The default value is an empty array.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationdragpattern-getcachedgrabbeditems
     */
    GetCachedGrabbedItems() {
        result := ComCall(10, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    Query(iid) {
        if (IUIAutomationDragPattern.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentIsGrabbed := CallbackCreate(GetMethod(implObj, "get_CurrentIsGrabbed"), flags, 2)
        this.vtbl.get_CachedIsGrabbed := CallbackCreate(GetMethod(implObj, "get_CachedIsGrabbed"), flags, 2)
        this.vtbl.get_CurrentDropEffect := CallbackCreate(GetMethod(implObj, "get_CurrentDropEffect"), flags, 2)
        this.vtbl.get_CachedDropEffect := CallbackCreate(GetMethod(implObj, "get_CachedDropEffect"), flags, 2)
        this.vtbl.get_CurrentDropEffects := CallbackCreate(GetMethod(implObj, "get_CurrentDropEffects"), flags, 2)
        this.vtbl.get_CachedDropEffects := CallbackCreate(GetMethod(implObj, "get_CachedDropEffects"), flags, 2)
        this.vtbl.GetCurrentGrabbedItems := CallbackCreate(GetMethod(implObj, "GetCurrentGrabbedItems"), flags, 2)
        this.vtbl.GetCachedGrabbedItems := CallbackCreate(GetMethod(implObj, "GetCachedGrabbedItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentIsGrabbed)
        CallbackFree(this.vtbl.get_CachedIsGrabbed)
        CallbackFree(this.vtbl.get_CurrentDropEffect)
        CallbackFree(this.vtbl.get_CachedDropEffect)
        CallbackFree(this.vtbl.get_CurrentDropEffects)
        CallbackFree(this.vtbl.get_CachedDropEffects)
        CallbackFree(this.vtbl.GetCurrentGrabbedItems)
        CallbackFree(this.vtbl.GetCachedGrabbedItems)
    }
}
