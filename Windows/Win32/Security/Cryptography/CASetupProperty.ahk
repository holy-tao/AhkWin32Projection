#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies a property type for setup and configuration of a certification authority (CA) role when using the ICertSrvSetup interface.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/ne-casetup-casetupproperty
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CASetupProperty{

    /**
     * A value that specifies a property type that is not valid.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_INVALID => -1

    /**
     * A <b>VT_I4</b> value that specifies a value of the <a href="https://docs.microsoft.com/windows/desktop/api/certsrv/ne-certsrv-enum_catypes">ENUM_CATYPES</a> enumeration.
 * 
 * If the computer is not joined to a domain, or the caller
 * 
 * is not an Enterprise or Domain administrator but is a local administrator, the default value is <b>ENUM_STANDALONE_ROOTCA</b>. If the computer is joined to a domain, the caller is an Enterprise or Domain administrator, and an enterprise root CA already exists, the default is <b>ENUM_ENTERPRISE_SUBCA</b>, or if no enterprise root CA exists, the default value is <b>ENUM_ENTERPRISE_ROOTCA</b>.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_CATYPE => 0

    /**
     * A <b>VT_DISPATCH</b> value, in the form of a <b>CCertSrvSetupKeyInformation</b>  object, that specifies the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> information used for a CA certificate. By default, setup generates a new key
 * 
 * with a 2048-bit key length for root and subordinate CAs using "Microsoft
 * 
 * Strong Cryptographic Provider."
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_CAKEYINFORMATION => 1

    /**
     * A <b>VT_BOOL</b> value that indicates whether the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) is allowed to interact with the desktop. The default is false.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_INTERACTIVE => 2

    /**
     * A <b>VT_BSTR</b> value that contains the common name for the CA. By default, the common 
 * 
 * name is <i>DomainName</i>-<i>LocalComputerName</i>-<i>CAName</i>.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_CANAME => 3

    /**
     * A <b>VT_BSTR</b> value that contains the distinguished name suffix for a CA name.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_CADSSUFFIX => 4

    /**
     * A <b>VT_I4</b> value that specifies the number of units in the validity period as specified by the <b>ENUM_SETUPPROP_VALIDITYPERIODUNIT</b> property type. For a subordinate CA, the validity period is determined by the parent CA.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_VALIDITYPERIOD => 5

    /**
     * A <b>VT_I4</b> value that specifies a value of the <a href="https://docs.microsoft.com/windows/desktop/api/celib/ne-celib-enum_period">ENUM_PERIOD</a> enumeration that indicates the time units of the validity period. For a subordinate CA, the validity period time unit is determined by the parent CA.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_VALIDITYPERIODUNIT => 6

    /**
     * A <b>VT_BSTR</b> value that specifies the expected expiration date of the root CA certificate based on the current time, validity period, and validity period unit. For a subordinate CA, the expiration date is
 * 
 * determined by its parent CA.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_EXPIRATIONDATE => 7

    /**
     * A <b>VT_BOOL</b> value that specifies whether to preserve an existing database. This is relevant under the following conditions:
 * 
 * <ul>
 * <li>A CA 
 * 
 * was previously installed (and later uninstalled) on this computer.</li>
 * <li>An existing key (and its associated certificate) is being used for installation.</li>
 * <li>A database exists in the given database directory.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_PRESERVEDATABASE => 8

    /**
     * A <b>VT_BSTR</b> value that specifies the path of the directory where CA database files are stored after installation. The default path is %SystemRoot%\System32\Certlog\.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_DATABASEDIRECTORY => 9

    /**
     * A <b>VT_BSTR</b> value that specifies the path of the directory where CA database log files are stored after installation. The default path is %SystemRoot%\System32\Certlog\.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_LOGDIRECTORY => 10

    /**
     * This value is not used and is reserved for future use.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_SHAREDFOLDER => 11

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the computer that is hosting the parent CA. This value is only applicable if a subordinate CA is being installed. There is no default value.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_PARENTCAMACHINE => 12

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the parent CA. This value is only applicable if a subordinate CA is being installed. There is no default value.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_PARENTCANAME => 13

    /**
     * A <b>VT_BSTR</b> value that specifies the file path to use to save a subordinate CA request, so that it can be submitted later to the parent CA. The default value is %SystemDrive%&#92;&#92;<i>DNSMachineName</i>_<i>CAName</i>.req.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_REQUESTFILE => 14

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the computer that is hosting the CA. This value is only applicable if support for the Certification Authority Web Enrollment role is being installed. There is no default value.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_WEBCAMACHINE => 15

    /**
     * A <b>VT_BSTR</b> value that specifies the name of the CA. This value is only applicable if support for the Certification Authority Web Enrollment role is being installed. There is no default value.
     * @type {Integer (Int32)}
     */
    static ENUM_SETUPPROP_WEBCANAME => 16
}
