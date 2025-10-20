#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pdwEntryCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrycount
     */
    GetEntryCount(pdwEntryCount) {
        result := ComCall(3, this, "uint*", pdwEntryCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {Pointer<ITocEntry>} ppEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-getentrybyindex
     */
    GetEntryByIndex(dwEntryIndex, ppEntry) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr*", ppEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITocEntry} pEntry 
     * @param {Pointer<Integer>} pdwEntryIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentry
     */
    AddEntry(pEntry, pdwEntryIndex) {
        result := ComCall(5, this, "ptr", pEntry, "uint*", pdwEntryIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {ITocEntry} pEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-addentrybyindex
     */
    AddEntryByIndex(dwEntryIndex, pEntry) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itocentrylist-removeentrybyindex
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "HRESULT")
        return result
    }
}
