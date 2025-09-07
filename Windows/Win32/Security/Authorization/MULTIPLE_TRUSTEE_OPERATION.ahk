#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate whether a TRUSTEE structure is an impersonation trustee.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ne-accctrl-multiple_trustee_operation
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 */
class MULTIPLE_TRUSTEE_OPERATION{

    /**
     * The trustee is not an impersonation trustee.
     * @type {Integer (Int32)}
     */
    static NO_MULTIPLE_TRUSTEE => 0

    /**
     * The trustee is an impersonation trustee. The <b>pMultipleTrustee</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-trustee_a">TRUSTEE</a> structure points to a trustee for a server that can impersonate the client trustee.
     * @type {Integer (Int32)}
     */
    static TRUSTEE_IS_IMPERSONATE => 1
}
