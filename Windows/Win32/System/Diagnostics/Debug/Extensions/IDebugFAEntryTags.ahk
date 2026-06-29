#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DEBUG_FLR_PARAM_TYPE.ahk" { DEBUG_FLR_PARAM_TYPE }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FA_ENTRY_TYPE.ahk" { FA_ENTRY_TYPE }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugFAEntryTags extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugFAEntryTags interfaces
    */
    struct Vtbl {
        GetType         : IntPtr
        SetType         : IntPtr
        GetProperties   : IntPtr
        SetProperties   : IntPtr
        GetTagByName    : IntPtr
        IsValidTagToSet : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugFAEntryTags.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @returns {FA_ENTRY_TYPE} 
     */
    GetType(Tag) {
        result := ComCall(0, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY_TYPE)
        return result
    }

    /**
     * 
     * @param {DEBUG_FLR_PARAM_TYPE} Tag 
     * @param {FA_ENTRY_TYPE} EntryType 
     * @returns {HRESULT} 
     */
    SetType(Tag, EntryType) {
        result := ComCall(1, this, DEBUG_FLR_PARAM_TYPE, Tag, FA_ENTRY_TYPE, EntryType, "HRESULT")
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

        result := ComCall(2, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Name, NameSizeMarshal, NameSize, "ptr", Description, DescSizeMarshal, DescSize, "uint*", &Flags := 0, "HRESULT")
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

        result := ComCall(3, this, DEBUG_FLR_PARAM_TYPE, Tag, "ptr", Name, "ptr", Description, "uint", Flags, "HRESULT")
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
        result := ComCall(5, this, DEBUG_FLR_PARAM_TYPE, Tag, BOOL)
        return result
    }

    Query(iid) {
        if (IDebugFAEntryTags.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
