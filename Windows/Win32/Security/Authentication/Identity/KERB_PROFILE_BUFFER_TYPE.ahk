#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Lists the type of logon profile returned.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_profile_buffer_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class KERB_PROFILE_BUFFER_TYPE extends Win32Enum {

    /**
     * The buffer contains information about an interactive <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * Native name: KerbInteractiveProfile
     * @type {Integer (Int32)}
     */
    static InteractiveProfile => 2

    /**
     * Native name: KerbSmartCardProfile
     * @type {Integer (Int32)}
     */
    static SmartCardProfile => 4

    /**
     * The buffer contains information about a Kerberos logon session.
     * Native name: KerbTicketProfile
     * @type {Integer (Int32)}
     */
    static TicketProfile => 6
}
