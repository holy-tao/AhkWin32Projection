#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_CREDENTIAL_INFO structure contains a reference to a certificate.
 * @remarks
 * 
 * <b>CERT_HASH_LENGTH</b> is defined as 20 in WinCred.h.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincred/ns-wincred-cert_credential_info
 * @namespace Windows.Win32.Security.Credentials
 * @version v4.0.30319
 */
class CERT_CREDENTIAL_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Size of the structure in bytes. This member should be set to 
     *       <c>sizeof(CERT_CREDENTIAL_INFO)</c>. This structure might be a larger value in 
     *       the future, indicating a newer version of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * SHA-1 hash of the certificate referenced.
     * @type {Array<Byte>}
     */
    rgbHashOfCert{
        get {
            if(!this.HasProp("__rgbHashOfCertProxyArray"))
                this.__rgbHashOfCertProxyArray := Win32FixedArray(this.ptr + 4, 20, Primitive, "char")
            return this.__rgbHashOfCertProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
