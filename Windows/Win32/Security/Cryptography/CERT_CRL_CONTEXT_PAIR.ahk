#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The CERT_CRL_CONTEXT_PAIR structure contains a certificate context and an associated CRL context.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_crl_context_pair
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CRL_CONTEXT_PAIR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a certificate context.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to the certificate revocation list context.
     * @type {Pointer<CRL_CONTEXT>}
     */
    pCrlContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
