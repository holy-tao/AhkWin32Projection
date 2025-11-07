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
     * @returns {Pointer} 
     */
    FindCell(ulStartingOrdinal, cMembers, rgpwszMember) {
        rgpwszMemberMarshal := rgpwszMember is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", ulStartingOrdinal, "ptr", cMembers, rgpwszMemberMarshal, rgpwszMember, "ptr*", &pulCellOrdinal := 0, "HRESULT")
        return pulCellOrdinal
    }

    /**
     * 
     * @param {Integer} ulAxisIdentifier 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @returns {Integer} 
     */
    FindTuple(ulAxisIdentifier, ulStartingOrdinal, cMembers, rgpwszMember) {
        rgpwszMemberMarshal := rgpwszMember is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", ulAxisIdentifier, "ptr", ulStartingOrdinal, "ptr", cMembers, rgpwszMemberMarshal, rgpwszMember, "uint*", &pulTupleOrdinal := 0, "HRESULT")
        return pulTupleOrdinal
    }
}
