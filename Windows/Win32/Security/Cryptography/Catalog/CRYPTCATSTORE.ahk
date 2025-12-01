#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * Represents a catalog file.
 * @see https://learn.microsoft.com/windows/win32/api/mscat/ns-mscat-cryptcatstore
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class CRYPTCATSTORE extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that specifies the "PublicVersion" of the catalog file.
     * @type {Integer}
     */
    dwPublicVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the catalog file. This member must be initialized before a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mscat/nf-mscat-cryptcatpersiststore">CryptCATPersistStore</a> function.
     * @type {PWSTR}
     */
    pwszP7File {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP).
     * @type {Pointer}
     */
    hProv {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A value that specifies the encoding type used for the file. Currently, only X509_ASN_ENCODING and PKCS_7_ASN_ENCODING are being used; however, additional encoding types may be added in the future. For either current encoding type, use: X509_ASN_ENCODING | PKCS_7_ASN_ENCODING.
     * @type {Integer}
     */
    dwEncodingType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    fdwStoreFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * This member is reserved and must be <b>NULL</b>.
     * @type {HANDLE}
     */
    hReserved{
        get {
            if(!this.HasProp("__hReserved"))
                this.__hReserved := HANDLE(32, this)
            return this.__hReserved
        }
    }

    /**
     * This member is reserved and must be <b>NULL</b>.
     * @type {HANDLE}
     */
    hAttrs{
        get {
            if(!this.HasProp("__hAttrs"))
                this.__hAttrs := HANDLE(40, this)
            return this.__hAttrs
        }
    }

    /**
     * A handle to the decoded bytes. This member is only set if the file was opened with the <b>CRYPTCAT_OPEN_NO_CONTENT_HCRYPTMSG</b> flag set.
     * @type {Pointer<Void>}
     */
    hCryptMsg {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * This member is reserved and must be <b>NULL</b>.
     * @type {HANDLE}
     */
    hSorted{
        get {
            if(!this.HasProp("__hSorted"))
                this.__hSorted := HANDLE(56, this)
            return this.__hSorted
        }
    }
}
