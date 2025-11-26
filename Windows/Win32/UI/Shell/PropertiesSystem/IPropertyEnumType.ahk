#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
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
     * Gets an enumeration type from an enumeration information structure.
     * @returns {Integer} Type: <b>PROPENUMTYPE*</b>
     * 
     * When this method returns, contains a pointer to one of the values listed below that indicate the enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtype-getenumtype
     */
    GetEnumType() {
        result := ComCall(3, this, "int*", &penumtype := 0, "HRESULT")
        return penumtype
    }

    /**
     * Gets a value from an enumeration information structure.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the property value.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtype-getvalue
     */
    GetValue() {
        ppropvar := PROPVARIANT()
        result := ComCall(4, this, "ptr", ppropvar, "HRESULT")
        return ppropvar
    }

    /**
     * Gets a minimum value from an enumeration information structure.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the minimum value.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtype-getrangeminvalue
     */
    GetRangeMinValue() {
        ppropvarMin := PROPVARIANT()
        result := ComCall(5, this, "ptr", ppropvarMin, "HRESULT")
        return ppropvarMin
    }

    /**
     * Gets a set value from an enumeration information structure.
     * @returns {PROPVARIANT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * When this method returns, contains a pointer to the set value.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtype-getrangesetvalue
     */
    GetRangeSetValue() {
        ppropvarSet := PROPVARIANT()
        result := ComCall(6, this, "ptr", ppropvarSet, "HRESULT")
        return ppropvarSet
    }

    /**
     * Gets display text from an enumeration information structure.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains the address of a pointer to a null-terminated Unicode string that contains the display text.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertyenumtype-getdisplaytext
     */
    GetDisplayText() {
        result := ComCall(7, this, "ptr*", &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
    }
}
