#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IFhTarget interface allows client applications to read numeric and string properties of a File History backup target.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/nn-fhcfg-ifhtarget
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class IFhTarget extends IUnknown{
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
     * 
     * @param {Integer} PropertyType 
     * @param {Pointer<BSTR>} PropertyValue 
     * @returns {HRESULT} 
     */
    GetStringProperty(PropertyType, PropertyValue) {
        result := ComCall(3, this, "int", PropertyType, "ptr", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} PropertyType 
     * @param {Pointer<UInt64>} PropertyValue 
     * @returns {HRESULT} 
     */
    GetNumericalProperty(PropertyType, PropertyValue) {
        result := ComCall(4, this, "int", PropertyType, "uint*", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
