#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by an LDAP function to return results and error data.
 * @remarks
 * 
 * The <b>LDAPMessage</b> structure is an opaque data type returned from a server when you call a search or a traversal function. For example, after performing an asynchronous operation,  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> can be called to get the server <b>LDAPMessage</b> response. Another example is  a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>, which also returns an <b>LDAPMessage</b>.
 * 
 * To free the <b>LDAPMessage</b> structure when it is no longer required, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>.
 * 
 * There are no client-accessible fields in this structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldapmessage
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAPMessage extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    lm_msgid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lm_msgtype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Void>}
     */
    lm_ber {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<LDAPMessage>}
     */
    lm_chain {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<LDAPMessage>}
     */
    lm_next {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    lm_time {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<LDAP>}
     */
    Connection {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    Request {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    lm_returncode {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    lm_referral {
        get => NumGet(this, 60, "ushort")
        set => NumPut("ushort", value, this, 60)
    }

    /**
     * @type {BOOLEAN}
     */
    lm_chased {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * @type {BOOLEAN}
     */
    lm_eom {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }

    /**
     * @type {BOOLEAN}
     */
    ConnectionReferenced {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }
}
