#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the cryptographic service provider (CSP) and private key information used to create a digital signature.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-provider-info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class SIGNER_PROVIDER_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the CSP used to create the digital signature. If the value of this member is **NULL**, the default provider is used.
     * @type {PWSTR}
     */
    pwszProviderName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The type of the CSP specified by the **pwszProviderName** member.
     * @type {Integer}
     */
    dwProviderType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The key specification. If this member is set to zero, the key specification in the **pwszPvkFileName** or **pwszKeyContainer** member is used. If there is more than one key specification in the **pwszKeyContainer** member, **AT\_SIGNATURE** is used. If it fails, **AT\_KEYEXCHANGE** is used.
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the type of private key information. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                               | Meaning                                                    |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|
     * | <span id="PVK_TYPE_FILE_NAME"></span><span id="pvk_type_file_name"></span><dl> <dt>**PVK\_TYPE\_FILE\_NAME**</dt> <dt>1 (0x1)</dt> </dl>         | The private key information is a file name.<br/>     |
     * | <span id="PVK_TYPE_KEYCONTAINER"></span><span id="pvk_type_keycontainer"></span><dl> <dt>**PVK\_TYPE\_KEYCONTAINER**</dt> <dt>2 (0x2)</dt> </dl> | The private key information is a key container.<br/> |
     * @type {Integer}
     */
    dwPvkChoice {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {PWSTR}
     */
    pwszPvkFileName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {PWSTR}
     */
    pwszKeyContainer {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 40
    }
}
