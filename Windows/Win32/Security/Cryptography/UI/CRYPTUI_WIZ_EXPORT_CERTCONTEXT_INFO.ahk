#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information that controls the operation of the CryptUIWizExport function when a certificate is the object being exported.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_certcontext_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwExportFormat {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Indicates whether the certificate chain should be exported in addition to the certificate. Contains nonzero to export the chain or zero to not export the chain.
     * @type {Integer}
     */
    fExportChain {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Indicates whether the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> should be exported in addition to the certificate. Contains nonzero to export the private key or zero to not export the private key.
     * @type {Integer}
     */
    fExportPrivateKeys {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * A pointer to a null-terminated Unicode string that contains the password used to access the private key.  This is required if <b>fExportPrivateKeys</b> is nonzero and is otherwise ignored.
     * @type {Pointer<PWSTR>}
     */
    pwszPassword {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Indicates whether strong encryption should be used in the export process. Contains nonzero to use strong encryption or zero to use weak encryption. This must be nonzero if <b>dwExportFormat</b> is <b>CRYPTUI_WIZ_EXPORT_FORMAT_PFX</b>. If this is nonzero, the PFX <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> produced is not compatible with Internet Explorer 4.0 or earlier versions.
     * 
     * <b>Note</b>  We recommend that you set this to nonzero; otherwise, a substantially weaker encryption algorithm is used in the export process.
     * @type {Integer}
     */
    fStrongEncryption {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
