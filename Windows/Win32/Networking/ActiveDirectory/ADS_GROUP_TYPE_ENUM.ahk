#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of group objects in ADSI.
 * @remarks
 * 
 * Because VBScript cannot read data from a type library, VBScript applications do not understand recognize constants, as defined above. Use the numerical constants, instead, to set the appropriate flags in your VBScript application. To use the symbolic constants as a good programming practice, write explicit declarations of such constants, as done here, in your VBScript application.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_group_type_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_GROUP_TYPE_ENUM{

    /**
     * Specifies a group that can contain accounts from the same domain and other global groups from the same domain. This type of group can be exported to a different domain.
     * @type {Integer (Int32)}
     */
    static ADS_GROUP_TYPE_GLOBAL_GROUP => 2

    /**
     * Specifies a group that can contain accounts from any domain, other domain local groups from the same domain, global groups from any domain, and universal groups. This type of group should not be included in access-control lists of resources in other domains.
     * 
     * This type of group is intended for use with the LDAP provider.
     * @type {Integer (Int32)}
     */
    static ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP => 4

    /**
     * Specifies a group that is identical to the <b>ADS_GROUP_TYPE_DOMAIN_LOCAL_GROUP</b> group, but is intended for use with the WinNT  provider.
     * @type {Integer (Int32)}
     */
    static ADS_GROUP_TYPE_LOCAL_GROUP => 4

    /**
     * Specifies a group that can contain accounts from any domain, global groups from any domain,  and other universal groups. This type of group cannot contain domain local groups.
     * @type {Integer (Int32)}
     */
    static ADS_GROUP_TYPE_UNIVERSAL_GROUP => 8

    /**
     * Specifies a group that is security enabled. This group can be used to apply an access-control list on an ADSI object or a file system.
     * @type {Integer (Int32)}
     */
    static ADS_GROUP_TYPE_SECURITY_ENABLED => -2147483648
}
