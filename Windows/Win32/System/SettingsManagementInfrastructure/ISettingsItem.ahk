#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IItemEnumerator.ahk
#Include .\ISettingsItem.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Navigates the settings tree, retrieves the metadata for a particular setting, and retrieves or modify its value.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingsitem
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsItem
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bbb-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetValue", "SetValue", "GetSettingType", "GetDataType", "GetValueRaw", "SetValueRaw", "HasChild", "Children", "GetChild", "GetSettingByPath", "CreateSettingByPath", "RemoveSettingByPath", "GetListKeyInformation", "CreateListElement", "RemoveListElement", "Attributes", "GetAttribute", "GetPath", "GetRestrictionFacets", "GetRestriction", "GetKeyValue"]

    /**
     * Gets the name of the item.
     * @returns {BSTR} The name of the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getname
     */
    GetName() {
        Name := BSTR()
        result := ComCall(3, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * Gets the current value from the item.
     * @returns {VARIANT} The value of the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getvalue
     */
    GetValue() {
        Value := VARIANT()
        result := ComCall(4, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Sets the value of an item.
     * @param {Pointer<VARIANT>} Value Variant that contains the value of the item.
     * @returns {HRESULT} This method can return one of these values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDVALUE, WCM_E_INVALIDVALUEFORMAT, or WCM_E_INVALIDDATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the value is not of the correct type for the item, or that the value cannot be coerced to the correct type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_READONLYITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item cannot be written, either because it is a read-only item, or because the namespace was opened in ReadOnly mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-setvalue
     */
    SetValue(Value) {
        result := ComCall(5, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Gets the setting type for the item.
     * @returns {Integer} A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmsettingtype">WcmSettingType</a> value that contains the setting type of the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getsettingtype
     */
    GetSettingType() {
        result := ComCall(6, this, "int*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * Gets the type information for the item.
     * @returns {Integer} A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmdatatype">WcmDataType</a> value that indicates the data type of the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getdatatype
     */
    GetDataType() {
        result := ComCall(7, this, "int*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * Gets the value from the current item as a byte array.
     * @param {Pointer<Pointer<Integer>>} Data An array of BYTE pointers, allocated with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>, of length DataSize.
     * @returns {Integer} The length of the data.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getvalueraw
     */
    GetValueRaw(Data) {
        DataMarshal := Data is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, DataMarshal, Data, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * Sets the value of the current item by supplying data in raw form.
     * @param {Integer} DataType The data type of the item.
     * @param {Pointer<Integer>} Data A byte array that contains the value of the item.
     * @param {Integer} DataSize The size of the byte array.
     * @returns {HRESULT} This method can return one of these values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDVALUE, WCM_E_INVALIDVALUEFORMAT, or WCM_E_INVALIDDATATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the value is not of the correct type for the item, or that the value cannot be coerced to the correct type.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_READONLYITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item cannot be written, either because it is a read-only item, or because the namespace was opened in ReadOnly mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-setvalueraw
     */
    SetValueRaw(DataType, Data, DataSize) {
        DataMarshal := Data is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "int", DataType, DataMarshal, Data, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Determines whether the current item has a child item.
     * @returns {BOOL} <b>True</b> if a child item is present, <b>false</b> otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-haschild
     */
    HasChild() {
        result := ComCall(10, this, "int*", &ItemHasChild := 0, "HRESULT")
        return ItemHasChild
    }

    /**
     * Gets the dictionary of the child items that correspond to this item.
     * @returns {IItemEnumerator} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> interface pointer used to access the children.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-children
     */
    Children() {
        result := ComCall(11, this, "ptr*", &Children := 0, "HRESULT")
        return IItemEnumerator(Children)
    }

    /**
     * Gets the child item that has the specified name.
     * @param {PWSTR} Name The name of the child item.
     * @returns {ISettingsItem} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> object that corresponds to the child item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getchild
     */
    GetChild(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(12, this, "ptr", Name, "ptr*", &Child := 0, "HRESULT")
        return ISettingsItem(Child)
    }

    /**
     * Gets a setting based on the given path.
     * @param {PWSTR} Path Path of the list element or attribute to retrieve. The path is relative to the current setting.
     * @returns {ISettingsItem} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> interface pointer used to access the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getsettingbypath
     */
    GetSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(13, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Creates a setting object specified by the path.
     * @param {PWSTR} Path A pointer to the path.
     * @returns {ISettingsItem} A pointer to the newly created <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-createsettingbypath
     */
    CreateSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(14, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Removes a setting object specified by its path.
     * @param {PWSTR} Path The path of the item to remove. The path is relative to the current item.
     * @returns {HRESULT} This method can return one of these values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_STATENODENOTFOUND </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an attempt to remove an item that does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32 (ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an attempt to remove an element that is not a list element.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_READONLYITEM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item cannot be written, either because  it is a read-only item, or because the namespace was opened in ReadOnly mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_WRONGESCAPESTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path contains an unrecognized XML escape sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDKEY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly specified and references the wrong key for the list item.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-removesettingbypath
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(15, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * Gets the list information for this item.
     * @param {Pointer<BSTR>} KeyName The name of the key.
     * @returns {Integer} A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmdatatype">WcmDataType</a> value that indicates the data type of the item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getlistkeyinformation
     */
    GetListKeyInformation(KeyName) {
        result := ComCall(16, this, "ptr", KeyName, "int*", &DataType := 0, "HRESULT")
        return DataType
    }

    /**
     * Creates a new list element.
     * @param {Pointer<VARIANT>} KeyData The information for the key that defines the identity of the new list item. To determine the  correct value for the key data parameter, consult the information returned from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getlistkeyinformation">ISettingsItem::GetListKeyInformation</a>. The variant obtained from <b>ISettingsItem::GetListKeyInformation</b> should be coercible to the type of the key. If the <b>ISettingsItem::GetListKeyInformation</b> method returns <b>S_FALSE</b>, use a string type for the key data.
     * @returns {ISettingsItem} A pointer to the  newly created <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> list item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-createlistelement
     */
    CreateListElement(KeyData) {
        result := ComCall(17, this, "ptr", KeyData, "ptr*", &Child := 0, "HRESULT")
        return ISettingsItem(Child)
    }

    /**
     * Removes an existing list element of the supplied name.
     * @param {PWSTR} ElementName The name of the element to be removed.
     * @returns {HRESULT} This method can return one of these values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_STATENODENOTFOUND </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an attempt to remove an item that does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item that is not of setting type list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_READONLYITEM </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item cannot be written, either because  it is a read-only item, or because the namespace was opened in ReadOnly mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_WRONGESCAPESTRING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path contains an unrecognized XML escape sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDKEY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly specified and references the wrong key for the list item.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-removelistelement
     */
    RemoveListElement(ElementName) {
        ElementName := ElementName is String ? StrPtr(ElementName) : ElementName

        result := ComCall(18, this, "ptr", ElementName, "HRESULT")
        return result
    }

    /**
     * Gets the dictionary of attributes.
     * @returns {IItemEnumerator} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that represents the dictionary of attributes.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-attributes
     */
    Attributes() {
        result := ComCall(19, this, "ptr*", &Attributes := 0, "HRESULT")
        return IItemEnumerator(Attributes)
    }

    /**
     * Gets the value of an attribute by specifying its name.
     * @param {PWSTR} Name The name of the attribute.
     * @returns {VARIANT} The value of  the attribute.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getattribute
     */
    GetAttribute(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        Value := VARIANT()
        result := ComCall(20, this, "ptr", Name, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * Gets the path for the item.
     * @returns {BSTR} The path to the current setting. This path should be handled as opaque, and should be used only for invocations of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-createsettingbypath">CreateSettingByPath</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-getsettingbypath">GetSettingByPath</a>, or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsitem-removesettingbypath">RemoveSettingByPath</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getpath
     */
    GetPath() {
        Path := BSTR()
        result := ComCall(21, this, "ptr", Path, "HRESULT")
        return Path
    }

    /**
     * Gets the restrictions defined for this item.
     * @returns {Integer} A bitmask of  the <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmrestrictionfacets">WcmRestrictionFacets</a> values that are defined for this item.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getrestrictionfacets
     */
    GetRestrictionFacets() {
        result := ComCall(22, this, "int*", &RestrictionFacets := 0, "HRESULT")
        return RestrictionFacets
    }

    /**
     * Gets the information for a given restriction.
     * @param {Integer} RestrictionFacet A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmrestrictionfacets">WcmRestrictionFacets</a> value that indicates the type of restriction facet.
     * @returns {VARIANT} A pointer to the facet data.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getrestriction
     */
    GetRestriction(RestrictionFacet) {
        FacetData := VARIANT()
        result := ComCall(23, this, "int", RestrictionFacet, "ptr", FacetData, "HRESULT")
        return FacetData
    }

    /**
     * Extracts key values for any list that already exists in the image, for example, DNS, http settings, and user account information.
     * @returns {VARIANT} The value of the key for the list element. The type of the value returned is the actual type of the key. For example, the type is a string in the case of a dynamically keyed list. The value is unescaped appropriately to reverse the changes made by SMI for the purpose of storing it. The VARIANT type is overwritten with the correct type if the predefined VARIANT type is incorrect.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsitem-getkeyvalue
     */
    GetKeyValue() {
        Value := VARIANT()
        result := ComCall(24, this, "ptr", Value, "HRESULT")
        return Value
    }
}
