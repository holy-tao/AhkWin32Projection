#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhTarget interface allows client applications to read numeric and string properties of a File History backup target.
 * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nn-fhcfg-ifhtarget
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
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration defines property types for string properties and numeric properties. However, the <b>IFhTarget::GetStringProperty</b> method can only be used to retrieve string properties. Numeric properties must be retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty">IFhTarget::GetNumericalProperty</a> method.
     * @param {Integer} PropertyType Specifies the string property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for the list of possible string property types.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhtarget-getstringproperty
     */
    GetStringProperty(PropertyType) {
        PropertyValue_ := BSTR()
        result := ComCall(3, this, "int", PropertyType, "ptr", PropertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyValue_
    }

    /**
     * Retrieves a numeric property of the File History backup target that is represented by an IFhTarget interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration defines property types for string properties and numeric properties. However, the <b>IFhTarget::GetNumericalProperty</b> method can only be used to retrieve numeric properties. String properties must be retrieved by  calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhtarget-getstringproperty">IFhTarget::GetStringProperty</a> method.
     * @param {Integer} PropertyType Specifies the numeric property. See the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/ne-fhcfg-fh_target_property_type">FH_TARGET_PROPERTY_TYPE</a> enumeration for a list of possible numeric properties.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fhcfg/nf-fhcfg-ifhtarget-getnumericalproperty
     */
    GetNumericalProperty(PropertyType) {
        result := ComCall(4, this, "int", PropertyType, "uint*", &PropertyValue_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PropertyValue_
    }
}
