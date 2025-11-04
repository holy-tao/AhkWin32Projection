#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getname
     */
    GetName(Name) {
        result := ComCall(3, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalue
     */
    GetValue(Value) {
        result := ComCall(4, this, "ptr", Value, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getsettingtype
     */
    GetSettingType(Type) {
        TypeMarshal := Type is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getdatatype
     */
    GetDataType(Type) {
        TypeMarshal := Type is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} Data 
     * @param {Pointer<Integer>} DataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getvalueraw
     */
    GetValueRaw(Data, DataSize) {
        DataMarshal := Data is VarRef ? "ptr*" : "ptr"
        DataSizeMarshal := DataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, DataMarshal, Data, DataSizeMarshal, DataSize, "HRESULT")
        return result
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
     * @param {Pointer<BOOL>} ItemHasChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-haschild
     */
    HasChild(ItemHasChild) {
        result := ComCall(10, this, "ptr", ItemHasChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Children 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-children
     */
    Children(Children) {
        result := ComCall(11, this, "ptr*", Children, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<ISettingsItem>} Child 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getchild
     */
    GetChild(Name, Child) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(12, this, "ptr", Name, "ptr*", Child, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getsettingbypath
     */
    GetSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(13, this, "ptr", Path, "ptr*", Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-createsettingbypath
     */
    CreateSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(14, this, "ptr", Path, "ptr*", Setting, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} DataType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getlistkeyinformation
     */
    GetListKeyInformation(KeyName, DataType) {
        DataTypeMarshal := DataType is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "ptr", KeyName, DataTypeMarshal, DataType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} KeyData 
     * @param {Pointer<ISettingsItem>} Child 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-createlistelement
     */
    CreateListElement(KeyData, Child) {
        result := ComCall(17, this, "ptr", KeyData, "ptr*", Child, "HRESULT")
        return result
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
     * @param {Pointer<IItemEnumerator>} Attributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-attributes
     */
    Attributes(Attributes) {
        result := ComCall(19, this, "ptr*", Attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getattribute
     */
    GetAttribute(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(Path) {
        result := ComCall(21, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} RestrictionFacets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestrictionfacets
     */
    GetRestrictionFacets(RestrictionFacets) {
        RestrictionFacetsMarshal := RestrictionFacets is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, RestrictionFacetsMarshal, RestrictionFacets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RestrictionFacet 
     * @param {Pointer<VARIANT>} FacetData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getrestriction
     */
    GetRestriction(RestrictionFacet, FacetData) {
        result := ComCall(23, this, "int", RestrictionFacet, "ptr", FacetData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsitem-getkeyvalue
     */
    GetKeyValue(Value) {
        result := ComCall(24, this, "ptr", Value, "HRESULT")
        return result
    }
}
