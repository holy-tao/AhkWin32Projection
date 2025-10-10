#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the subject to import into the CryptUIWizImport function.
 * @see https://docs.microsoft.com/windows/win32/api//cryptuiapi/ns-cryptuiapi-cryptui_wiz_import_src_info
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class CRYPTUI_WIZ_IMPORT_SRC_INFO extends Win32Struct
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
    dwSubjectChoice {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Char>}
     */
    pwszFileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CERT_CONTEXT>}
     */
    pCertContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CTL_CONTEXT>}
     */
    pCTLContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CRL_CONTEXT>}
     */
    pCRLContext {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Void>}
     */
    hCertStore {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a null-terminated Unicode string that contains the password used to access the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a>.  A password is required if <b>pwszFileName</b> contains a PFX BLOB.  If a password is not required, the variable can be an empty string. This member cannot be <b>NULL</b>.
     * @type {Pointer<Char>}
     */
    pwszPassword {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
