#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to represent an interval of time.
 * @remarks
 * The  <b>LDAP_TIMEVAL</b> structure specify both local timeouts and timeouts sent to the server. The exact usage is described in each LDAP function where used.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_timeval
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct LDAP_TIMEVAL {
    #StructPack 4

    /**
     * Time interval, in seconds.
     */
    tv_sec : Int32

    /**
     * Time interval, in microseconds.
     */
    tv_usec : Int32

}
