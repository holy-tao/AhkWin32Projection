#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Lists the type of logon profile returned.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_profile_buffer_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_PROFILE_BUFFER_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The buffer contains information about an interactive <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon session</a>.
     * @type {Integer (Int32)}
     */
    static KerbInteractiveProfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static KerbSmartCardProfile => 4

    /**
     * The buffer contains information about a Kerberos logon session.
     * @type {Integer (Int32)}
     */
    static KerbTicketProfile => 6
}
