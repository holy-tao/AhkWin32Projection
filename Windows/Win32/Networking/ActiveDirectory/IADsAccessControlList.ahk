#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
     * @type {Integer} 
     */
    AclRevision {
        get => this.get_AclRevision()
        set => this.put_AclRevision(value)
    }

    /**
     * @type {Integer} 
     */
    AceCount {
        get => this.get_AceCount()
        set => this.put_AceCount(value)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AclRevision() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_AceCount() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * The IADsAccessControlList::AddAce method adds an IADsAccessControlEntry object to the IADsAccessControlList object.
     * @param {IDispatch} pAccessControlEntry Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface of the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsaccesscontrolentry">IADsAccessControlEntry</a> object to be added. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} Returns a standard <b>HRESULT</b> value including the following.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsaccesscontrollist-addace
     */
    AddAce(pAccessControlEntry) {
        result := ComCall(11, this, "ptr", pAccessControlEntry, "HRESULT")
        return result
    }

    /**
     * Removes an access-control entry (ACE) from the access-control list (ACL).
     * @param {IDispatch} pAccessControlEntry Pointer to the <b>IDispatch</b> interface of the ACE to be removed from the ACL.
     * @returns {HRESULT} This method returns standard return values.
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsaccesscontrollist-removeace
     */
    RemoveAce(pAccessControlEntry) {
        result := ComCall(12, this, "ptr", pAccessControlEntry, "HRESULT")
        return result
    }

    /**
     * The IADsAccessControlList::CopyAccessList method copies every access control entry (ACE) in the access-control list (ACL) to the caller's process space.
     * @returns {IDispatch} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-idispatch">IDispatch</a> interface pointer to an ACL as the copy of the original access list. If this parameter is <b>NULL</b> on return, no copies of the ACL could be made.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsaccesscontrollist-copyaccesslist
     */
    CopyAccessList() {
        result := ComCall(13, this, "ptr*", &ppAccessControlList := 0, "HRESULT")
        return IDispatch(ppAccessControlList)
    }

    /**
     * The IADsAccessControlList::get__NewEnum method is used to obtain an enumerator object for the ACL to enumerate ACEs.
     * @returns {IUnknown} Pointer to pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface used to retrieve
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on an enumerator object for the ACL.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsaccesscontrollist-get__newenum
     */
    get__NewEnum() {
        result := ComCall(14, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }
}
