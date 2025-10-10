#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains a request to modify a certificate trust list (CTL). This structure is used in the CertModifyCertificatesToTrust function.
 * @see https://docs.microsoft.com/windows/win32/api//cryptdlg/ns-cryptdlg-ctl_modify_request
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CTL_MODIFY_REQUEST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that contains the certificate to change the trust on.
     * @type {Pointer<CERT_CONTEXT>}
     */
    pccert {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwOperation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The error code generated for this operation.
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
