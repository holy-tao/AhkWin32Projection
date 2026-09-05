#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Contains values that indicate the types of property pages in an access control editor property sheet.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ne-aclui-si_page_type
 * @namespace Windows.Win32.Security.Authorization.UI
 */
class SI_PAGE_TYPE extends Win32Enum {

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/basic-security-property-page">basic security property page</a> for editing the object's DACL.
     * Native name: SI_PAGE_PERM
     * @type {Integer (Int32)}
     */
    static PERM => 0

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/permissions-property-page">Permissions</a> tab for advanced editing of the object's DACL, such as editing object-specific ACEs.
     * Native name: SI_PAGE_ADVPERM
     * @type {Integer (Int32)}
     */
    static ADVPERM => 1

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-property-page">Auditing</a> tab for editing the object's SACL.
     * Native name: SI_PAGE_AUDIT
     * @type {Integer (Int32)}
     */
    static AUDIT => 2

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/owner-property-page">Owner</a> tab for editing the object's owner.
     * Native name: SI_PAGE_OWNER
     * @type {Integer (Int32)}
     */
    static OWNER => 3

    /**
     * The <b>Effective Permission</b> tab that displays the effective permissions granted to a specified user or group for access to the object.
     * Native name: SI_PAGE_EFFECTIVE
     * @type {Integer (Int32)}
     */
    static EFFECTIVE => 4

    /**
     * A dialog box for changing the owner of the object.
     * Native name: SI_PAGE_TAKEOWNERSHIP
     * @type {Integer (Int32)}
     */
    static TAKEOWNERSHIP => 5

    /**
     * Native name: SI_PAGE_SHARE
     * @type {Integer (Int32)}
     */
    static SHARE => 6
}
