#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a means of determining the source of inherited access control entries (ACEs) in discretionary access control lists (DACLs) and system access control lists (SACLs).
 * @see https://docs.microsoft.com/windows/win32/api//aclui/nn-aclui-isecurityobjecttypeinfo
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class ISecurityObjectTypeInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecurityObjectTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{fc3066eb-79ef-444b-9111-d18a75ebf2fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInheritSource"]

    /**
     * The ISecurityObjectTypeInfo::GetInheritSource method provides a means of determining the source of inherited access control entries in discretionary access control lists and system access control lists.
     * @param {Integer} si A <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> structure that represents the security information of the object.
     * @param {Pointer<ACL>} pACL A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl">ACL</a> structure that represents the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">access control list</a> (ACL) of the object.
     * @param {Pointer<Pointer<INHERITED_FROMA>>} ppInheritArray A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-inherited_froma">INHERITED_FROM</a> structure that receives an array of <b>INHERITED_FROM</b> structures. The length of this array is the same as the number of <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/ace">ACEs</a> in the ACL referenced by <i>pACL</i>. Each <b>INHERITED_FROM</b> entry in <i>ppInheritArray</i> provides inheritance information for the corresponding <b>ACE</b> entry in <i>pACL</i>.
     * @returns {HRESULT} If the function is successful, the return value is S_OK.
     * 
     *  
     * If the function fails, the return value is an <b>HRESULT</b> that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//aclui/nf-aclui-isecurityobjecttypeinfo-getinheritsource
     */
    GetInheritSource(si, pACL, ppInheritArray) {
        ppInheritArrayMarshal := ppInheritArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", si, "ptr", pACL, ppInheritArrayMarshal, ppInheritArray, "HRESULT")
        return result
    }
}
