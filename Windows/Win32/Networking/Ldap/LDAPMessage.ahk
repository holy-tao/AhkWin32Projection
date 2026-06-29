#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\LDAP.ahk" { LDAP }

/**
 * Used by an LDAP function to return results and error data.
 * @remarks
 * The <b>LDAPMessage</b> structure is an opaque data type returned from a server when you call a search or a traversal function. For example, after performing an asynchronous operation,  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_result">ldap_result</a> can be called to get the server <b>LDAPMessage</b> response. Another example is  a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_search_s">ldap_search_s</a>, which also returns an <b>LDAPMessage</b>.
 * 
 * To free the <b>LDAPMessage</b> structure when it is no longer required, call 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_msgfree">ldap_msgfree</a>.
 * 
 * There are no client-accessible fields in this structure.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmessage
 * @namespace Windows.Win32.Networking.Ldap
 */
export default struct LDAPMessage {
    #StructPack 8

    lm_msgid : UInt32

    lm_msgtype : UInt32

    lm_ber : IntPtr

    lm_chain : LDAPMessage.Ptr

    lm_next : LDAPMessage.Ptr

    lm_time : UInt32

    Connection : LDAP.Ptr

    Request : IntPtr

    lm_returncode : UInt32

    lm_referral : UInt16

    lm_chased : BOOLEAN

    lm_eom : BOOLEAN

    ConnectionReferenced : BOOLEAN

}
