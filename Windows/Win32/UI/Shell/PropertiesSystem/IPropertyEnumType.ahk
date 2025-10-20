#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that extract data from enumeration information. IPropertyEnumType gives access to the enum and enumRange elements in the property schema in a programmatic way at run time.
 * @remarks
 * 
  * For additional information, see <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-enumeratedlist">enumeratedList</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertyenumtype
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertyEnumType extends IUnknown{
    /**
     * The interface identifier for IPropertyEnumType
     * @type {Guid}
     */
    static IID => Guid("{11e1fbf9-2d56-4a6b-8db3-7cd193a471f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} penumtype 
     * @returns {HRESULT} 
     */
    GetEnumType(penumtype) {
        result := ComCall(3, this, "int*", penumtype, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     */
    GetValue(ppropvar) {
        result := ComCall(4, this, "ptr", ppropvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvarMin 
     * @returns {HRESULT} 
     */
    GetRangeMinValue(ppropvarMin) {
        result := ComCall(5, this, "ptr", ppropvarMin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvarSet 
     * @returns {HRESULT} 
     */
    GetRangeSetValue(ppropvarSet) {
        result := ComCall(6, this, "ptr", ppropvarSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDisplay 
     * @returns {HRESULT} 
     */
    GetDisplayText(ppszDisplay) {
        result := ComCall(7, this, "ptr", ppszDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
