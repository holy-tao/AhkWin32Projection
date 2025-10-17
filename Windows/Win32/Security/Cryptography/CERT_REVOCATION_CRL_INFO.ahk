#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information updated by a certificate revocation list (CRL) revocation type handler.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_revocation_crl_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_REVOCATION_CRL_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Pointer<CRL_CONTEXT>}
     */
    pBaseCrlContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer<CRL_CONTEXT>}
     */
    pDeltaCrlContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to an entry in either the base CRL or the delta CRL.
     * @type {Pointer<CRL_ENTRY>}
     */
    pCrlEntry {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * <b>TRUE</b> if <b>pCrlEntry</b> points to an entry in the delta CRL. <b>FALSE</b> if <b>pCrlEntry</b> points to an entry in the base CRL.
     * @type {BOOL}
     */
    fDeltaCrlEntry {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
