#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Used with the KP_CMS_DH_KEY_INFO parameter in the CryptSetKeyParam function to contain Diffie-Hellman key information.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cms_dh_key_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CMS_DH_KEY_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * One of the <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/alg-id">ALG_ID</a> values that identifies the algorithm for the key to be converted.
     * @type {Integer}
     */
    Algid {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The address of a null-terminated ANSI string that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) of the content encryption algorithm.
     * @type {Pointer<Byte>}
     */
    pszContentEncObjId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> structure that contains additional public information. This member is optional and the <b>cbData</b> member of this structure can be zero if this is not needed.
     * @type {CRYPT_INTEGER_BLOB}
     */
    PubInfo{
        get {
            if(!this.HasProp("__PubInfo"))
                this.__PubInfo := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__PubInfo
        }
    }

    /**
     * Reserved for future use and must be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pReserved {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
