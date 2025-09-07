#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the certificate contexts of both a subject and a certificate issuer.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_find_issued_for_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRL_FIND_ISSUED_FOR_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a subject's certificate context.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pSubjectCert {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a certificate issuer's certificate context.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pIssuerCert {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
