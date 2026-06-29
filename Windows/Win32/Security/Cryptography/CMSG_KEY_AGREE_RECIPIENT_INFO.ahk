#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_PUBLIC_KEY_INFO.ahk" { CERT_PUBLIC_KEY_INFO }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import ".\CERT_ID_OPTION.ahk" { CERT_ID_OPTION }
#Import ".\CRYPT_ALGORITHM_IDENTIFIER.ahk" { CRYPT_ALGORITHM_IDENTIFIER }
#Import ".\CERT_ISSUER_SERIAL_NUMBER.ahk" { CERT_ISSUER_SERIAL_NUMBER }
#Import ".\CERT_ID.ahk" { CERT_ID }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\CRYPT_BIT_BLOB.ahk" { CRYPT_BIT_BLOB }
#Import ".\CMSG_KEY_AGREE_ORIGINATOR.ahk" { CMSG_KEY_AGREE_ORIGINATOR }
#Import ".\CMSG_RECIPIENT_ENCRYPTED_KEY_INFO.ahk" { CMSG_RECIPIENT_ENCRYPTED_KEY_INFO }

/**
 * Contains information used for key agreement algorithms.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_key_agree_recipient_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMSG_KEY_AGREE_RECIPIENT_INFO {
    #StructPack 8

    /**
     * A <b>DWORD</b> that indicates the version of the structure. Always set to three.
     */
    dwVersion : UInt32

    /**
     * A <b>DWORD</b> that indicates the key identifier to use.
     */
    dwOriginatorChoice : CMSG_KEY_AGREE_ORIGINATOR

    OriginatorCertId : CERT_ID

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CRYPT_DATA_BLOB</a> that indicates that a different key is generated each time the same two parties generate a pair of keys. The sender provides the bits of this <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> with some key agreement algorithms. This member can be <b>NULL</b>.
     */
    UserKeyingMaterial : CRYPT_INTEGER_BLOB

    /**
     * A 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-crypt_algorithm_identifier">CRYPT_ALGORITHM_IDENTIFIER</a> that identifies the key-encryption algorithm and any associated parameters used to encrypt the content encryption key.
     */
    KeyEncryptionAlgorithm : CRYPT_ALGORITHM_IDENTIFIER

    /**
     * The number of elements in the <b>rgpRecipientEncryptedKeys</b> array.
     */
    cRecipientEncryptedKeys : UInt32

    /**
     * The address of an array of <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmsg_recipient_encrypted_key_info">CMSG_RECIPIENT_ENCRYPTED_KEY_INFO</a> structures that contains information about the key recipients. The <b>cRecipientEncryptedKeys</b> member contains the number of elements in this array.
     */
    rgpRecipientEncryptedKeys : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'OriginatorPublicKeyInfo', { type: CERT_PUBLIC_KEY_INFO, offset: 8 })
        this.DeleteProp("__New")
    }
}
