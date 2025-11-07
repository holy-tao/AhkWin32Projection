#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DS_NAME_FORMAT enumeration provides formats to use for input and output names for the DsCrackNames function.
 * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/ne-ntdsapi-ds_name_format
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_NAME_FORMAT{

    /**
     * Indicates the name is using an unknown name type. This format can impact performance because it forces the server to attempt to match all possible
     *     formats. Only use this value if the input format is unknown.
     * @type {Integer (Int32)}
     */
    static DS_UNKNOWN_NAME => 0

    /**
     * Indicates that the fully qualified distinguished name is used. For example:
     * 
     * CN=someone,OU=Users,DC=Engineering,DC=Fabrikam,DC=Com
     * @type {Integer (Int32)}
     */
    static DS_FQDN_1779_NAME => 1

    /**
     * Indicates a Windows NT 4.0 account name. For example:
     * 
     * Engineering\someone
     * 
     * The domain-only version includes two trailing backslashes (\\).
     * @type {Integer (Int32)}
     */
    static DS_NT4_ACCOUNT_NAME => 2

    /**
     * Indicates a user-friendly display name, for example, Jeff Smith. The display name is not necessarily the same as relative distinguished name (RDN).
     * @type {Integer (Int32)}
     */
    static DS_DISPLAY_NAME => 3

    /**
     * Indicates a GUID string that the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-iidfromstring">IIDFromString</a> function returns. For example:
     * 
     * {4fa050f0-f561-11cf-bdd9-00aa003a77b6}
     * @type {Integer (Int32)}
     */
    static DS_UNIQUE_ID_NAME => 6

    /**
     * Indicates a complete canonical name. For example:
     * 
     * engineering.fabrikam.com/software/someone
     * 
     * The domain-only version includes a trailing forward slash (/).
     * @type {Integer (Int32)}
     */
    static DS_CANONICAL_NAME => 7

    /**
     * Indicates that it is using the user principal name (UPN). For example:
     * 
     * someone@engineering.fabrikam.com
     * @type {Integer (Int32)}
     */
    static DS_USER_PRINCIPAL_NAME => 8

    /**
     * This element is the same as <b>DS_CANONICAL_NAME</b> except that the rightmost forward slash (/) is replaced with a newline character (\n), even in a domain-only case. For example:
     * 
     * engineering.fabrikam.com/software\nsomeone
     * @type {Integer (Int32)}
     */
    static DS_CANONICAL_NAME_EX => 9

    /**
     * Indicates it is using a generalized service principal name. For example:
     * 
     * www/www.fabrikam.com@fabrikam.com
     * @type {Integer (Int32)}
     */
    static DS_SERVICE_PRINCIPAL_NAME => 10

    /**
     * Indicates a Security Identifier (SID) for the object. This can be either the current SID or a SID from the object SID history. The SID string can use either the standard string representation of a SID, or one of the string constants defined in Sddl.h. For more information about converting a binary SID into a SID string, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/sid-strings">SID Strings</a>. The following is an example of a SID string:
     * 
     * S-1-5-21-397955417-626881126-188441444-501
     * @type {Integer (Int32)}
     */
    static DS_SID_OR_SID_HISTORY_NAME => 11

    /**
     * Not supported by the Directory Service (DS) APIs.
     * @type {Integer (Int32)}
     */
    static DS_DNS_DOMAIN_NAME => 12
}
