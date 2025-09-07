#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the types of property pages in an access control editor property sheet.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ne-aclui-si_page_type
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class SI_PAGE_TYPE{

    /**
     * The 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/basic-security-property-page">basic security property page</a> for editing the object's DACL.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_PERM => 0

    /**
     * The 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/permissions-property-page">Permissions</a> tab for advanced editing of the object's DACL, such as editing object-specific ACEs.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_ADVPERM => 1

    /**
     * The 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/auditing-property-page">Auditing</a> tab for editing the object's SACL.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_AUDIT => 2

    /**
     * The 
 * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/owner-property-page">Owner</a> tab for editing the object's owner.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_OWNER => 3

    /**
     * The <b>Effective Permission</b> tab that displays the effective permissions granted to a specified user or group for access to the object.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_EFFECTIVE => 4

    /**
     * A dialog box for changing the owner of the object.
     * @type {Integer (Int32)}
     */
    static SI_PAGE_TAKEOWNERSHIP => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SI_PAGE_SHARE => 6
}
