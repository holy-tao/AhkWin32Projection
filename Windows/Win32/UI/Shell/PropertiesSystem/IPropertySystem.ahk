#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that get property descriptions, register and unregister property schemas, enumerate property descriptions, and format property values in a type-strict way.
 * @remarks
 * 
 * Many of the exported APIs (such as <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nf-propsys-psgetpropertydescription">PSGetPropertyDescription</a>) are simply wrappers around the <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertysystem">IPropertySystem</a> methods. If your code calls a lot of these helper APIs in sequence, it may be worthwhile to instantiate a single <b>IPropertySystem</b> object, and call the methods directly, rather than calling the helper APIs. (To improve the performance, the helper APIs do obtain a cached instance of the <b>IPropertySystem</b> object.)
 * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/nn-propsys-ipropertysystem
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertySystem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySystem
     * @type {Guid}
     */
    static IID => Guid("{ca724e8a-c3e6-442b-88a4-6fb0db8035a3}")

    /**
     * The class identifier for PropertySystem
     * @type {Guid}
     */
    static CLSID => Guid("{b8967f85-58ae-4f46-9fb2-5d7904798f4b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyDescription", "GetPropertyDescriptionByName", "GetPropertyDescriptionListFromString", "EnumeratePropertyDescriptions", "FormatForDisplay", "FormatForDisplayAlloc", "RegisterPropertySchema", "UnregisterPropertySchema", "RefreshPropertySchema"]

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescription, to obtain the property description for a given PROPERTYKEY.
     * @param {Pointer<PROPERTYKEY>} propkey Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the desired property key. See <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-getpropertydescription
     */
    GetPropertyDescription(propkey, riid) {
        result := ComCall(3, this, "ptr", propkey, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescription, to obtain the property description for a given canonical name.
     * @param {PWSTR} pszCanonicalName Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that identifies the property.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescription">IPropertyDescription</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-getpropertydescriptionbyname
     */
    GetPropertyDescriptionByName(pszCanonicalName, riid) {
        pszCanonicalName := pszCanonicalName is String ? StrPtr(pszCanonicalName) : pszCanonicalName

        result := ComCall(4, this, "ptr", pszCanonicalName, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescriptionList, to obtain an ordered collection of property descriptions, based on the provided string.
     * @param {PWSTR} pszPropList Type: <b>LPCWSTR</b>
     * 
     * A pointer to a string that identifies the property list.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-getpropertydescriptionlistfromstring
     */
    GetPropertyDescriptionListFromString(pszPropList, riid) {
        pszPropList := pszPropList is String ? StrPtr(pszPropList) : pszPropList

        result := ComCall(5, this, "ptr", pszPropList, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets an instance of the subsystem object that implements IPropertyDescriptionList, to obtain either the entire or a partial list of property descriptions in the system.
     * @param {Integer} filterOn Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a></b>
     * 
     * The list to return. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_enumfilter">PROPDESC_ENUMFILTER</a>. Valid values for this method are 0 through 4.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/propsys/nn-propsys-ipropertydescriptionlist">IPropertyDescriptionList</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-enumeratepropertydescriptions
     */
    EnumeratePropertyDescriptions(filterOn, riid) {
        result := ComCall(6, this, "int", filterOn, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Gets a formatted, Unicode string representation of a property value.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the requested <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">property key</a>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure containing the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * The format of the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a> for possible values.
     * @param {PWSTR} pszText Type: <b>LPWSTR</b>
     * 
     * Receives the formatted value as a null-terminated, Unicode string. The calling application must allocate memory for the buffer.
     * @param {Integer} cchText Type: <b>DWORD</b>
     * 
     * The length of the buffer at  <i>pszText</i> in <b>WCHAR</b><b>s</b>, including the terminating <b>NULL</b>. The maximum size is 0x8000 (32K).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Formatted string is created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Formatted string is not created. S_FALSE indicates that the empty string resulted from a VT_EMPTY.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory allocation failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-formatfordisplay
     */
    FormatForDisplay(key, propvar, pdff, pszText, cchText) {
        pszText := pszText is String ? StrPtr(pszText) : pszText

        result := ComCall(7, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr", pszText, "uint", cchText, "HRESULT")
        return result
    }

    /**
     * Gets a string representation of a property value to an allocated memory buffer.
     * @param {Pointer<PROPERTYKEY>} key Type: <b>REFPROPERTYKEY</b>
     * 
     * A reference to the desired <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ns-wtypes-propertykey">PROPERTYKEY</a>.
     * @param {Pointer<PROPVARIANT>} propvar Type: <b>REFPROPVARIANT</b>
     * 
     * A reference to a <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the type and value of the property.
     * @param {Integer} pdff Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a></b>
     * 
     * The format of the property string. See <a href="https://docs.microsoft.com/windows/desktop/api/propsys/ne-propsys-propdesc_format_flags">PROPDESC_FORMAT_FLAGS</a>.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * When this method returns, contains a pointer to the formatted value as a null-terminated, Unicode string.
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-formatfordisplayalloc
     */
    FormatForDisplayAlloc(key, propvar, pdff) {
        result := ComCall(8, this, "ptr", key, "ptr", propvar, "int", pdff, "ptr*", &ppszDisplay := 0, "HRESULT")
        return ppszDisplay
    }

    /**
     * Informs the schema subsystem of the addition of a property description schema file.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file path for the .propdesc file on the local machine.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates schema is registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INPLACE_S_TRUNCATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates one or more of the property descriptions in the schema was not registered.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-registerpropertyschema
     */
    RegisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Informs the schema subsystem of the removal of a property description schema (.propdesc) file, using a file path to the .propdesc file on the local machine.
     * @param {PWSTR} pszPath Type: <b>LPCWSTR</b>
     * 
     * Pointer to the file path for the .propdesc file on the local machine.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates schema is unregistered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-unregisterpropertyschema
     */
    UnregisterPropertySchema(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Not supported.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates schema files reloaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates calling context does not have proper privileges.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//propsys/nf-propsys-ipropertysystem-refreshpropertyschema
     */
    RefreshPropertySchema() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
