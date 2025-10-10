#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the GetProperty and SetProperty methods on the ICertificateEnrollmentPolicyServerSetup interface to specify the type of property information to retrieve or set.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/ne-casetup-cepsetupproperty
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CEPSetupProperty{

    /**
     * The property value contains the type of authentication procedure used.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_AUTHENTICATION => 0

    /**
     * The property value contains the hash of the certificate, if any, used for authentication.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_SSLCERTHASH => 1

    /**
     * The property value contains the Certificate Enrollment Policy (CEP) Web Service URL.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_URL => 2

    /**
     * The property value indicates  whether to set up the Enrollment Policy Server in a mode that returns policies for KeyBasedRenewal templates only.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_KEYBASED_RENEWAL => 3
}
