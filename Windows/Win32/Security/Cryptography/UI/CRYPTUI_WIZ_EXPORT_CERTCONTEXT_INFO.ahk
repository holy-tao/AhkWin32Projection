#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CRYPTUI_WIZ_EXPORT_FORMAT.ahk" { CRYPTUI_WIZ_EXPORT_FORMAT }

/**
 * Contains information that controls the operation of the CryptUIWizExport function when a certificate is the object being exported.
 * @see https://learn.microsoft.com/windows/win32/api/cryptuiapi/ns-cryptuiapi-cryptui_wiz_export_certcontext_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct CRYPTUI_WIZ_EXPORT_CERTCONTEXT_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwSize : UInt32

    dwExportFormat : CRYPTUI_WIZ_EXPORT_FORMAT

    /**
     * Indicates whether the certificate chain should be exported in addition to the certificate. Contains nonzero to export the chain or zero to not export the chain.
     */
    fExportChain : BOOL

    /**
     * Indicates whether the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> should be exported in addition to the certificate. Contains nonzero to export the private key or zero to not export the private key.
     */
    fExportPrivateKeys : BOOL

    /**
     * A pointer to a null-terminated Unicode string that contains the password used to access the private key.  This is required if <b>fExportPrivateKeys</b> is nonzero and is otherwise ignored.
     */
    pwszPassword : PWSTR

    /**
     * Indicates whether strong encryption should be used in the export process. Contains nonzero to use strong encryption or zero to use weak encryption. This must be nonzero if <b>dwExportFormat</b> is <b>CRYPTUI_WIZ_EXPORT_FORMAT_PFX</b>. If this is nonzero, the PFX <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> produced is not compatible with Internet Explorer 4.0 or earlier versions.
     * 
     * <b>Note</b>  We recommend that you set this to nonzero; otherwise, a substantially weaker encryption algorithm is used in the export process.
     */
    fStrongEncryption : BOOL

}
