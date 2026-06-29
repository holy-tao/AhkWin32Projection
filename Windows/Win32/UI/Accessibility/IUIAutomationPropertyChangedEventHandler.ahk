#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Exposes a method to handle Microsoft UI Automation events that occur when a property is changed.
 * @remarks
 * This interface is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler">AddPropertyChangedEventHandler</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationpropertychangedeventhandler
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationPropertyChangedEventHandler extends IUnknown {
    /**
     * The interface identifier for IUIAutomationPropertyChangedEventHandler
     * @type {Guid}
     */
    static IID := Guid("{40cd37d4-c756-4b0c-8c6f-bddfeeb13b50}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationPropertyChangedEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        HandlePropertyChangedEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationPropertyChangedEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Handles a Microsoft UI Automation property-changed event.
     * @remarks
     * This method is implemented by the application to handle events that it has subscribed to by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomation-addpropertychangedeventhandler">AddPropertyChangedEventHandler</a>.
     * 			
     * 
     * Adjusting an event handler from within this method is not supported.
     * @param {IUIAutomationElement} sender Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement">IUIAutomationElement</a>*</b>
     * 
     * A pointer to the element that raised the event.
     * @param {UIA_PROPERTY_ID} propertyId Type: <b>PROPERTYID</b>
     * 
     * The identifier of the property whose value has changed. For a list of property IDs, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-entry-propids">Property Identifiers</a>.
     * @param {VARIANT} newValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a></b>
     * 
     * The new property value.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertychangedeventhandler-handlepropertychangedevent
     */
    HandlePropertyChangedEvent(sender, propertyId, newValue) {
        result := ComCall(3, this, "ptr", sender, UIA_PROPERTY_ID, propertyId, VARIANT, newValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUIAutomationPropertyChangedEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.HandlePropertyChangedEvent := CallbackCreate(GetMethod(implObj, "HandlePropertyChangedEvent"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.HandlePropertyChangedEvent)
    }
}
