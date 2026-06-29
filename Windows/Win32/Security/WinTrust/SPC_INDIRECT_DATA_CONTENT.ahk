#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\Cryptography\CRYPT_ATTRIBUTE_TYPE_VALUE.ahk" { CRYPT_ATTRIBUTE_TYPE_VALUE }
#Import "..\Cryptography\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Is used in Authenticode signatures to store the digest and other attributes of the signed file.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-spc_indirect_data_content
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct SPC_INDIRECT_DATA_CONTENT {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_attribute_type_value">CRYPT_ATTRIBUTE_TYPE_VALUE</a> that contains attributes of the digested file.
     */
    Data : CRYPT_ATTRIBUTE_TYPE_VALUE

    /**
     * Specifies the digest algorithm used to hash the file.
     */
    DigestAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * The Authenticode digest value of the file using the algorithm specified in the  <i>DigestAlgorithm</i> parameter.
     */
    Digest : CRYPT_INTEGER_BLOB

}
