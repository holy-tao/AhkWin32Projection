#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\ACE_FLAGS.ahk" { ACE_FLAGS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about how access control entries (ACEs) can be inherited by child objects.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-si_inherit_type
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct SI_INHERIT_TYPE {
    #StructPack 8

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of child object. This member can be a pointer to GUID_NULL. The GUID corresponds to the <b>InheritedObjectType</b> member of an object-specific ACE.
     */
    pguid : Guid.Ptr

    /**
     * A set of inheritance flags that indicate the types of ACEs that can be inherited by the <b>pguid</b> object type. These flags correspond to the <b>AceFlags</b> member of an
     */
    dwFlags : ACE_FLAGS

    /**
     * A pointer to a null-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string containing a display string that describes the child object. 
     * 
     * 
     * 
     * 
     * Alternatively, <b>pszName</b> can be a string resource identifier returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method to identify the module that contains the string resource.
     */
    pszName : PWSTR

}
