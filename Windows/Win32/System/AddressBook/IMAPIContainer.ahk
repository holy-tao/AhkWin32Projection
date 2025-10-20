#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIContainer extends IMAPIProp{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetContentsTable(ulFlags, lppTable) {
        result := ComCall(14, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     */
    GetHierarchyTable(ulFlags, lppTable) {
        result := ComCall(15, this, "uint", ulFlags, "ptr", lppTable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<UInt32>} lpulObjType 
     * @param {Pointer<IUnknown>} lppUnk 
     * @returns {HRESULT} 
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk) {
        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulObjType, "ptr", lppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Pointer<SBinaryArray>} lpContainerList 
     * @param {Integer} ulSearchFlags 
     * @returns {HRESULT} 
     */
    SetSearchCriteria(lpRestriction, lpContainerList, ulSearchFlags) {
        result := ComCall(17, this, "ptr", lpRestriction, "ptr", lpContainerList, "uint", ulSearchFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<SRestriction>} lppRestriction 
     * @param {Pointer<SBinaryArray>} lppContainerList 
     * @param {Pointer<UInt32>} lpulSearchState 
     * @returns {HRESULT} 
     */
    GetSearchCriteria(ulFlags, lppRestriction, lppContainerList, lpulSearchState) {
        result := ComCall(18, this, "uint", ulFlags, "ptr", lppRestriction, "ptr", lppContainerList, "uint*", lpulSearchState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
