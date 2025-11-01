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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEntryCount", "GetEntryByIndex", "AddEntry", "AddEntryByIndex", "RemoveEntryByIndex"]

    /**
     * 
     * @param {Pointer<Integer>} pdwEntryCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-getentrycount
     */
    GetEntryCount(pdwEntryCount) {
        pdwEntryCountMarshal := pdwEntryCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pdwEntryCountMarshal, pdwEntryCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {Pointer<IToc>} ppToc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-getentrybyindex
     */
    GetEntryByIndex(dwEntryIndex, ppToc) {
        result := ComCall(4, this, "uint", dwEntryIndex, "ptr*", ppToc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IToc} pToc 
     * @param {Pointer<Integer>} pdwEntryIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-addentry
     */
    AddEntry(pToc, pdwEntryIndex) {
        pdwEntryIndexMarshal := pdwEntryIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pToc, pdwEntryIndexMarshal, pdwEntryIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @param {IToc} pToc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-addentrybyindex
     */
    AddEntryByIndex(dwEntryIndex, pToc) {
        result := ComCall(6, this, "uint", dwEntryIndex, "ptr", pToc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwEntryIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-itoccollection-removeentrybyindex
     */
    RemoveEntryByIndex(dwEntryIndex) {
        result := ComCall(7, this, "uint", dwEntryIndex, "HRESULT")
        return result
    }
}
