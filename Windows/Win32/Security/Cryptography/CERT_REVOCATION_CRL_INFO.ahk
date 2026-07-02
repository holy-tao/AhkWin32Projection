#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRL_CONTEXT.ahk" { CRL_CONTEXT }
#Import ".\CRL_ENTRY.ahk" { CRL_ENTRY }

/**
 * Contains information updated by a certificate revocation list (CRL) revocation type handler.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_revocation_crl_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_REVOCATION_CRL_INFO {
    #StructPack 8

    /**
     * Size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    pBaseCrlContext : CRL_CONTEXT.Ptr

    pDeltaCrlContext : CRL_CONTEXT.Ptr

    /**
     * A pointer to an entry in either the base CRL or the delta CRL.
     */
    pCrlEntry : CRL_ENTRY.Ptr

    /**
     * <b>TRUE</b> if <b>pCrlEntry</b> points to an entry in the delta CRL. <b>FALSE</b> if <b>pCrlEntry</b> points to an entry in the base CRL.
     */
    fDeltaCrlEntry : BOOL

}
