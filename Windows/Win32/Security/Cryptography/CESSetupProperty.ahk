#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the GetProperty and SetProperty methods on the ICertificateEnrollmentServerSetup interface to specify the type of property information to retrieve or set.
 * @see https://learn.microsoft.com/windows/win32/api/casetup/ne-casetup-cessetupproperty
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CESSetupProperty{

    /**
     * The property value specifies whether the server context is <b>ApplicationPoolIdentity</b>.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_USE_IISAPPPOOLIDENTITY => 0

    /**
     * The property value contains a certification authority (CA) configuration string.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_CACONFIG => 1

    /**
     * The property value specifies the type of authentication procedure used.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_AUTHENTICATION => 2

    /**
     * The property value contains a hash of the certificate used for authentication.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_SSLCERTHASH => 3

    /**
     * The property value contains the Certificate Enrollment Web Service (CES) URL.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_URL => 4

    /**
     * The property value specifies whether CES can process only certificate renewals.
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_RENEWALONLY => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ENUM_CESSETUPPROP_ALLOW_KEYBASED_RENEWAL => 6
}
