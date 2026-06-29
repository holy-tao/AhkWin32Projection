#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the 128-bit symmetric key information for an Advanced Encryption Standard (AES) cipher.
 * @remarks
 * The <b>CRYPT_AES_128_KEY_STATE</b> structure is used by the <a href="https://docs.microsoft.com/previous-versions/aa379853(v=vs.85)">CPImportKey</a> and <a href="https://docs.microsoft.com/previous-versions/aa378203(v=vs.85)">CPExportKey</a> functions when the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">key BLOB</a> was created by using the <i>dwBlobType</i>  parameter set to the <b>KEYSTATEBLOB</b> value.
 * 
 *    The Microsoft AES Cryptographic Provider only supports this structure in the context of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">Secure Sockets Layer protocol</a> (SSL), where the caller specified <b>PROV_DH_SCHANNEL</b> as the value for the <i>dwProvType</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_aes_128_key_state
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_AES_128_KEY_STATE {
    #StructPack 1

    /**
     * An array of hexadecimal values that specify a 128-bit <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cipher</a> key.
     */
    Key : Int8[16]

    /**
     * An array of hexadecimal values that specify an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/i-gly">initialization vector</a> (IV) for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cipher</a>.
     */
    IV : Int8[16]

    /**
     * An array of hexadecimal values that specify an 11-round encryption key schedule.
     */
    EncryptionState : Int8[176]

    /**
     * An array of hexadecimal values that specify an 11-round decryption key schedule.
     */
    DecryptionState : Int8[176]

    /**
     * An array of hexadecimal values that specify the feedback vector for a stage in the encryption or decryption process.
     */
    Feedback : Int8[16]

}
