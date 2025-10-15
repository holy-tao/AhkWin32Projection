#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * Represents an LDAP session.
 * @remarks
 * 
  * An <b>LDAP</b> structure is an opaque data type allocated and initialized by a call to 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_init">ldap_init</a>, 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-cldap_open">cldap_open</a>, or 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_open">ldap_open</a>. Subsequent LDAP calls pass a handle to this structure, which maintains the state of an LDAP session for the duration of the connection. When the session ends, call 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_unbind">ldap_unbind</a> to destroy the connection handle.
  * 
  * Although this is an opaque data type, it is documented in Winldap.h. This is primarily of value in porting applications written using other LDAP client implementations. Call 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_get_option">ldap_get_option</a> or 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/nf-winldap-ldap_set_option">ldap_set_option</a> to access or change the values associated with the LDAP connection handle (this structure). Using these two functions also expose settings not directly accessible from the <b>LDAP</b> structure. For more information about session options, see <a href="https://docs.microsoft.com/previous-versions/previous-versions/windows/desktop/ldap/session-options">Session Options</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winldap/ns-winldap-ldap
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class LDAP extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    class _ld_sb extends Win32Struct {
        static sizeof => 184
        static packingSize => 8

        /**
         * @type {Pointer}
         */
        sb_sd {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Reserved1{
            get {
                if(!this.HasProp("__Reserved1ProxyArray"))
                    this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 8, 41, Primitive, "char")
                return this.__Reserved1ProxyArray
            }
        }
    
        /**
         * @type {Pointer}
         */
        sb_naddr {
            get => NumGet(this, 56, "ptr")
            set => NumPut("ptr", value, this, 56)
        }
    
        /**
         * @type {Array<Byte>}
         */
        Reserved2{
            get {
                if(!this.HasProp("__Reserved2ProxyArray"))
                    this.__Reserved2ProxyArray := Win32FixedArray(this.ptr + 64, 24, Primitive, "char")
                return this.__Reserved2ProxyArray
            }
        }
    
    }

    /**
     * @type {_ld_sb}
     */
    ld_sb{
        get {
            if(!this.HasProp("__ld_sb"))
                this.__ld_sb := %this.__Class%._ld_sb(this.ptr + 0)
            return this.__ld_sb
        }
    }

    /**
     * @type {PSTR}
     */
    ld_host{
        get {
            if(!this.HasProp("__ld_host"))
                this.__ld_host := PSTR(this.ptr + 88)
            return this.__ld_host
        }
    }

    /**
     * @type {Integer}
     */
    ld_version {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ld_lberoptions {
        get => NumGet(this, 100, "char")
        set => NumPut("char", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    ld_deref {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    ld_timelimit {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    ld_sizelimit {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    ld_errno {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {PSTR}
     */
    ld_matched{
        get {
            if(!this.HasProp("__ld_matched"))
                this.__ld_matched := PSTR(this.ptr + 120)
            return this.__ld_matched
        }
    }

    /**
     * @type {PSTR}
     */
    ld_error{
        get {
            if(!this.HasProp("__ld_error"))
                this.__ld_error := PSTR(this.ptr + 128)
            return this.__ld_error
        }
    }

    /**
     * @type {Integer}
     */
    ld_msgid {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Array<Byte>}
     */
    Reserved3{
        get {
            if(!this.HasProp("__Reserved3ProxyArray"))
                this.__Reserved3ProxyArray := Win32FixedArray(this.ptr + 140, 25, Primitive, "char")
            return this.__Reserved3ProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ld_cldaptries {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    ld_cldaptimeout {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * @type {Integer}
     */
    ld_refhoplimit {
        get => NumGet(this, 176, "uint")
        set => NumPut("uint", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    ld_options {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }
}
