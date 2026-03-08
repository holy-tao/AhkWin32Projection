#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumString.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IStringTable interface is introduced in MMC 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/nn-mmc-istringtable
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IStringTable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStringTable
     * @type {Guid}
     */
    static IID => Guid("{de40b7a4-0f65-11d2-8e25-00c04f8ecd78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddString", "GetString", "GetStringLength", "DeleteString", "DeleteAllStrings", "FindString", "Enumerate"]

    /**
     * Enables a snap-in to add a string to the snap-in's string table.
     * @remarks
     * Strings in the string table are reference counted. For example, adding the string "My Text" to the string table will return an ID, say 1234. Adding "My Text" to the string table a second time will return an ID of 1234 again, and the internal reference count for the string will be incremented. Two calls to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-istringtable-deletestring">IStringTable::DeleteString</a>, or a single call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-istringtable-deleteallstrings">IStringTable::DeleteAllStrings</a>, will be required to completely remove "My Text" from the snap-in's string table.
     * 
     * <b>IStringTable::AddString</b> returns a nonzero string ID if the call to it was successful. Snap-ins therefore can safely use 0 to indicate an unassigned ID.
     * @param {PWSTR} pszAdd The string to add to the string table.
     * @returns {Integer} A pointer to the ID of the string added to the string table.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-addstring
     */
    AddString(pszAdd) {
        pszAdd := pszAdd is String ? StrPtr(pszAdd) : pszAdd

        result := ComCall(3, this, "ptr", pszAdd, "uint*", &pStringID := 0, "HRESULT")
        return pStringID
    }

    /**
     * Enables a snap-in to retrieve a string from the snap-in's string table.
     * @remarks
     * If lpBuffer is not large enough to hold the entire string corresponding to StringID, as much of the string as will fit is copied to the buffer and is null-terminated.
     * @param {Integer} StringID The ID of the string to be retrieved from the snap-in's string table.
     * @param {Integer} cchBuffer The number of characters in lpBuffer.
     * @param {PWSTR} lpBuffer A pointer  to the buffer for the character string.
     * @returns {Integer} The number of characters in the retrieved string, not including the NULL terminator. If the number of characters written is not required, pass <b>NULL</b> for this parameter.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-getstring
     */
    GetString(StringID, cchBuffer, lpBuffer) {
        lpBuffer := lpBuffer is String ? StrPtr(lpBuffer) : lpBuffer

        result := ComCall(4, this, "uint", StringID, "uint", cchBuffer, "ptr", lpBuffer, "uint*", &pcchOut := 0, "HRESULT")
        return pcchOut
    }

    /**
     * Enables a snap-in to determine the length of a string in the snap-in's string table.
     * @remarks
     * Use this method to determine the size of the buffer required for 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/nf-mmc-istringtable-getstring">IStringTable::GetString</a>.
     * @param {Integer} StringID The identifier for the string whose length is being retrieved.
     * @returns {Integer} The number of characters in the specified string in the snap-in's string table, not including the terminator.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-getstringlength
     */
    GetStringLength(StringID) {
        result := ComCall(5, this, "uint", StringID, "uint*", &pcchString := 0, "HRESULT")
        return pcchString
    }

    /**
     * Enables a snap-in to delete a specified string from the snap-in string table.
     * @remarks
     * Strings in the string table are reference counted. For example, adding the string "My Text" to the string table will return an ID, such as 1234. Adding "My Text" to the string table a second time will return an ID of 1234 again, and the internal reference count for the string will be incremented. Two calls to <b>IStringTable::DeleteString</b> will be required to completely remove "My Text" from the snap-in string table.
     * @param {Integer} StringID The string to be deleted from the snap-in string table.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-deletestring
     */
    DeleteString(StringID) {
        result := ComCall(6, this, "uint", StringID, "HRESULT")
        return result
    }

    /**
     * The IStringTable::DeleteAllStrings method enables a snap-in to delete all strings from the snap-in's string table.
     * @remarks
     * This method deletes all strings from the snap-in's string table, regardless of each string's reference count.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-deleteallstrings
     */
    DeleteAllStrings() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Enables a snap-in to search for a string in the snap-in string table.
     * @param {PWSTR} pszFind The string to be searched for in the string table.
     * @returns {Integer} A pointer to the ID of the string found in the string table.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-findstring
     */
    FindString(pszFind) {
        pszFind := pszFind is String ? StrPtr(pszFind) : pszFind

        result := ComCall(8, this, "ptr", pszFind, "uint*", &pStringID := 0, "HRESULT")
        return pStringID
    }

    /**
     * Supplies a pointer to an IEnumString interface on an enumerator that can return the strings in a snap-in's string table.
     * @remarks
     * The returned <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> enumeration represents a snapshot of the collection of strings in the underlying string table the time that the enumeration was retrieved. Neither <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ienumstring-reset">IEnumString::Reset</a>, nor IEnumString::Clone takes a new snapshot of the collection.
     * 
     * The implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a> uses the default OLE task memory allocator to allocate memory for the strings it returns.
     * @returns {IEnumString} The address of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstring">IEnumString</a>* pointer variable that receives the interface pointer to the enumerator. If an error occurs, *<i>ppEnum</i> is set to <b>NULL</b>. If *<i>ppEnum </i> is non-<b>NULL</b>, MMC's implementation of <b>IEnumString</b> calls <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a> on the *<i>ppEnum</i>. The snap-in must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when the interface is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-istringtable-enumerate
     */
    Enumerate() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumString(ppEnum)
    }
}
