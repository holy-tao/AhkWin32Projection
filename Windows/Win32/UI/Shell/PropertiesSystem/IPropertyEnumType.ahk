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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnumType", "GetValue", "GetRangeMinValue", "GetRangeSetValue", "GetDisplayText"]

    /**
     * 
     * @param {Pointer<Integer>} penumtype 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getenumtype
     */
    GetEnumType(penumtype) {
        result := ComCall(3, this, "int*", penumtype, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getvalue
     */
    GetValue(ppropvar) {
        result := ComCall(4, this, "ptr", ppropvar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvarMin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getrangeminvalue
     */
    GetRangeMinValue(ppropvarMin) {
        result := ComCall(5, this, "ptr", ppropvarMin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppropvarSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getrangesetvalue
     */
    GetRangeSetValue(ppropvarSet) {
        result := ComCall(6, this, "ptr", ppropvarSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/propsys/nf-propsys-ipropertyenumtype-getdisplaytext
     */
    GetDisplayText(ppszDisplay) {
        result := ComCall(7, this, "ptr", ppszDisplay, "HRESULT")
        return result
    }
}
