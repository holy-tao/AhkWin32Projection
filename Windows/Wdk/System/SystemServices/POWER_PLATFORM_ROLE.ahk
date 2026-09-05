#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the OEM's preferred power management profile.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-power_platform_role
 * @namespace Windows.Wdk.System.SystemServices
 */
class POWER_PLATFORM_ROLE extends Win32Enum {

    /**
     * The OEM did not specify a specific role.
     * Native name: PlatformRoleUnspecified
     * @type {Integer (Int32)}
     */
    static Unspecified => 0

    /**
     * The OEM specified a desktop role.
     * Native name: PlatformRoleDesktop
     * @type {Integer (Int32)}
     */
    static Desktop => 1

    /**
     * The OEM specified a mobile role (for example, a laptop).
     * Native name: PlatformRoleMobile
     * @type {Integer (Int32)}
     */
    static Mobile => 2

    /**
     * The OEM specified a workstation role.
     * Native name: PlatformRoleWorkstation
     * @type {Integer (Int32)}
     */
    static Workstation => 3

    /**
     * The OEM specified an enterprise server role.
     * Native name: PlatformRoleEnterpriseServer
     * @type {Integer (Int32)}
     */
    static EnterpriseServer => 4

    /**
     * The OEM specified a single office/home office (SOHO) server role.
     * Native name: PlatformRoleSOHOServer
     * @type {Integer (Int32)}
     */
    static RoleSOHOServer => 5

    /**
     * The OEM specified an appliance PC role.
     * Native name: PlatformRoleAppliancePC
     * @type {Integer (Int32)}
     */
    static AppliancePC => 6

    /**
     * The OEM specified a performance server role.
     * Native name: PlatformRolePerformanceServer
     * @type {Integer (Int32)}
     */
    static PerformanceServer => 7

    /**
     * The OEM specified a tablet form factor role.
     * 
     * <b>Windows 7, Windows Server 2008 R2, Windows Vista or Windows Server 2008:  </b>In version 1 of this enumeration, this value is equivalent to <b>PlatformRoleMaximum</b>. This value is supported in version 2 of this enumeration starting with Windows 8 and Windows Server 2012.
     * Native name: PlatformRoleSlate
     * @type {Integer (Int32)}
     */
    static Slate => 8

    /**
     * Values equal to or greater than this value indicate an out of range value.
     * Native name: PlatformRoleMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 9
}
