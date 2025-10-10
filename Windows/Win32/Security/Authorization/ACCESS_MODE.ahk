#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate how the access rights in an EXPLICIT_ACCESS structure apply to the trustee.
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ne-accctrl-access_mode
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class ACCESS_MODE{

    /**
     * Value not used.
     * @type {Integer (Int32)}
     */
    static NOT_USED_ACCESS => 0

    /**
     * Indicates an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a> structure. The new ACE combines the specified rights with any existing allowed or denied rights of the trustee.
     * @type {Integer (Int32)}
     */
    static GRANT_ACCESS => 1

    /**
     * Indicates an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a>structure that allows the specified rights. 
 * 
 * 
 * 
 * 
 * On input, this value discards any existing access control information for the trustee.
     * @type {Integer (Int32)}
     */
    static SET_ACCESS => 2

    /**
     * Indicates an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_denied_ace">ACCESS_DENIED_ACE</a>structure that denies the specified rights. 
 * 
 * 
 * 
 * 
 * On input, this value denies the specified rights in addition to any currently denied rights of the trustee.
     * @type {Integer (Int32)}
     */
    static DENY_ACCESS => 3

    /**
     * Indicates that all existing <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a> or 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_ace">SYSTEM_AUDIT_ACE</a> structures for the specified trustee are removed.
     * @type {Integer (Int32)}
     */
    static REVOKE_ACCESS => 4

    /**
     * Indicates a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_ace">SYSTEM_AUDIT_ACE</a>structure that generates audit messages for successful attempts to use the specified access rights. 
 * 						
 * 
 * On input, this value combines the specified rights with any existing audited access rights for the trustee.
     * @type {Integer (Int32)}
     */
    static SET_AUDIT_SUCCESS => 5

    /**
     * Indicates a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_audit_ace">SYSTEM_AUDIT_ACE</a>structure that generates audit messages for failed attempts to use the specified access rights.  
 * 
 * On input, this value combines the specified rights with any existing audited access rights for the trustee.
     * @type {Integer (Int32)}
     */
    static SET_AUDIT_FAILURE => 6
}
