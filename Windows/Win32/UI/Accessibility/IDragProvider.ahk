#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Enables a Microsoft UI Automation element to describe itself as an element that can be dragged as part of a drag-and-drop operation.
 * @remarks
 * A provider can implement <b>IDragProvider</b> only on the element being dragged, or it can use an intermediary drag object that implements <b>IDragProvider</b>, in addition to the <b>IDragProvider</b> implementation on the individual element.  The intermediary is responsible for firing all events, which enables the provider to support dragging multiple elements at once, and to describe the multi-element drag operation with a single set of drag properties and events.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-idragprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IDragProvider extends IUnknown {
    /**
     * The interface identifier for IDragProvider
     * @type {Guid}
     */
    static IID := Guid("{6aa7bbbb-7ff9-497d-904f-d20b897929d8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDragProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_IsGrabbed   : IntPtr
        get_DropEffect  : IntPtr
        get_DropEffects : IntPtr
        GetGrabbedItems : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDragProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    IsGrabbed {
        get => this.get_IsGrabbed()
    }

    /**
     * @type {BSTR} 
     */
    DropEffect {
        get => this.get_DropEffect()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    DropEffects {
        get => this.get_DropEffects()
    }

    /**
     * Indicates whether the element has been grabbed as part of a drag-and-drop operation.
     * @remarks
     * If this property changes, the provider must notify clients by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent">UiaRaiseAutomationPropertyChangedEvent</a> and specifying a property identifier of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragIsGrabbedPropertyId</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragDropEffectPropertyId</a>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_isgrabbed
     */
    get_IsGrabbed() {
        result := ComCall(3, this, BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves a localized string that indicates what happens when this element is dropped as part of a drag-drop operation.
     * @remarks
     * In the source-only style of UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.  To find out what effect dropping the dragged element will have, a client can query the <b>DropEffect</b> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".  The string is always localized.
     * 
     * If this property changes, the provider must notify clients by calling <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraiseautomationpropertychangedevent">UiaRaiseAutomationPropertyChangedEvent</a> and specifying a property identifier of <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragIsGrabbedPropertyId</a> or <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_DragDropEffectPropertyId</a>.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect
     */
    get_DropEffect() {
        pRetVal := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pRetVal, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves an array of localized strings that enumerate the full set of effects that can happen when this element is dropped as part of a drag-and-drop operation.
     * @remarks
     * Some drag operations support a set of different drop effects. For example, a drag operation initiated through a right-click might display a menu of options when the element is dropped.   In the source-only style of Microsoft UI Automation drag-and-drop, no elements implement the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingdroptarget">DropTarget</a> pattern.    To find out what effect dropping the dragged element will have, a client can query the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffect">DropEffect</a> property of the dragged element.  This property can be a short string such as "move", or a longer one, such as "insert into Main group".    The strings are always localized.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-get_dropeffects
     */
    get_DropEffects() {
        result := ComCall(5, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Retrieves the collection of elements that are being dragged as part of a drag operation.
     * @remarks
     * If the user is dragging multiple items, the items are represented by a single master element with an associated set of grabbed elements.  The master element raises the appropriate events, to avoid having a large set of duplicate events.  The client can call <b>GetGrabbedItems</b> to retrieve the full list of grabbed items.  The provider should allocate a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> of appropriate length and add the Component Object Model (COM) pointers of the elements that are part of the drag operation.
     * @returns {Pointer<SAFEARRAY>} An array of VT_UNKNOWN pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the elements that are being dragged. This parameter is <b>NULL</b> if only a single item is being dragged.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-idragprovider-getgrabbeditems
     */
    GetGrabbedItems() {
        result := ComCall(6, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IDragProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IsGrabbed := CallbackCreate(GetMethod(implObj, "get_IsGrabbed"), flags, 2)
        this.vtbl.get_DropEffect := CallbackCreate(GetMethod(implObj, "get_DropEffect"), flags, 2)
        this.vtbl.get_DropEffects := CallbackCreate(GetMethod(implObj, "get_DropEffects"), flags, 2)
        this.vtbl.GetGrabbedItems := CallbackCreate(GetMethod(implObj, "GetGrabbedItems"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IsGrabbed)
        CallbackFree(this.vtbl.get_DropEffect)
        CallbackFree(this.vtbl.get_DropEffects)
        CallbackFree(this.vtbl.GetGrabbedItems)
    }
}
