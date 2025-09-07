#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a property type for setup and configuration of a Microsoft Simple Certificate Enrollment Protocol (SCEP) role using IMSCEPSetup.
 * @see https://learn.microsoft.com/windows/win32/api/casetup/ne-casetup-mscepsetupproperty
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class MSCEPSetupProperty{

    /**
     * A <b>VT_BOOL</b> value that specifies whether the Microsoft SCEP ISAPI Extension runs as the  local system user or under a separate user account. For remote CA or standalone CA configurations, by default this is set to <b>VARIANT_FALSE</b>. For a local enterprise CA configuration, by default this is set to <b>VARIANT_TRUE</b>.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_USELOCALSYSTEM => 0

    /**
     * A <b>VT_BOOL</b> value that specifies whether to require an SCEP challenge phrase to enroll. By default, setup sets this to <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_USECHALLENGE => 1

    /**
     * A <b>VT_BSTR</b> value that specifies the common name for Microsoft SCEP registration authority (RA) certificate name information. By default, the common name format is <i>MachineName</i>"-RA", where <i>MachineName</i> is the local machine name.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_CN => 2

    /**
     * A <b>VT_BSTR</b> value that specifies an optional email address to be added in Microsoft SCEP RA certificate name information.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_EMAIL => 3

    /**
     * A <b>VT_BSTR</b> value that specifies an optional company name to be added in Microsoft SCEP RA certificate name information.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_COMPANY => 4

    /**
     * A <b>VT_BSTR</b> value that specifies an optional department name to be added in Microsoft SCEP RA certificate name information.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_DEPT => 5

    /**
     * A <b>VT_BSTR</b> value that specifies an optional city name to be added in Microsoft SCEP RA certificate name information.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_CITY => 6

    /**
     * A <b>VT_BSTR</b> value that specifies an optional state name to be added in Microsoft SCEP RA certificate name information.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_STATE => 7

    /**
     * A <b>VT_BSTR</b> value that specifies the country or region name to be added in Microsoft SCEP RA certificate name information. By default, setup uses the country or region setting for the local computer.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_RANAME_COUNTRY => 8

    /**
     * A <b>VT_IDISPATCH</b> value that is made up of an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object used to create a Microsoft SCEP signing certificate. Setup creates a signing certificate based on an "EnrollmentAgentOffline" template.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_SIGNINGKEYINFORMATION => 9

    /**
     * A <b>VT_IDISPATCH</b> value that is made up of an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object used to create a Microsoft SCEP key exchange certificate. Setup creates a key exchange certificate based on a "CEPEncryption" template.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_EXCHANGEKEYINFORMATION => 10

    /**
     * A <b>VT_BSTR</b> value that specifies the Certification Authority (CA) information. By default, setup uses the local CA. If a local CA is present,  you should not set this property.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_CAINFORMATION => 11

    /**
     * A <b>VT_BSTR</b> value that specifies the URL for use by routers to connect and send certificate requests using SCEP. By default, setup uses http://<i>MachineName</i>/certsrv/mscep/mscep.dll, where <i>MachineName</i> is the local machine name. This is a read-only property.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_MSCEPURL => 12

    /**
     * A <b>VT_BSTR</b> value that specifies the URL for use by router administrators to connect and obtain a challenge phrase. By default, setup uses http://<i>MachineName</i>/certsrv/mscep/, where <i>MachineName</i> is the local machine name. This is a read-only property.
     * @type {Integer (Int32)}
     */
    static ENUM_CEPSETUPPROP_CHALLENGEURL => 13
}
