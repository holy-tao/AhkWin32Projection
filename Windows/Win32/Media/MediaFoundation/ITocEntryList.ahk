#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITocEntry.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocEntryList interface represents a list of entries in a table of contents. It provides methods for adding entries to, and removing entries from the list.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itocentrylist
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocEntryList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITocEntryList
     * @type {Guid}
     */
    static IID => Guid("{3a8cccbd-0efd-43a3-b838-f38a552ba237}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEntryCount", "GetEntryByIndex", "AddEntry", "AddEntryByIndex", "RemoveEntryByIndex"]

    /**
     * The GetEntryCount method retrieves the number of entries in the list.
     * @param {Pointer<Integer>} pdwEntryCount Pointer to a <b>DWORD</b> that receives the number of entries.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrycount
     */
    GetEntryCount(pdwEntryCount) {
        pdwEntryCountMarshal := pdwEntryCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwEntryCountMarshal, pdwEntryCount, "HRESULT")
        return result
    }

    /**
     * The GetEntryByIndex method retrieves an entry, specified by an index, from the list.
     * @param {Integer} dwEntryIndex The index of the entry to retrieve.
     * @returns {ITocEntry} Pointer to a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry.
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrybyindex
     */
    GetEntryByIndex(dwEntryIndex) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr*", &ppEntry := 0, "HRESULT")
        return ITocEntry(ppEntry)
    }

    /**
     * The AddEntry method adds an individual entry to the list and assigns an index to the entry.
     * @param {ITocEntry} pEntry Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry to be added.
     * @param {Pointer<Integer>} pdwEntryIndex Pointer to a <b>DWORD</b> that receives the index of the added entry.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentry
     */
    AddEntry(pEntry, pdwEntryIndex) {
        pdwEntryIndexMarshal := pdwEntryIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pEntry, pdwEntryIndexMarshal, pdwEntryIndex, "HRESULT")
        return result
    }

    /**
     * The AddEntryByIndex method adds an individual entry to the list and associates a caller-supplied index with the entry.
     * @param {Integer} dwEntryIndex The index of the entry to be added.
     * @param {ITocEntry} pEntry Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcodecdsp/nn-wmcodecdsp-itocentry">ITocEntry</a> interface that represents the entry to be added.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentrybyindex
     */
    AddEntryByIndex(dwEntryIndex, pEntry) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pEntry, "HRESULT")
        return result
    }

    /**
     * The RemoveEntryByIndex method removes an entry, specified by an index, from the list.
     * @param {Integer} dwEntryIndex The index of the entry to be removed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nf-wmcodecdsp-itocentrylist-removeentrybyindex
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "HRESULT")
        return result
    }
}
