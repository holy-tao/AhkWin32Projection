#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of qualifier applied to a certificate policy.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-policyqualifiertype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class PolicyQualifierType{

    /**
     * The qualifier type is not specified.
     * @type {Integer (Int32)}
     */
    static PolicyQualifierTypeUnknown => 0

    /**
     * The qualifier is a URL that points to a Certification Practice Statement (CPS) that has been defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> to outline the policies under which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a> was issued and the purposes for which the certificate can be used.
     * @type {Integer (Int32)}
     */
    static PolicyQualifierTypeUrl => 1

    /**
     * The qualifier is a text statement to be displayed by the application to any user who relies on the certificate. The user notice identifies the permitted uses of the certificate.
     * @type {Integer (Int32)}
     */
    static PolicyQualifierTypeUserNotice => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PolicyQualifierTypeFlags => 3
}
