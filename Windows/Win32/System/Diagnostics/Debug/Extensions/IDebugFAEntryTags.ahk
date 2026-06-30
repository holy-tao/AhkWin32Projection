#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\FA_ENTRY_TYPE.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk
#Include ..\..\..\..\Foundation\BOOL.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk
#Include .\DEBUG_FLR_PARAM_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugFAEntryTags extends Win32ComInterface {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType", "GetProperties", "SetProperties", "GetTagByName", "IsValidTagToSet"]

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {FA_ENTRY_TYPE} 
     */
    GetType(Tag) {
        result := ComCall(0, this, "int", Tag, "int")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {FA_ENTRY_TYPE} EntryType 
     * @returns {HRESULT} 
     */
    SetType(Tag, EntryType) {
        result := ComCall(1, this, "int", Tag, "int", EntryType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {Integer} Name 
     * @param {Pointer<Integer>} NameSize 
     * @param {Integer} Description 
     * @param {Pointer<Integer>} DescSize 
     * @returns {Integer} 
     */
    GetProperties(Tag, Name, NameSize, Description, DescSize) {
        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        DescSizeMarshal := DescSize is VarRef ? "uint*" : "ptr"

        result := ComCall(2, this, "int", Tag, "ptr", Name, NameSizeMarshal, NameSize, "ptr", Description, DescSizeMarshal, DescSize, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {PSTR} Name 
     * @param {PSTR} Description 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetProperties(Tag, Name, Description, Flags) {
        Name := Name is String ? StrPtr(Name) : Name
        Description := Description is String ? StrPtr(Description) : Description

        result := ComCall(3, this, "int", Tag, "ptr", Name, "ptr", Description, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} PluginId 
     * @param {PSTR} TagName 
     * @returns {DEBUG_FLR_PARAM_TYPE} 
     */
    GetTagByName(PluginId, TagName) {
        PluginId := PluginId is String ? StrPtr(PluginId) : PluginId
        TagName := TagName is String ? StrPtr(TagName) : TagName

        result := ComCall(4, this, "ptr", PluginId, "ptr", TagName, "int*", &Tag := 0, "HRESULT")
        return Tag
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {BOOL} 
     */
    IsValidTagToSet(Tag) {
        result := ComCall(5, this, "int", Tag, "int")
        return result
    }
}
