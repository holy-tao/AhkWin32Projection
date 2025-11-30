#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies a format for a directory service object name.
 * @see https://docs.microsoft.com/windows/win32/api//secext/ne-secext-extended_name_format
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class EXTENDED_NAME_FORMAT extends Win32Enum{

    /**
     * An unknown name type.
     * @type {Integer (Int32)}
     */
    static NameUnknown => 0

    /**
     * The fully qualified distinguished name (for example, CN=Jeff Smith,OU=Users,DC=Engineering,DC=Microsoft,DC=Com).
     * @type {Integer (Int32)}
     */
    static NameFullyQualifiedDN => 1

    /**
     * A legacy account name (for example, Engineering\JSmith). The domain-only version includes trailing backslashes (\\).
     * @type {Integer (Int32)}
     */
    static NameSamCompatible => 2

    /**
     * A "friendly" display name (for example, Jeff Smith). The display name is not necessarily the defining relative distinguished name (RDN).
     * @type {Integer (Int32)}
     */
    static NameDisplay => 3

    /**
     * A GUID string that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iidfromstring">IIDFromString</a> function returns (for example, {4fa050f0-f561-11cf-bdd9-00aa003a77b6}).
     * @type {Integer (Int32)}
     */
    static NameUniqueId => 6

    /**
     * The complete canonical name (for example, engineering.microsoft.com/software/someone). The domain-only version includes a trailing forward slash (/).
     * @type {Integer (Int32)}
     */
    static NameCanonical => 7

    /**
     * The user principal name (for example, someone@example.com).
     * @type {Integer (Int32)}
     */
    static NameUserPrincipal => 8

    /**
     * The same as NameCanonical except that the rightmost forward slash (/) is replaced with a new line character (\n), even in a domain-only case (for example, engineering.microsoft.com/software\nJSmith).
     * @type {Integer (Int32)}
     */
    static NameCanonicalEx => 9

    /**
     * The generalized service principal name (for example, www/www.microsoft.com@microsoft.com).
     * @type {Integer (Int32)}
     */
    static NameServicePrincipal => 10

    /**
     * The DNS domain name followed by a backward-slash and the SAM user name.
     * @type {Integer (Int32)}
     */
    static NameDnsDomain => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NameGivenName => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static NameSurname => 14
}
