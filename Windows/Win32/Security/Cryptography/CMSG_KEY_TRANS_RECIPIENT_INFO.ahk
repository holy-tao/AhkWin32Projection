#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The CMSG_KEY_TRANS_RECIPIENT_INFO structure contains information used in key transport algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_trans_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_TRANS_RECIPIENT_INFO {
    #StructPack 8

    /**
     * Indicates the version of the structure. If <b>RecipientId</b> uses the ISSUER_SERIAL_NUMBER to identify the recipient, <b>dwVersion</b> is set to zero. If <b>RecipientId</b> uses KEYID, <b>dwVersion</b> is set to two.
     */
    dwVersion : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_id">CERT_ID</a> that identifies the recipient. Currently, only ISSUER_SERIAL_NUMBER or KEYID choices in the <b>CERT_ID</b> are valid.
     */
    RecipientId : CERT_ID

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that contains the bytes of the encrypted session key.
     */
    EncryptedKey : CRYPT_INTEGER_BLOB

}
