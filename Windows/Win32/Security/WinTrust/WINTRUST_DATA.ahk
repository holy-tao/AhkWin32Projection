#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used when calling WinVerifyTrust to pass necessary information into the trust providers.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-wintrust_data
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class WINTRUST_DATA extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a data buffer used to pass policy-specific data to a policy provider. This member can be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pPolicyCallbackData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to a data buffer used to pass <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">subject interface package</a> (SIP)-specific data to a SIP provider. This member can be <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pSIPClientData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    dwUIChoice {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    fdwRevocationChecks {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * 
     * @type {Integer}
     */
    dwUnionChoice {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<WINTRUST_FILE_INFO>}
     */
    pFile {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINTRUST_CATALOG_INFO>}
     */
    pCatalog {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINTRUST_BLOB_INFO>}
     */
    pBlob {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINTRUST_SGNR_INFO>}
     */
    pSgnr {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINTRUST_CERT_INFO>}
     */
    pCert {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStateAction {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A handle to the state data. The contents of this member depends on the value of the <b>dwStateAction</b> member.
     * @type {Pointer<HANDLE>}
     */
    hWVTStateData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Reserved for future use. Set to <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    pwszURLReference {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * 
     * @type {Integer}
     */
    dwProvFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * 
     * @type {Integer}
     */
    dwUIContext {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Pointer to a [WINTRUST_SIGNATURE_SETTINGS](/windows/desktop/api/wintrust/ns-wintrust-wintrust_signature_settings) structure.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     * @type {Pointer<WINTRUST_SIGNATURE_SETTINGS>}
     */
    pSignatureSettings {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }
}
