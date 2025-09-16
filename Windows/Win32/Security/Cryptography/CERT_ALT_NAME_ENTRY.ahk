#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Contains an alternative name in one of a variety of name forms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_alt_name_entry
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_ALT_NAME_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Indicates the <b>union</b> variant used for the alternative name.
     * @type {Integer}
     */
    dwAltNameChoice {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<CERT_OTHER_NAME>}
     */
    pOtherName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszRfc822Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszDNSName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    DirectoryName{
        get {
            if(!this.HasProp("__DirectoryName"))
                this.__DirectoryName := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__DirectoryName
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    pwszURL {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {CRYPT_INTEGER_BLOB}
     */
    IPAddress{
        get {
            if(!this.HasProp("__IPAddress"))
                this.__IPAddress := CRYPT_INTEGER_BLOB(this.ptr + 8)
            return this.__IPAddress
        }
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pszRegisteredID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
