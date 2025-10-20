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
     * 
     * @param {Pointer<UInt32>} pdwEntryCount 
     * @returns {HRESULT} 
     */
    GetEntryCount(pdwEntryCount) {
        result := ComCall(3, this, "uint*", pdwEntryCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {Pointer<ITocEntry>} ppEntry 
     * @returns {HRESULT} 
     */
    GetEntryByIndex(dwEntryIndex, ppEntry) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr", ppEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITocEntry>} pEntry 
     * @param {Pointer<UInt32>} pdwEntryIndex 
     * @returns {HRESULT} 
     */
    AddEntry(pEntry, pdwEntryIndex) {
        result := ComCall(5, this, "ptr", pEntry, "uint*", pdwEntryIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {Pointer<ITocEntry>} pEntry 
     * @returns {HRESULT} 
     */
    AddEntryByIndex(dwEntryIndex, pEntry) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @returns {HRESULT} 
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
