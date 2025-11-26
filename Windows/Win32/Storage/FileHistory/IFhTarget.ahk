#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhTarget interface allows client applications to read numeric and string properties of a File History backup target.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhtarget
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhTarget extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFhTarget
     * @type {Guid}
     */
    static IID => Guid("{d87965fd-2bad-4657-bd3b-9567eb300ced}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringProperty", "GetNumericalProperty"]

    /**
     * Retrieves a string property of the File History backup target that is represented by an IFhTarget interface.
     * @param {Integer} PropertyType Specifies the string property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for the list of possible string property types.
     * @returns {BSTR} This parameter must be <b>NULL</b> on input. On output, it receives a pointer to a string that contains the string property. This string is allocated by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. You must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the string when it is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhtarget-getstringproperty
     */
    GetStringProperty(PropertyType) {
        PropertyValue := BSTR()
        result := ComCall(3, this, "int", PropertyType, "ptr", PropertyValue, "HRESULT")
        return PropertyValue
    }

    /**
     * Retrieves a numeric property of the File History backup target that is represented by an IFhTarget interface.
     * @param {Integer} PropertyType Specifies the numeric property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for a list of possible numeric properties.
     * @returns {Integer} Receives the value of the numeric property.
     * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty
     */
    GetNumericalProperty(PropertyType) {
        result := ComCall(4, this, "int", PropertyType, "uint*", &PropertyValue := 0, "HRESULT")
        return PropertyValue
    }
}
