#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HINSTANCE.ahk

/**
 * Used to initialize the access control editor.
 * @see https://docs.microsoft.com/windows/win32/api//aclui/ns-aclui-si_object_info
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SI_OBJECT_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Identifies a module that contains string resources to be used in the property sheet. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getaccessrights">ISecurityInformation::GetAccessRights</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getinherittypes">ISecurityInformation::GetInheritTypes</a> methods can specify string resource identifiers for display names.
     * @type {HINSTANCE}
     */
    hInstance{
        get {
            if(!this.HasProp("__hInstance"))
                this.__hInstance := HINSTANCE(8, this)
            return this.__hInstance
        }
    }

    /**
     * A pointer to a <b>null</b>-terminated, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string that names the computer on which to look up account names and SIDs. This value can be <b>NULL</b> to specify the local computer. The access control editor does not free this pointer.
     * @type {PWSTR}
     */
    pszServerName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <b>null</b>-terminated, Unicode string that names the object being edited. This name appears in the title of the advanced security property sheet and any error message boxes displayed by the access control editor. The access control editor does not free this pointer.
     * @type {PWSTR}
     */
    pszObjectName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a <b>null</b>-terminated, Unicode string used as the title of the basic security property page. This member is ignored unless the SI_PAGE_TITLE flag is set in <b>dwFlags</b>. If the page title is not provided, a default title is used. The access control editor does not free this pointer.
     * @type {PWSTR}
     */
    pszPageTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A 
     * GUID for the object. This member is ignored unless the SI_OBJECT_GUID flag is set in <b>dwFlags</b>.
     * @type {Pointer<Guid>}
     */
    guidObjectType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
