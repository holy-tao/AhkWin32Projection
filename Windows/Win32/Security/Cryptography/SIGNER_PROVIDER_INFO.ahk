#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SIGNER_PRIVATE_KEY_CHOICE.ahk" { SIGNER_PRIVATE_KEY_CHOICE }

/**
 * Specifies the cryptographic service provider (CSP) and private key information used to create a digital signature.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/signer-provider-info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SIGNER_PROVIDER_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The name of the CSP used to create the digital signature. If the value of this member is **NULL**, the default provider is used.
     */
    pwszProviderName : PWSTR

    /**
     * The type of the CSP specified by the **pwszProviderName** member.
     */
    dwProviderType : UInt32

    /**
     * The key specification. If this member is set to zero, the key specification in the **pwszPvkFileName** or **pwszKeyContainer** member is used. If there is more than one key specification in the **pwszKeyContainer** member, **AT\_SIGNATURE** is used. If it fails, **AT\_KEYEXCHANGE** is used.
     */
    dwKeySpec : UInt32

    /**
     * Specifies the type of private key information. This member can be one or more of the following values.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                               | Meaning                                                    |
     * |-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|
     * | <span id="PVK_TYPE_FILE_NAME"></span><span id="pvk_type_file_name"></span><dl> <dt>**PVK\_TYPE\_FILE\_NAME**</dt> <dt>1 (0x1)</dt> </dl>         | The private key information is a file name.<br/>     |
     * | <span id="PVK_TYPE_KEYCONTAINER"></span><span id="pvk_type_keycontainer"></span><dl> <dt>**PVK\_TYPE\_KEYCONTAINER**</dt> <dt>2 (0x2)</dt> </dl> | The private key information is a key container.<br/> |
     */
    dwPvkChoice : SIGNER_PRIVATE_KEY_CHOICE

    pwszPvkFileName : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'pwszKeyContainer', { type: PWSTR, offset: 32 })
        this.DeleteProp("__New")
    }
}
