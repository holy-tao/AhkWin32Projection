#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SI_OBJECT_INFO_FLAGS.ahk" { SI_OBJECT_INFO_FLAGS }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Used to initialize the access control editor.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-si_object_info
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct SI_OBJECT_INFO {
    #StructPack 8

    dwFlags : SI_OBJECT_INFO_FLAGS

    /**
     * Identifies a module that contains string resources to be used in the property sheet. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getaccessrights">ISecurityInformation::GetAccessRights</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclui/nf-aclui-isecurityinformation-getinherittypes">ISecurityInformation::GetInheritTypes</a> methods can specify string resource identifiers for display names.
     */
    hInstance : HINSTANCE

    /**
     * A pointer to a <b>null</b>-terminated, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> string that names the computer on which to look up account names and SIDs. This value can be <b>NULL</b> to specify the local computer. The access control editor does not free this pointer.
     */
    pszServerName : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated, Unicode string that names the object being edited. This name appears in the title of the advanced security property sheet and any error message boxes displayed by the access control editor. The access control editor does not free this pointer.
     */
    pszObjectName : PWSTR

    /**
     * A pointer to a <b>null</b>-terminated, Unicode string used as the title of the basic security property page. This member is ignored unless the SI_PAGE_TITLE flag is set in <b>dwFlags</b>. If the page title is not provided, a default title is used. The access control editor does not free this pointer.
     */
    pszPageTitle : PWSTR

    /**
     * A 
     * GUID for the object. This member is ignored unless the SI_OBJECT_GUID flag is set in <b>dwFlags</b>.
     */
    guidObjectType : Guid

}
