#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CRYPT_INTEGER_BLOB.ahk

/**
 * Used for time stamping.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_time_stamp_request_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_TIME_STAMP_REQUEST_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) that specifies the desired format of the time stamp, usually UTC.
     * @type {Pointer<Ptr>}
     */
    pszTimeStampAlgorithm {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The OID of the Content Type of the content, usually DATA.
     * @type {Pointer<Ptr>}
     */
    pszContentType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_OBJID_BLOB</a> structure that contains the encoded signature bits of the material being time stamped.
     * @type {CRYPT_INTEGER_BLOB}
     */
    Content{
        get {
            if(!this.HasProp("__Content"))
                this.__Content := CRYPT_INTEGER_BLOB(this.ptr + 16)
            return this.__Content
        }
    }

    /**
     * The number of elements in the <b>rgAttribute</b> array.
     * @type {Integer}
     */
    cAttribute {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute">CRYPT_ATTRIBUTE</a> structures, each holding an encoded attribute.
     * @type {Pointer<CRYPT_ATTRIBUTE>}
     */
    rgAttribute {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
