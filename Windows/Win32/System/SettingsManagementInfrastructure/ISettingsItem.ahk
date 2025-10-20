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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    GetName(Name) {
        result := ComCall(3, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetValue(Value) {
        result := ComCall(4, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    SetValue(Value) {
        result := ComCall(5, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Type 
     * @returns {HRESULT} 
     */
    GetSettingType(Type) {
        result := ComCall(6, this, "int*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} Type 
     * @returns {HRESULT} 
     */
    GetDataType(Type) {
        result := ComCall(7, this, "int*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Data 
     * @param {Pointer<UInt32>} DataSize 
     * @returns {HRESULT} 
     */
    GetValueRaw(Data, DataSize) {
        result := ComCall(8, this, "char*", Data, "uint*", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} DataType 
     * @param {Pointer<Byte>} Data 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    SetValueRaw(DataType, Data, DataSize) {
        result := ComCall(9, this, "int", DataType, "char*", Data, "uint", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} ItemHasChild 
     * @returns {HRESULT} 
     */
    HasChild(ItemHasChild) {
        result := ComCall(10, this, "ptr", ItemHasChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Children 
     * @returns {HRESULT} 
     */
    Children(Children) {
        result := ComCall(11, this, "ptr", Children, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<ISettingsItem>} Child 
     * @returns {HRESULT} 
     */
    GetChild(Name, Child) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(12, this, "ptr", Name, "ptr", Child, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     */
    GetSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(13, this, "ptr", Path, "ptr", Setting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     */
    CreateSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(14, this, "ptr", Path, "ptr", Setting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(15, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} KeyName 
     * @param {Pointer<Int32>} DataType 
     * @returns {HRESULT} 
     */
    GetListKeyInformation(KeyName, DataType) {
        result := ComCall(16, this, "ptr", KeyName, "int*", DataType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} KeyData 
     * @param {Pointer<ISettingsItem>} Child 
     * @returns {HRESULT} 
     */
    CreateListElement(KeyData, Child) {
        result := ComCall(17, this, "ptr", KeyData, "ptr", Child, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} ElementName 
     * @returns {HRESULT} 
     */
    RemoveListElement(ElementName) {
        ElementName := ElementName is String ? StrPtr(ElementName) : ElementName

        result := ComCall(18, this, "ptr", ElementName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Attributes 
     * @returns {HRESULT} 
     */
    Attributes(Attributes) {
        result := ComCall(19, this, "ptr", Attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetAttribute(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} Path 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(Path) {
        result := ComCall(21, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} RestrictionFacets 
     * @returns {HRESULT} 
     */
    GetRestrictionFacets(RestrictionFacets) {
        result := ComCall(22, this, "int*", RestrictionFacets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RestrictionFacet 
     * @param {Pointer<VARIANT>} FacetData 
     * @returns {HRESULT} 
     */
    GetRestriction(RestrictionFacet, FacetData) {
        result := ComCall(23, this, "int", RestrictionFacet, "ptr", FacetData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetKeyValue(Value) {
        result := ComCall(24, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
