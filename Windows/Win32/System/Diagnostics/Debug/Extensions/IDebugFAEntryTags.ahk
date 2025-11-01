#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugFAEntryTags extends Win32ComInterface{

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
     * @param {Integer} Tag 
     * @returns {Integer} 
     */
    GetType(Tag) {
        result := ComCall(0, this, "int", Tag, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Integer} EntryType 
     * @returns {HRESULT} 
     */
    SetType(Tag, EntryType) {
        result := ComCall(1, this, "int", Tag, "int", EntryType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer} Name 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer} Description 
     * @param {Pointer<Integer>} DescSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetProperties(Tag, Name, NameSize, Description, DescSize, Flags) {
        result := ComCall(2, this, "int", Tag, "ptr", Name, "uint*", NameSize, "ptr", Description, "uint*", DescSize, "uint*", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
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
     * @param {Pointer<Integer>} Tag 
     * @returns {HRESULT} 
     */
    GetTagByName(PluginId, TagName, Tag) {
        PluginId := PluginId is String ? StrPtr(PluginId) : PluginId
        TagName := TagName is String ? StrPtr(TagName) : TagName

        result := ComCall(4, this, "ptr", PluginId, "ptr", TagName, "int*", Tag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @returns {BOOL} 
     */
    IsValidTagToSet(Tag) {
        result := ComCall(5, this, "int", Tag, "int")
        return result
    }
}
