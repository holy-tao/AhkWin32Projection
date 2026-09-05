#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of qualifier applied to a certificate policy.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-policyqualifiertype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class PolicyQualifierType extends Win32Enum {

    /**
     * The qualifier type is not specified.
     * Native name: PolicyQualifierTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The qualifier is a URL that points to a Certification Practice Statement (CPS) that has been defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> to outline the policies under which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a> was issued and the purposes for which the certificate can be used.
     * Native name: PolicyQualifierTypeUrl
     * @type {Integer (Int32)}
     */
    static Url => 1

    /**
     * The qualifier is a text statement to be displayed by the application to any user who relies on the certificate. The user notice identifies the permitted uses of the certificate.
     * Native name: PolicyQualifierTypeUserNotice
     * @type {Integer (Int32)}
     */
    static UserNotice => 2

    /**
     * Native name: PolicyQualifierTypeFlags
     * @type {Integer (Int32)}
     */
    static Flags => 3
}
