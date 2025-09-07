#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the certificate credentials. The QueryCredentialsAttributes function uses this structure.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-secpkgcredentials_cert
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgCredentials_Cert extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size of the encoded certificate.
     * @type {Integer}
     */
    EncodedCertSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The encoded certificate.
     * @type {Pointer<Byte>}
     */
    EncodedCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
