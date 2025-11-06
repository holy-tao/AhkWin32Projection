#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITrusteeGroupAdmin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITrusteeGroupAdmin
     * @type {Guid}
     */
    static IID => Guid("{0c733aa2-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddMember", "DeleteMember", "IsMember", "GetMembers", "GetMemberships"]

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {HRESULT} 
     */
    AddMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(3, this, "ptr", pMembershipTrustee, "ptr", pMemberTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {HRESULT} 
     */
    DeleteMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(4, this, "ptr", pMembershipTrustee, "ptr", pMemberTrustee, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<TRUSTEE_W>} pMemberTrustee 
     * @returns {BOOL} 
     */
    IsMember(pMembershipTrustee, pMemberTrustee) {
        result := ComCall(5, this, "ptr", pMembershipTrustee, "ptr", pMemberTrustee, "int*", &pfStatus := 0, "HRESULT")
        return pfStatus
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pMembershipTrustee 
     * @param {Pointer<Integer>} pcMembers 
     * @param {Pointer<Pointer<TRUSTEE_W>>} prgMembers 
     * @returns {HRESULT} 
     */
    GetMembers(pMembershipTrustee, pcMembers, prgMembers) {
        pcMembersMarshal := pcMembers is VarRef ? "uint*" : "ptr"
        prgMembersMarshal := prgMembers is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pMembershipTrustee, pcMembersMarshal, pcMembers, prgMembersMarshal, prgMembers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Pointer<Integer>} pcMemberships 
     * @param {Pointer<Pointer<TRUSTEE_W>>} prgMemberships 
     * @returns {HRESULT} 
     */
    GetMemberships(pTrustee, pcMemberships, prgMemberships) {
        pcMembershipsMarshal := pcMemberships is VarRef ? "uint*" : "ptr"
        prgMembershipsMarshal := prgMemberships is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pTrustee, pcMembershipsMarshal, pcMemberships, prgMembershipsMarshal, prgMemberships, "HRESULT")
        return result
    }
}
