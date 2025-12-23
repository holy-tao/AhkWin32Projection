#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the secure modes (S modes) for a Windows device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wldp/ne-wldp-wldp_windows_lockdown_mode
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class WLDP_WINDOWS_LOCKDOWN_MODE extends Win32Enum{

    /**
     * Unlocked. Used primarily for Windows devices without the S mode.
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_UNLOCKED => 0

    /**
     * Trial. Used primarily for a Windows 10 trial device with the S mode. Trial mode is a special case for Windows 10 devices with the S mode: policies are enforced, but there is no anti-rollback protection for the enforcement of the policy.
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_TRIAL => 1

    /**
     * Locked. Used primarily for a Windows 10 device with the S mode. A device that is locked will enforce the signed Device Guard policies shipped with the Windows 10 OS image with the S mode.
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_LOCKED => 2

    /**
     * The maximum enumeration value.
     * @type {Integer (Int32)}
     */
    static WLDP_WINDOWS_LOCKDOWN_MODE_MAX => 3
}
