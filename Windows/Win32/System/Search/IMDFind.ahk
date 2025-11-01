#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMDFind extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDFind
     * @type {Guid}
     */
    static IID => Guid("{a07cccd2-8148-11d0-87bb-00c04fc33942}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindCell", "FindTuple"]

    /**
     * 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @param {Pointer<Pointer>} pulCellOrdinal 
     * @returns {HRESULT} 
     */
    FindCell(ulStartingOrdinal, cMembers, rgpwszMember, pulCellOrdinal) {
        result := ComCall(3, this, "ptr", ulStartingOrdinal, "ptr", cMembers, "ptr", rgpwszMember, "ptr*", pulCellOrdinal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulAxisIdentifier 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @param {Pointer<Integer>} pulTupleOrdinal 
     * @returns {HRESULT} 
     */
    FindTuple(ulAxisIdentifier, ulStartingOrdinal, cMembers, rgpwszMember, pulTupleOrdinal) {
        result := ComCall(4, this, "uint", ulAxisIdentifier, "ptr", ulStartingOrdinal, "ptr", cMembers, "ptr", rgpwszMember, "uint*", pulTupleOrdinal, "HRESULT")
        return result
    }
}
