#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMDFind extends IUnknown{
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
     * 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @param {Pointer<UIntPtr>} pulCellOrdinal 
     * @returns {HRESULT} 
     */
    FindCell(ulStartingOrdinal, cMembers, rgpwszMember, pulCellOrdinal) {
        result := ComCall(3, this, "ptr", ulStartingOrdinal, "ptr", cMembers, "ptr", rgpwszMember, "ptr*", pulCellOrdinal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulAxisIdentifier 
     * @param {Pointer} ulStartingOrdinal 
     * @param {Pointer} cMembers 
     * @param {Pointer<PWSTR>} rgpwszMember 
     * @param {Pointer<UInt32>} pulTupleOrdinal 
     * @returns {HRESULT} 
     */
    FindTuple(ulAxisIdentifier, ulStartingOrdinal, cMembers, rgpwszMember, pulTupleOrdinal) {
        result := ComCall(4, this, "uint", ulAxisIdentifier, "ptr", ulStartingOrdinal, "ptr", cMembers, "ptr", rgpwszMember, "uint*", pulTupleOrdinal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
