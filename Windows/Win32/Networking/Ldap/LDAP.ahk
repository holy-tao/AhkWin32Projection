#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Represents an LDAP session.
 * @remarks
 * An <b>LDAP</b> structure is an opaque data type allocated and initialized by a call to 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>, 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-cldap_open">cldap_open</a>, or 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>. Subsequent LDAP calls pass a handle to this structure, which maintains the state of an LDAP session for the duration of the connection. When the session ends, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> to destroy the connection handle.
 * 
 * Although this is an opaque data type, it is documented in Winldap.h. This is primarily of value in porting applications written using other LDAP client implementations. Call 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a> or 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> to access or change the values associated with the LDAP connection handle (this structure). Using these two functions also expose settings not directly accessible from the <b>LDAP</b> structure. For more information about session options, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldap
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct LDAP {
    #StructPack 8


    struct _ld_sb {
        sb_sd : IntPtr

        Reserved1 : Int8[41]

        sb_naddr : IntPtr

        Reserved2 : Int8[24]

    }

    ld_sb : LDAP._ld_sb

    ld_host : PSTR

    ld_version : UInt32

    ld_lberoptions : Int8

    ld_deref : UInt32

    ld_timelimit : UInt32

    ld_sizelimit : UInt32

    ld_errno : UInt32

    ld_matched : PSTR

    ld_error : PSTR

    ld_msgid : UInt32

    Reserved3 : Int8[25]

    ld_cldaptries : UInt32

    ld_cldaptimeout : UInt32

    ld_refhoplimit : UInt32

    ld_options : UInt32

    ld_anonymousmaxvalrange : UInt32

}
