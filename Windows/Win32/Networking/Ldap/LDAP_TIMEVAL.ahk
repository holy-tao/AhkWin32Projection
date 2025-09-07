#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used to represent an interval of time.
 * @remarks
 * The  <b>LDAP_TIMEVAL</b> structure specify both local timeouts and timeouts sent to the server. The exact usage is described in each LDAP function where used.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap_timeval
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAP_TIMEVAL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Time interval, in seconds.
     * @type {Integer}
     */
    tv_sec {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Time interval, in microseconds.
     * @type {Integer}
     */
    tv_usec {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
