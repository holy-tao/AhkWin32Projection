#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugFAEntryTags extends Win32ComInterface{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

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
        result := ComCall(1, this, "int", Tag, "int", EntryType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Tag 
     * @param {Pointer} Name 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer} Description 
     * @param {Pointer<UInt32>} DescSize 
     * @param {Pointer<UInt32>} Flags 
     * @returns {HRESULT} 
     */
    GetProperties(Tag, Name, NameSize, Description, DescSize, Flags) {
        result := ComCall(2, this, "int", Tag, "ptr", Name, "uint*", NameSize, "ptr", Description, "uint*", DescSize, "uint*", Flags, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(3, this, "int", Tag, "ptr", Name, "ptr", Description, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} PluginId 
     * @param {PSTR} TagName 
     * @param {Pointer<Int32>} Tag 
     * @returns {HRESULT} 
     */
    GetTagByName(PluginId, TagName, Tag) {
        result := ComCall(4, this, "ptr", PluginId, "ptr", TagName, "int*", Tag, "int")
        if(result != 0)
            throw OSError(result)

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
