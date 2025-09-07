#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the OEM's preferred power management profile.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-power_platform_role
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_PLATFORM_ROLE{

    /**
     * The OEM did not specify a specific role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleUnspecified => 0

    /**
     * The OEM specified a desktop role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleDesktop => 1

    /**
     * The OEM specified a mobile role (for example, a laptop).
     * @type {Integer (Int32)}
     */
    static PlatformRoleMobile => 2

    /**
     * The OEM specified a workstation role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleWorkstation => 3

    /**
     * The OEM specified an enterprise server role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleEnterpriseServer => 4

    /**
     * The OEM specified a single office/home office (SOHO) server role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleSOHOServer => 5

    /**
     * The OEM specified an appliance PC role.
     * @type {Integer (Int32)}
     */
    static PlatformRoleAppliancePC => 6

    /**
     * The OEM specified a performance server role.
     * @type {Integer (Int32)}
     */
    static PlatformRolePerformanceServer => 7

    /**
     * The OEM specified a tablet form factor role.
 * 
 * <b>Windows 7, Windows Server 2008 R2, Windows Vista or Windows Server 2008:  </b>In version 1 of this enumeration, this value is equivalent to <b>PlatformRoleMaximum</b>. This value is supported in version 2 of this enumeration starting with Windows 8 and Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static PlatformRoleSlate => 8

    /**
     * Values equal to or greater than this value indicate an out of range value.
     * @type {Integer (Int32)}
     */
    static PlatformRoleMaximum => 9
}
