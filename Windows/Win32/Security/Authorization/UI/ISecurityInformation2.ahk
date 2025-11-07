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
     * 
     * @param {Pointer<ACL>} pDacl 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation2-isdaclcanonical
     */
    IsDaclCanonical(pDacl) {
        result := ComCall(3, this, "ptr", pDacl, "int")
        return result
    }

    /**
     * 
     * @param {Integer} cSids 
     * @param {Pointer<PSID>} rgpSids 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/aclui/nf-aclui-isecurityinformation2-lookupsids
     */
    LookupSids(cSids, rgpSids) {
        rgpSidsMarshal := rgpSids is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cSids, rgpSidsMarshal, rgpSids, "ptr*", &ppdo := 0, "HRESULT")
        return IDataObject(ppdo)
    }
}
