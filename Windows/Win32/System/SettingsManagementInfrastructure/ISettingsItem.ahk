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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getname
     */
    GetName() {
        Name := BSTR()
        result := ComCall(3, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalue
     */
    GetValue() {
        Value := VARIANT()
        result := ComCall(4, this, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-setvalue
     */
    SetValue(Value) {
        result := ComCall(5, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getsettingtype
     */
    GetSettingType() {
        result := ComCall(6, this, "int*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getdatatype
     */
    GetDataType() {
        result := ComCall(7, this, "int*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} Data 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalueraw
     */
    GetValueRaw(Data) {
        DataMarshal := Data is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, DataMarshal, Data, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} DataType 
     * @param {Pointer<Integer>} Data 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-setvalueraw
     */
    SetValueRaw(DataType, Data, DataSize) {
        DataMarshal := Data is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "int", DataType, DataMarshal, Data, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-haschild
     */
    HasChild() {
        result := ComCall(10, this, "int*", &ItemHasChild := 0, "HRESULT")
        return ItemHasChild
    }

    /**
     * 
     * @returns {IItemEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-children
     */
    Children() {
        result := ComCall(11, this, "ptr*", &Children := 0, "HRESULT")
        return IItemEnumerator(Children)
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {ISettingsItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getchild
     */
    GetChild(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(12, this, "ptr", Name, "ptr*", &Child := 0, "HRESULT")
        return ISettingsItem(Child)
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {ISettingsItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getsettingbypath
     */
    GetSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(13, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {ISettingsItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-createsettingbypath
     */
    CreateSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(14, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-removesettingbypath
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(15, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} KeyName 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getlistkeyinformation
     */
    GetListKeyInformation(KeyName) {
        result := ComCall(16, this, "ptr", KeyName, "int*", &DataType := 0, "HRESULT")
        return DataType
    }

    /**
     * 
     * @param {Pointer<VARIANT>} KeyData 
     * @returns {ISettingsItem} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-createlistelement
     */
    CreateListElement(KeyData) {
        result := ComCall(17, this, "ptr", KeyData, "ptr*", &Child := 0, "HRESULT")
        return ISettingsItem(Child)
    }

    /**
     * 
     * @param {PWSTR} ElementName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-removelistelement
     */
    RemoveListElement(ElementName) {
        ElementName := ElementName is String ? StrPtr(ElementName) : ElementName

        result := ComCall(18, this, "ptr", ElementName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IItemEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-attributes
     */
    Attributes() {
        result := ComCall(19, this, "ptr*", &Attributes := 0, "HRESULT")
        return IItemEnumerator(Attributes)
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getattribute
     */
    GetAttribute(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        Value := VARIANT()
        result := ComCall(20, this, "ptr", Name, "ptr", Value, "HRESULT")
        return Value
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath() {
        Path := BSTR()
        result := ComCall(21, this, "ptr", Path, "HRESULT")
        return Path
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestrictionfacets
     */
    GetRestrictionFacets() {
        result := ComCall(22, this, "int*", &RestrictionFacets := 0, "HRESULT")
        return RestrictionFacets
    }

    /**
     * 
     * @param {Integer} RestrictionFacet 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestriction
     */
    GetRestriction(RestrictionFacet) {
        FacetData := VARIANT()
        result := ComCall(23, this, "int", RestrictionFacet, "ptr", FacetData, "HRESULT")
        return FacetData
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getkeyvalue
     */
    GetKeyValue() {
        Value := VARIANT()
        result := ComCall(24, this, "ptr", Value, "HRESULT")
        return Value
    }
}
