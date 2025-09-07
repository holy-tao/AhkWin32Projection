#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the alternative name types that can be specified when initializing an IAlternativeName object.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-alternativenametype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class AlternativeNameType{

    /**
     * The name type is not identified.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_UNKNOWN => 0

    /**
     * The name consists of an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) and a byte array that contains the name value.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_OTHER_NAME => 1

    /**
     * The name is an email address such as  <i>someone@example.com</i>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_RFC822_NAME => 2

    /**
     * The name is a Domain Name System (DNS) name such as <i>MyDomain.Microsoft.com</i>. The format of a DNS name is <i>Host.Entity.Domain</i>. For more information about DNS, see RFC 1034 (Domain Names—Concepts and Facilities), and RFC 1035 (Domain Names—Implementation and Specification).
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_DNS_NAME => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_X400_ADDRESS => 4

    /**
     * The name is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> directory name such as <i>CN=administrators,CN=users,DC=nttest,DC=microsoft,DC=com</i>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_DIRECTORY_NAME => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_EDI_PARTY_NAME => 6

    /**
     * The name is a URL such as <i>http://www.adatum.com/</i>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_URL => 7

    /**
     * The name is an Internet Protocol (IP) address in dotted decimal format <i>123.456.789.123</i>.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_IP_ADDRESS => 8

    /**
     * The name is an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) registered with the International Standards Organization (ISO).
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_REGISTERED_ID => 9

    /**
     * The name is a Directory Service Agent GUID. The GUID identifies a server to the Active Directory replication system as a domain controller.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_GUID => 10

    /**
     * The name is a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">user principal name</a> (UPN). A UPN is a user logon name in email address format. That is, a UPN consists of a shorthand name for a user account followed by the DNS name of the Active Directory tree in which the user object resides. It has the form <i>UserName@DNS_suffix</i>. An example is <i>UserName@Microsoft.com</i> where Microsoft.com is the  DNS suffix and <i>UserName</i> is a placeholder for a shorthand name assigned by Microsoft to a user account.
     * @type {Integer (Int32)}
     */
    static XCN_CERT_ALT_NAME_USER_PRINCIPLE_NAME => 11
}
