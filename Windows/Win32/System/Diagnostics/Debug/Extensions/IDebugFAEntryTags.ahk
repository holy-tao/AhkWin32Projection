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
     * The GetTypeByName function retrieves a service type GUID for a network service specified by name. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The nspapi.h header defines GetTypeByName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} Tag 
     * @returns {Integer} If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is SOCKET_ERROR( – 1). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns the following extended error value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service type is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/nspapi/nf-nspapi-gettypebynamea
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
     * @returns {Integer} 
     */
    GetTagByName(PluginId, TagName) {
        PluginId := PluginId is String ? StrPtr(PluginId) : PluginId
        TagName := TagName is String ? StrPtr(TagName) : TagName

        result := ComCall(4, this, "ptr", PluginId, "ptr", TagName, "int*", &Tag := 0, "HRESULT")
        return Tag
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
