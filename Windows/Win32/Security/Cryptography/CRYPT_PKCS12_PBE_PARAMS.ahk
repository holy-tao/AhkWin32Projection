#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters used to create an encryption key, initialization vector (IV), or Message Authentication Code (MAC) key for a PKCS
 * @remarks
 * The buffer that contains the salt immediately follows the <b>CRYPT_PKCS12_PBE_PARAMS</b> structure.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptexportkey">NCryptExportKey</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptimportkey">NCryptImportKey</a> functions consume the <b>CRYPT_PKCS12_PBE_PARAMS</b> structure as an <a href="https://docs.microsoft.com/windows/win32/api/bcrypt/ns-bcrypt-bcryptbuffer">NCryptBuffer</a> structure in the <i>pParameterList</i> parameter.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">PKCS #12</a> standard recommends a value of 1024 or greater for the <b>iIterations</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_pkcs12_pbe_params
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_PKCS12_PBE_PARAMS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * An integer that specifies the number of hashes of the password and salt that are used to create the key.
     * @type {Integer}
     */
    iIterations {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An integer that specifies the size, in bytes, of the salt used to create the key.
     * @type {Integer}
     */
    cbSalt {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
