#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAutomationCondition.ahk" { IUIAutomationCondition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\UIA_PROPERTY_ID.ahk" { UIA_PROPERTY_ID }
#Import ".\PropertyConditionFlags.ahk" { PropertyConditionFlags }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a condition based on a property value that is used to find UI Automation elements.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationpropertycondition
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationPropertyCondition extends IUIAutomationCondition {
    /**
     * The interface identifier for IUIAutomationPropertyCondition
     * @type {Guid}
     */
    static IID := Guid("{99ebf2cb-5578-4267-9ad4-afd6ea77e94b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationPropertyCondition interfaces
    */
    struct Vtbl extends IUIAutomationCondition.Vtbl {
        get_PropertyId             : IntPtr
        get_PropertyValue          : IntPtr
        get_PropertyConditionFlags : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationPropertyCondition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {UIA_PROPERTY_ID} 
     */
    PropertyId {
        get => this.get_PropertyId()
    }

    /**
     * @type {VARIANT} 
     */
    PropertyValue {
        get => this.get_PropertyValue()
    }

    /**
     * @type {PropertyConditionFlags} 
     */
    PropertyConditionFlags {
        get => this.get_PropertyConditionFlags()
    }

    /**
     * Retrieves the identifier of the property on which this condition is based.
     * @returns {UIA_PROPERTY_ID} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyid
     */
    get_PropertyId() {
        result := ComCall(3, this, "int*", &propertyId := 0, "HRESULT")
        return propertyId
    }

    /**
     * Retrieves the property value that must be matched for the condition to be true.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyvalue
     */
    get_PropertyValue() {
        _propertyValue := VARIANT()
        result := ComCall(4, this, VARIANT.Ptr, _propertyValue, "HRESULT")
        return _propertyValue
    }

    /**
     * Retrieves a set of flags that specify how the condition is applied.
     * @returns {PropertyConditionFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationpropertycondition-get_propertyconditionflags
     */
    get_PropertyConditionFlags() {
        result := ComCall(5, this, "int*", &flags := 0, "HRESULT")
        return flags
    }

    Query(iid) {
        if (IUIAutomationPropertyCondition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PropertyId := CallbackCreate(GetMethod(implObj, "get_PropertyId"), flags, 2)
        this.vtbl.get_PropertyValue := CallbackCreate(GetMethod(implObj, "get_PropertyValue"), flags, 2)
        this.vtbl.get_PropertyConditionFlags := CallbackCreate(GetMethod(implObj, "get_PropertyConditionFlags"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PropertyId)
        CallbackFree(this.vtbl.get_PropertyValue)
        CallbackFree(this.vtbl.get_PropertyConditionFlags)
    }
}
