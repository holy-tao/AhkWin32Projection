#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * C++ class object that performs basic encoding rules (BER) encoding.
 * @remarks
 * This is an opaque data structure that the 
  *  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_first_attribute">ldap_first_attribute</a> function allocates and returns to indicate the current position during a traversal of an attribute list. Pass the pointer to this structure to the 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_next_attribute">ldap_next_attribute</a> function.
  * 
  * <div class="alert"><b>Caution</b>  When allocated by one of the two previous functions, you do not free the memory associated with this structure or its pointer when the <b>BerElement</b> is no longer required.</div>
  * <div> </div>
  * A <b>BerElement</b> structure can also be allocated by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_alloc_t">ber_alloc_t</a> or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_init">ber_init</a> function. In such cases, free the   memory allocated to the <b>BerElement</b> structure by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winber/nf-winber-ber_free">ber_free</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-berelement
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class BerElement extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to an opaque buffer. Do not attempt to access it.
     * @type {PSTR}
     */
    opaque{
        get {
            if(!this.HasProp("__opaque"))
                this.__opaque := PSTR(this.ptr + 0)
            return this.__opaque
        }
    }
}
