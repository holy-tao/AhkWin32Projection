#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMAPIProp.ahk

/**
 * 
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainerimapiprop
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class IMAPIContainer extends IMAPIProp{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContentsTable", "GetHierarchyTable", "OpenEntry", "SetSearchCriteria", "GetSearchCriteria"]

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-getcontentstable
     */
    GetContentsTable(ulFlags, lppTable) {
        result := ComCall(14, this, "uint", ulFlags, "ptr*", lppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<IMAPITable>} lppTable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-gethierarchytable
     */
    GetHierarchyTable(ulFlags, lppTable) {
        result := ComCall(15, this, "uint", ulFlags, "ptr*", lppTable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbEntryID 
     * @param {Pointer} lpEntryID 
     * @param {Pointer<Guid>} lpInterface 
     * @param {Integer} ulFlags 
     * @param {Pointer<Integer>} lpulObjType 
     * @param {Pointer<IUnknown>} lppUnk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-openentry
     */
    OpenEntry(cbEntryID, lpEntryID, lpInterface, ulFlags, lpulObjType, lppUnk) {
        result := ComCall(16, this, "uint", cbEntryID, "ptr", lpEntryID, "ptr", lpInterface, "uint", ulFlags, "uint*", lpulObjType, "ptr*", lppUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SRestriction>} lpRestriction 
     * @param {Pointer<SBinaryArray>} lpContainerList 
     * @param {Integer} ulSearchFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-setsearchcriteria
     */
    SetSearchCriteria(lpRestriction, lpContainerList, ulSearchFlags) {
        result := ComCall(17, this, "ptr", lpRestriction, "ptr", lpContainerList, "uint", ulSearchFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @param {Pointer<Pointer<SRestriction>>} lppRestriction 
     * @param {Pointer<Pointer<SBinaryArray>>} lppContainerList 
     * @param {Pointer<Integer>} lpulSearchState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/imapicontainer-getsearchcriteria
     */
    GetSearchCriteria(ulFlags, lppRestriction, lppContainerList, lpulSearchState) {
        result := ComCall(18, this, "uint", ulFlags, "ptr*", lppRestriction, "ptr*", lppContainerList, "uint*", lpulSearchState, "HRESULT")
        return result
    }
}
