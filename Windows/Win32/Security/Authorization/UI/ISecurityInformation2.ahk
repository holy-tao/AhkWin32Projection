#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDataObject.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the access control editor to obtain information from the client that is not provided by the ISecurityInformation interface.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityinformation2
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityInformation2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityInformation2
     * @type {Guid}
     */
    static IID => Guid("{c3ccfdb4-6f88-11d2-a3ce-00c04fb1782a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDaclCanonical", "LookupSids"]

    /**
     * The IsDaclCanonical method determines whether the ACEs contained in the specified DACL structure are ordered according to the definition of DACL ordering implemented by the client.
     * @param {Pointer<ACL>} pDacl A pointer to a discretionary 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure initialized by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-initializeacl">InitializeAcl</a>.
     * @returns {BOOL} Returns <b>TRUE</b> if the ACEs contained in the specified DACL structure are ordered according to the definition of DACL ordering implemented by the client.
     * 
     * Returns <b>FALSE</b> if the ACEs are not ordered correctly.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation2-isdaclcanonical
     */
    IsDaclCanonical(pDacl) {
        result := ComCall(3, this, "ptr", pDacl, "int")
        return result
    }

    /**
     * The LookupSids method returns the common names corresponding to each of the elements in the specified list of SIDs.
     * @param {Integer} cSids The number of 
     * pointers to  <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures pointed to by <i>rgpSids</i>.
     * @param {Pointer<PSID>} rgpSids A pointer to an array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structures.
     * @returns {IDataObject} A pointer to a pointer to a returned data transfer object that contains the common names of the SIDs. Optionally, this parameter also returns the user principal name (UPN) of the SIDs in the <i>rgpSids</i> parameter. The data transfer object is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/ns-aclui-sid_info">SID_INFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityinformation2-lookupsids
     */
    LookupSids(cSids, rgpSids) {
        rgpSidsMarshal := rgpSids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cSids, rgpSidsMarshal, rgpSids, "ptr*", &ppdo := 0, "HRESULT")
        return IDataObject(ppdo)
    }
}
