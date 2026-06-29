#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\FH_TARGET_PROPERTY_TYPE.ahk" { FH_TARGET_PROPERTY_TYPE }

/**
 * The IFhTarget interface allows client applications to read numeric and string properties of a File History backup target.
 * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nn-fhcfg-ifhtarget
 * @namespace Windows.Win32.Storage.FileHistory
 */
export default struct IFhTarget extends IUnknown {
    /**
     * The interface identifier for IFhTarget
     * @type {Guid}
     */
    static IID := Guid("{d87965fd-2bad-4657-bd3b-9567eb300ced}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFhTarget interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetStringProperty    : IntPtr
        GetNumericalProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFhTarget.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a string property of the File History backup target that is represented by an IFhTarget interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration defines property types for string properties and numeric properties. However, the <b>IFhTarget::GetStringProperty</b> method can only be used to retrieve string properties. Numeric properties must be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty">IFhTarget::GetNumericalProperty</a> method.
     * @param {FH_TARGET_PROPERTY_TYPE} PropertyType Specifies the string property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for the list of possible string property types.
     * @returns {BSTR} This parameter must be <b>NULL</b> on input. On output, it receives a pointer to a string that contains the string property. This string is allocated by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the string when it is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhtarget-getstringproperty
     */
    GetStringProperty(PropertyType) {
        _PropertyValue := BSTR.Owned()
        result := ComCall(3, this, FH_TARGET_PROPERTY_TYPE, PropertyType, BSTR.Ptr, _PropertyValue, "HRESULT")
        return _PropertyValue
    }

    /**
     * Retrieves a numeric property of the File History backup target that is represented by an IFhTarget interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration defines property types for string properties and numeric properties. However, the <b>IFhTarget::GetNumericalProperty</b> method can only be used to retrieve numeric properties. String properties must be retrieved by  calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getstringproperty">IFhTarget::GetStringProperty</a> method.
     * @param {FH_TARGET_PROPERTY_TYPE} PropertyType Specifies the numeric property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for a list of possible numeric properties.
     * @returns {Integer} Receives the value of the numeric property.
     * @see https://learn.microsoft.com/windows/win32/api/fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty
     */
    GetNumericalProperty(PropertyType) {
        result := ComCall(4, this, FH_TARGET_PROPERTY_TYPE, PropertyType, "uint*", &_PropertyValue := 0, "HRESULT")
        return _PropertyValue
    }

    Query(iid) {
        if (IFhTarget.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStringProperty := CallbackCreate(GetMethod(implObj, "GetStringProperty"), flags, 3)
        this.vtbl.GetNumericalProperty := CallbackCreate(GetMethod(implObj, "GetNumericalProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStringProperty)
        CallbackFree(this.vtbl.GetNumericalProperty)
    }
}
