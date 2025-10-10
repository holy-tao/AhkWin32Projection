#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the export policy for a private key.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-x509privatekeyexportflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509PrivateKeyExportFlags{

    /**
     * Export is not allowed. This is the default value.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_EXPORT_NONE => 0

    /**
     * The private key can be exported.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_EXPORT_FLAG => 1

    /**
     * The private key can be exported in plaintext form.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_PLAINTEXT_EXPORT_FLAG => 2

    /**
     * The private key can be exported once for archiving.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_ARCHIVING_FLAG => 4

    /**
     * The private key can be exported once in plaintext form for archiving.
     * @type {Integer (Int32)}
     */
    static XCN_NCRYPT_ALLOW_PLAINTEXT_ARCHIVING_FLAG => 8
}
