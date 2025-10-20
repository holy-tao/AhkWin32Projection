#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITocCollection represents a collection of tables of contents. It provides methods for adding, retrieving, and removing, tables of contents from the collection.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-itoccollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ITocCollection extends IUnknown{
    /**
     * The interface identifier for ITocCollection
     * @type {Guid}
     */
    static IID => Guid("{23fee831-ae96-42df-b170-25a04847a3ca}")

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
     * @param {Pointer<IToc>} ppToc 
     * @returns {HRESULT} 
     */
    GetEntryByIndex(dwEntryIndex, ppToc) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr", ppToc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IToc>} pToc 
     * @param {Pointer<UInt32>} pdwEntryIndex 
     * @returns {HRESULT} 
     */
    AddEntry(pToc, pdwEntryIndex) {
        result := ComCall(5, this, "ptr", pToc, "uint*", pdwEntryIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {Pointer<IToc>} pToc 
     * @returns {HRESULT} 
     */
    AddEntryByIndex(dwEntryIndex, pToc) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pToc, "int")
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
