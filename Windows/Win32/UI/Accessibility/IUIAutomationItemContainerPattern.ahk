#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes a method that retrieves an item from a container, such as a virtual list.
 * @remarks
 * This interface is not limited to use by virtualized containers. Any container that can implement efficient name lookup can support this <i>control pattern</i>, enabling clients to look up names more quickly than by using methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst">FindFirst</a>, which must traverse the Microsoft UI Automation tree.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationitemcontainerpattern
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationItemContainerPattern extends IUnknown {
    /**
     * The interface identifier for IUIAutomationItemContainerPattern
     * @type {Guid}
     */
    static IID := Guid("{c690fdb2-27a8-423c-812d-429773c9084e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationItemContainerPattern interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FindItemByProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationItemContainerPattern.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an element within a containing element, based on a specified property value. (IUIAutomationItemContainerPattern.FindItemByProperty)
     * @remarks
     * The provider may return an actual <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a> interface or a placeholder if the matching element is virtualized.
     *         
     * 
     * This method returns E_INVALIDARG if the property requested is not one that the container supports searching over. It is expected that most containers will support Name property, and if appropriate for the container, AutomationId and IsSelected.
     *         
     * 
     * This method can be slow, because it may need to traverse multiple objects to find a matching one. When used in a loop to return multiple items, no specific order is defined so long as each item is returned only once (that is, the loop should terminate). This method is also item-centric, not UI-centric, so items with multiple UI representations need to be hit only once.
     *         
     * 
     * When the <i>propertyId</i> parameter is specified as 0 (zero), the provider is expected to return the next item after <i>pStartAfter</i>. If <i>pStartAfter</i> is specified as <b>NULL</b> with a <i>propertyId</i> of 0, the provider should return the first item in the container. When <i>propertyId</i> is specified as 0, the <i>value</i> parameter should be VT_EMPTY.
     * @param {IUIAutomationElement} pStartAfter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element after which the search begins, or <b>NULL</b> to search all elements.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The property identifier. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The property value.
     * @returns {IUIAutomationElement} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>**</b>
     * 
     * Receives a pointer to the matching element.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationitemcontainerpattern-finditembyproperty
     */
    FindItemByProperty(pStartAfter, propertyId, value) {
        result := ComCall(3, this, "ptr", pStartAfter, UIA_PROPERTY_ID, propertyId, VARIANT, value, "ptr*", &pFound := 0, "HRESULT")
        return IUIAutomationElement(pFound)
    }

    Query(iid) {
        if (IUIAutomationItemContainerPattern.IID.Equals(iid)) {
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
