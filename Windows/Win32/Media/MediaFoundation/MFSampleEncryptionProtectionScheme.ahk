#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the supported protection schemes for encrypted samples.
 * @remarks
 * The encryption scheme for a sample is specified using the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-encryption-protectionscheme">MFSampleExtension_Encryption_ProtectionScheme</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfsampleencryptionprotectionscheme
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFSampleEncryptionProtectionScheme {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No encryption scheme.
     * @type {Integer (Int32)}
     */
    static MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_NONE => 0

    /**
     * The encryption scheme is AES counter mode (CTR).
     * @type {Integer (Int32)}
     */
    static MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CTR => 1

    /**
     * The encryption scheme is Cipher Block Chaining (CBC).
     * @type {Integer (Int32)}
     */
    static MF_SAMPLE_ENCRYPTION_PROTECTION_SCHEME_AES_CBC => 2
}
