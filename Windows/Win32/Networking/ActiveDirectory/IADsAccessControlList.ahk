#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsAccessControlList interface is a dual interface that manages individual access-control entries (ACEs).
 * @remarks
 * 
  * An access-control list (ACL) is a collection of ACEs that can provide more specific access control to the same ADSI object for different clients. In general, different providers implement different access controls and therefore the behavior of the object is specific to the provider.  For more information, see  the provider documentation. For more information about Microsoft providers, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-system-providers">ADSI System Providers</a>. Currently, only the LDAP provider supports access controls.
  * 
  * Before you can work with an object ACE, first obtain the ACL to which they belong. ACLs are managed by security descriptors and can be of either discretionary ACL and system ACL. For more information, see 
  *   <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a>.
  * 
  * Using the properties and methods of the <b>IADsAccessControlList</b> interface, you can retrieve and enumerate ACEs, add new entries to the list, or remove existing entries.
  * 
  * <p class="proch"><b>To manage access controls over an ADSI</b>
  * 
  * <ol>
  * <li>First, retrieve the security descriptor of the object that implements the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> interface.</li>
  * <li>Second, retrieve the ACL from the security descriptor.</li>
  * <li>Third, work with the ACE, or ACEs, of the object in the ACL.</li>
  * </ol>
  * <p class="proch"><b>To make any new or modified ACEs persistent</b>
  * 
  * <ol>
  * <li>First, add the ACE to the ACL.</li>
  * <li>Second, assign the ACL to the security descriptor.</li>
  * <li>Third, commit the security descriptor to the directory store.</li>
  * </ol>
  * For more information about DACLs, see <a href="https://docs.microsoft.com/windows/desktop/AD/null-dacls-and-empty-dacls">Null DACLs and Empty DACLs</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsaccesscontrollist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsAccessControlList extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsAccessControlList
     * @type {Guid}
     */
    static IID => Guid("{b7ee91cc-9bdd-11d0-852c-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AclRevision", "put_AclRevision", "get_AceCount", "put_AceCount", "AddAce", "RemoveAce", "CopyAccessList", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AclRevision(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAclRevision 
     * @returns {HRESULT} 
     */
    put_AclRevision(lnAclRevision) {
        result := ComCall(8, this, "int", lnAclRevision, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AceCount(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAceCount 
     * @returns {HRESULT} 
     */
    put_AceCount(lnAceCount) {
        result := ComCall(10, this, "int", lnAceCount, "HRESULT")
        return result
    }

    /**
     * Adds one or more access control entries (ACEs) to a specified access control list (ACL).
     * @param {IDispatch} pAccessControlEntry 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following are possible error values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The new ACE does not fit into the ACL. A larger ACL buffer is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified ACL is not properly formed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ACE was successfully added.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//securitybaseapi/nf-securitybaseapi-addace
     */
    AddAce(pAccessControlEntry) {
        result := ComCall(11, this, "ptr", pAccessControlEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDispatch} pAccessControlEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsaccesscontrollist-removeace
     */
    RemoveAce(pAccessControlEntry) {
        result := ComCall(12, this, "ptr", pAccessControlEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppAccessControlList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsaccesscontrollist-copyaccesslist
     */
    CopyAccessList(ppAccessControlList) {
        result := ComCall(13, this, "ptr*", ppAccessControlList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsaccesscontrollist-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(14, this, "ptr*", retval, "HRESULT")
        return result
    }
}
