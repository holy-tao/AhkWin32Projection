#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about how access control entries (ACEs) can be inherited by child objects.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-si_inherit_type
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SI_INHERIT_TYPE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that identifies the type of child object. This member can be a pointer to GUID_NULL. The GUID corresponds to the <b>InheritedObjectType</b> member of an object-specific ACE.
     * @type {Pointer<Guid>}
     */
    pguid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A set of inheritance flags that indicate the types of ACEs that can be inherited by the <b>pguid</b> object type. These flags correspond to the <b>AceFlags</b> member of an
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string containing a display string that describes the child object. 
     * 
     * 
     * 
     * 
     * Alternatively, <b>pszName</b> can be a string resource identifier returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-makeintresourcea">MAKEINTRESOURCE</a> macro. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getobjectinformation">ISecurityInformation::GetObjectInformation</a> method to identify the module that contains the string resource.
     * @type {Pointer<Char>}
     */
    pszName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
