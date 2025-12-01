#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides access to properties on an ADSI security descriptor object.
 * @remarks
 * Use this interface to examine and change the access controls to an Active Directory directory service object. You can also use it to create copies of a security descriptor. To get this interface, use the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-get">IADs.Get</a> method to obtain the <b>ntSecurityDescriptor</b> attribute of the object. For more information about how  to create  a new security descriptor and set it on an object, see <a href="https://docs.microsoft.com/windows/desktop/AD/creating-a-security-descriptor-for-a-new-directory-object">Creating a Security Descriptor for a New Directory Object</a> and <a href="https://docs.microsoft.com/windows/desktop/AD/null-dacls-and-empty-dacls">Null DACLs and Empty DACLs</a>.
 * 
 * Often, it is not possible to modify all portions of the security descriptor. For example, if the current user has full control of an object, but is not an administrator and does not own the object, the user can modify the DACL, but cannot modify the owner. This will cause an error when the <b>ntSecurityDescriptor</b> is updated. To avoid this problem, the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsobjectoptions">IADsObjectOptions</a> interface can be used to specify the specific portions of the security descriptor that should be modified.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadssecuritydescriptor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADsSecurityUtility extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
