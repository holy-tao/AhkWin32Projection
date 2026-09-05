#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies a format for a directory service object name.
 * @see https://learn.microsoft.com/windows/win32/api/secext/ne-secext-extended_name_format
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class EXTENDED_NAME_FORMAT extends Win32Enum {

    /**
     * An unknown name type.
     * Native name: NameUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The fully qualified distinguished name (for example, CN=Jeff Smith,OU=Users,DC=Engineering,DC=Microsoft,DC=Com).
     * Native name: NameFullyQualifiedDN
     * @type {Integer (Int32)}
     */
    static FullyQualifiedDN => 1

    /**
     * A legacy account name (for example, Engineering\JSmith). The domain-only version includes trailing backslashes (\\).
     * Native name: NameSamCompatible
     * @type {Integer (Int32)}
     */
    static SamCompatible => 2

    /**
     * A "friendly" display name (for example, Jeff Smith). The display name is not necessarily the defining relative distinguished name (RDN).
     * Native name: NameDisplay
     * @type {Integer (Int32)}
     */
    static Display => 3

    /**
     * A GUID string that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iidfromstring">IIDFromString</a> function returns (for example, {4fa050f0-f561-11cf-bdd9-00aa003a77b6}).
     * Native name: NameUniqueId
     * @type {Integer (Int32)}
     */
    static UniqueId => 6

    /**
     * The complete canonical name (for example, engineering.microsoft.com/software/someone). The domain-only version includes a trailing forward slash (/).
     * Native name: NameCanonical
     * @type {Integer (Int32)}
     */
    static Canonical => 7

    /**
     * The user principal name (for example, someone@example.com).
     * Native name: NameUserPrincipal
     * @type {Integer (Int32)}
     */
    static UserPrincipal => 8

    /**
     * The same as NameCanonical except that the rightmost forward slash (/) is replaced with a new line character (\n), even in a domain-only case (for example, engineering.microsoft.com/software\nJSmith).
     * Native name: NameCanonicalEx
     * @type {Integer (Int32)}
     */
    static CanonicalEx => 9

    /**
     * The generalized service principal name (for example, www/www.microsoft.com@microsoft.com).
     * Native name: NameServicePrincipal
     * @type {Integer (Int32)}
     */
    static ServicePrincipal => 10

    /**
     * The DNS domain name followed by a backward-slash and the SAM user name.
     * Native name: NameDnsDomain
     * @type {Integer (Int32)}
     */
    static DnsDomain => 12

    /**
     * The first name or given name of the user. Note: This type is only available for **GetUserNameEx** calls for an Active Directory user.
     * Native name: NameGivenName
     * @type {Integer (Int32)}
     */
    static GivenName => 13

    /**
     * The last name or surname of the user. Note: This type is only available for **GetUserNameEx** calls for an Active Directory user.
     * Native name: NameSurname
     * @type {Integer (Int32)}
     */
    static Surname => 14
}
