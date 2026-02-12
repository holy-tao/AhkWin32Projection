#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines reasons for the revocation and renewal of a certificate for a media component.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalreasons
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class RevocationAndRenewalReasons extends Win32BitflagEnum{

    /**
     * User-mode component.
     * @type {Integer (UInt32)}
     */
    static UserModeComponentLoad => 1

    /**
     * Kernel-mode component.
     * @type {Integer (UInt32)}
     */
    static KernelModeComponentLoad => 2

    /**
     * App component.
     * @type {Integer (UInt32)}
     */
    static AppComponent => 4

    /**
     * Could not load the global revocation list (GRL).
     * @type {Integer (UInt32)}
     */
    static GlobalRevocationListLoadFailed => 16

    /**
     * The GRL signature is invalid.
     * @type {Integer (UInt32)}
     */
    static InvalidGlobalRevocationListSignature => 32

    /**
     * The GRL was not found.
     * @type {Integer (UInt32)}
     */
    static GlobalRevocationListAbsent => 4096

    /**
     * A trusted component was revoked.
     * @type {Integer (UInt32)}
     */
    static ComponentRevoked => 8192

    /**
     * A certificate's extended key usage (EKU) object is invalid.
     * @type {Integer (UInt32)}
     */
    static InvalidComponentCertificateExtendedKeyUse => 16384

    /**
     * A certificate in a trusted component's certificate chain was revoked.
     * @type {Integer (UInt32)}
     */
    static ComponentCertificateRevoked => 32768

    /**
     * The root certificate is not valid.
     * @type {Integer (UInt32)}
     */
    static InvalidComponentCertificateRoot => 65536

    /**
     * The high-security certificate for authenticating the protected environment (PE) was revoked.
     * 
     * The high-security certificate is typically used by ITAs that handle high-definition content and next-generation formats such as HD-DVD.
     * @type {Integer (UInt32)}
     */
    static ComponentHighSecurityCertificateRevoked => 131072

    /**
     * The low-security certificate for authenticating the PE was revoked.
     * 
     * The low-security certificate is typically used by ITAs that handle standard-definition content and current-generation formats.
     * @type {Integer (UInt32)}
     */
    static ComponentLowSecurityCertificateRevoked => 262144

    /**
     * A boot driver could not be verified.
     * @type {Integer (UInt32)}
     */
    static BootDriverVerificationFailed => 1048576

    /**
     * A component was signed by a test certificate.
     * @type {Integer (UInt32)}
     */
    static ComponentSignedWithTestCertificate => 16777216

    /**
     * A certificate chain was not well-formed, or a boot driver is unsigned or is signed with an untrusted certificate.
     * @type {Integer (UInt32)}
     */
    static EncryptionFailure => 268435456
}
