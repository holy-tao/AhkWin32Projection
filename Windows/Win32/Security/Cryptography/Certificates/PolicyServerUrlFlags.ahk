#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains certificate enrollment policy (CEP) server flags.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-policyserverurlflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class PolicyServerUrlFlags{

    /**
     * No flags are specified.
     * @type {Integer (Int32)}
     */
    static PsfNone => 0

    /**
     * Policy information is specified in group policy by an administrator.
     * @type {Integer (Int32)}
     */
    static PsfLocationGroupPolicy => 1

    /**
     * Policy information is specified in the registry.
     * @type {Integer (Int32)}
     */
    static PsfLocationRegistry => 2

    /**
     * Specifies that certificate enrollments and renewals include client specific data in a <b>ClientId</b> attribute. Examples include the name of the cryptographic service provider, the Windows version number, the user name, the computer DNS name, and the domain controller DNS name. This flag can be set by group policy.
     * 
     * This flag has been included to address privacy concerns that can arise during enrollment to servers that are managed by administrators other than those who manage the forest in which the user resides. By not setting this flag, you can prevent sending personal information to non-local administrators.
     * @type {Integer (Int32)}
     */
    static PsfUseClientId => 4

    /**
     * Automatic certificate enrollment is enabled.
     * @type {Integer (Int32)}
     */
    static PsfAutoEnrollmentEnabled => 16

    /**
     * Specifies that the certificate of the issuing CA need not be trusted by the client to install a certificate signed by the CA.
     * @type {Integer (Int32)}
     */
    static PsfAllowUnTrustedCA => 32
}
