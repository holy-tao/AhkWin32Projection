#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IADsAccessControlList interface is a dual interface that manages individual access-control entries (ACEs).
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsaccesscontrollist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class AccessControlList extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
