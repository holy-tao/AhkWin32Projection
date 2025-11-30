#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the supported protection schemes for encrypted samples.
 * @remarks
 * 
 * The encryption scheme for a sample is specified using the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-encryption-protectionscheme">MFSampleExtension_Encryption_ProtectionScheme</a> attribute.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfsampleencryptionprotectionscheme
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFSampleEncryptionProtectionScheme extends Win32Enum{

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
