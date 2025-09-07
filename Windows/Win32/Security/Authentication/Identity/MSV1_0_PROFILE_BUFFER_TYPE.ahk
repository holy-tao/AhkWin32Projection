#Requires AutoHotkey v2.0.0 64-bit

/**
 * Lists the kind of logon profile returned.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-msv1_0_profile_buffer_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class MSV1_0_PROFILE_BUFFER_TYPE{

    /**
     * The profile describes an interactive <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * @type {Integer (Int32)}
     */
    static MsV1_0InteractiveProfile => 2

    /**
     * The profile describes a network logon session.
     * @type {Integer (Int32)}
     */
    static MsV1_0Lm20LogonProfile => 3

    /**
     * The profile describes a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">smart card</a> logon session.
     * @type {Integer (Int32)}
     */
    static MsV1_0SmartCardProfile => 4
}
