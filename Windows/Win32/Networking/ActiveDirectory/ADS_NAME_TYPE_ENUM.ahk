#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the formats used for representing distinguished names.
 * @remarks
 * Code examples written in C++, Visual Basic, and VBS/ASP can be found in the discussions of the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadsnametranslate">IADsNameTranslate</a> interface.
  * 
  * Because VBScript cannot read data from a type library, an application must use the appropriate numeric constants, instead of the symbolic constants, to set the appropriate flags. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in  VBScript applications.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_name_type_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_NAME_TYPE_ENUM{

    /**
     * Name format as specified in RFC 1779. For example, "CN=Jeff Smith,CN=users,DC=Fabrikam,DC=com".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_1779 => 1

    /**
     * Canonical name format. For example, "Fabrikam.com/Users/Jeff Smith".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_CANONICAL => 2

    /**
     * Account name format used in Windows. For example, "Fabrikam\JeffSmith".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_NT4 => 3

    /**
     * Display name format. For example, "Jeff Smith".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_DISPLAY => 4

    /**
     * Simple domain name format. For example, "JeffSmith@Fabrikam.com".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_DOMAIN_SIMPLE => 5

    /**
     * Simple enterprise name format. For example, "JeffSmith@Fabrikam.com".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_ENTERPRISE_SIMPLE => 6

    /**
     * Global Unique Identifier format. For example, "{95ee9fff-3436-11d1-b2b0-d15ae3ac8436}".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_GUID => 7

    /**
     * Unknown name type. The system will estimate the format. This element is a meaningful option only with the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-set">IADsNameTranslate.Set</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-setex">IADsNameTranslate.SetEx</a> method, but not with the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-get">IADsNameTranslate.Get</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadsnametranslate-getex">IADsNameTranslate.GetEx</a> method.
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_UNKNOWN => 8

    /**
     * User principal name format. For example, "JeffSmith@Fabrikam.com".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_USER_PRINCIPAL_NAME => 9

    /**
     * Extended canonical name format. For example, "Fabrikam.com/Users Jeff Smith".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_CANONICAL_EX => 10

    /**
     * Service principal name format. For example, "www/www.fabrikam.com@fabrikam.com".
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_SERVICE_PRINCIPAL_NAME => 11

    /**
     * A SID string, as defined in the Security Descriptor Definition Language (SDDL), for either the SID of the current object or one from the object SID history. For example, "O:AOG:DAD:(A;;RPWPCCDCLCSWRCWDWOGA;;;S-1-0-0)" For more information, see  <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-descriptor-string-format">Security Descriptor String Format</a>.
     * @type {Integer (Int32)}
     */
    static ADS_NAME_TYPE_SID_OR_SID_HISTORY_NAME => 12
}
