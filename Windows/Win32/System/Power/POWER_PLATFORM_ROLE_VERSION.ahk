#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The version of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ne-winnt-power_platform_role">POWER_PLATFORM_ROLE</a> enumeration for the current build target.
 * @see https://learn.microsoft.com/windows/win32/api/powerbase/nf-powerbase-powerdetermineplatformroleex
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_PLATFORM_ROLE_VERSION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_PLATFORM_ROLE_V2 => 2
}
