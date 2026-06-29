#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\PROPENUMTYPE.ahk" { PROPENUMTYPE }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that extract data from enumeration information. IPropertyEnumType gives access to the enum and enumRange elements in the property schema in a programmatic way at run time.
 * @remarks
 * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
 * @see https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertyenumtype
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 */
export default struct IPropertyEnumType extends IUnknown {
    /**
     * The interface identifier for IPropertyEnumType
     * @type {Guid}
     */
    static IID := Guid("{11e1fbf9-2d56-4a6b-8db3-7cd193a471f2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPropertyEnumType interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetEnumType      : IntPtr
        GetValue         : IntPtr
        GetRangeMinValue : IntPtr
        GetRangeSetValue : IntPtr
        GetDisplayText   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPropertyEnumType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets an enumeration type from an enumeration information structure.
     * @remarks
     * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
     * @returns {PROPENUMTYPE} Type: <b>PROPENUMTYPE*</b>
     * 
     * When this method returns, contains a pointer to one of the values listed below that indicate the enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getenumtype
     */
    GetEnumType() {
        result := ComCall(3, this, "int*", &penumtype := 0, "HRESULT")
        return penumtype
    }

    /**
     * Gets a value from an enumeration information structure.
     * @remarks
     * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the property value.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getvalue
     */
    GetValue() {
        ppropvar := PROPVARIANT()
        result := ComCall(4, this, PROPVARIANT.Ptr, ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Gets a minimum value from an enumeration information structure.
     * @remarks
     * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the minimum value.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getrangeminvalue
     */
    GetRangeMinValue() {
        ppropvarMin := PROPVARIANT()
        result := ComCall(5, this, PROPVARIANT.Ptr, ppropvarMin, "HRESULT")
        return ppropvarMin
    }

    /**
     * Gets a set value from an enumeration information structure.
     * @remarks
     * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the set value.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getrangesetvalue
     */
    GetRangeSetValue() {
        ppropvarSet := PROPVARIANT()
        result := ComCall(6, this, PROPVARIANT.Ptr, ppropvarSet, "HRESULT")
        return ppropvarSet
    }

    /**
     * Gets display text from an enumeration information structure.
     * @remarks
     * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode string that contains the display text.
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getdisplaytext
     */
    GetDisplayText() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
    }

    Query(iid) {
        if (IPropertyEnumType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetEnumType := CallbackCreate(GetMethod(implObj, "GetEnumType"), flags, 2)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 2)
        this.vtbl.GetRangeMinValue := CallbackCreate(GetMethod(implObj, "GetRangeMinValue"), flags, 2)
        this.vtbl.GetRangeSetValue := CallbackCreate(GetMethod(implObj, "GetRangeSetValue"), flags, 2)
        this.vtbl.GetDisplayText := CallbackCreate(GetMethod(implObj, "GetDisplayText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetEnumType)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.GetRangeMinValue)
        CallbackFree(this.vtbl.GetRangeSetValue)
        CallbackFree(this.vtbl.GetDisplayText)
    }
}
