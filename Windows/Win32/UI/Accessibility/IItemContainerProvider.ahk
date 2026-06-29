#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Provides access to controls that act as containers of other controls, such as a virtual list-view.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingitemcontainer">ItemContainer</a> control pattern allows a container object to efficiently lookup an item by a 
 * 		specified automation element property, such as Name, AutomationId, or IsSelected state. While this control 
 * 		pattern is introduced with a view to being used by virtualized containers, it can be implemented by any container 
 * 		that provides name lookup, independently of whether that container uses virtualization.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-iitemcontainerprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IItemContainerProvider extends IUnknown {
    /**
     * The interface identifier for IItemContainerProvider
     * @type {Guid}
     */
    static IID := Guid("{e747770b-39ce-4382-ab30-d8fb3f336f24}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IItemContainerProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindItemByProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IItemContainerProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an element within a containing element, based on a specified property value. (IItemContainerProvider.FindItemByProperty)
     * @remarks
     * For virtual lists, the element returned may be a placeholder. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize">IVirtualizedItemProvider::Realize</a> can then be used to make the item fully available.
     * 
     * The method returns E_INVALIDARG if searching by the specified property is not supported. Most containers should support <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_NamePropertyId</a> and, if appropriate, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_AutomationIdPropertyId</a> and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_SelectionItemIsSelectedPropertyId</a>.
     * 
     * If <i>propertyId</i> is 0, all items are a match. This value can be  used
     * with <i>pStartAfter</i> equalling <b>NULL</b> to get the first item, and then to get successive
     * items. In this case, <i>value</i> should be VT_EMPTY.
     * @param {IRawElementProviderSimple} pStartAfter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The UI Automation provider of the element after which the search begins, or <b>NULL</b> to search all elements.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value of the property.
     * @returns {IRawElementProviderSimple} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>**</b>
     * 
     * Receives a pointer to the UI Automation provider of the element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iitemcontainerprovider-finditembyproperty
     */
    FindItemByProperty(pStartAfter, propertyId, value) {
        result := ComCall(3, this, "ptr", pStartAfter, UIA_PROPERTY_ID, propertyId, VARIANT, value, "ptr*", &pFound := 0, "HRESULT")
        return IRawElementProviderSimple(pFound)
    }

    Query(iid) {
        if (IItemContainerProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FindItemByProperty := CallbackCreate(GetMethod(implObj, "FindItemByProperty"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FindItemByProperty)
    }
}
