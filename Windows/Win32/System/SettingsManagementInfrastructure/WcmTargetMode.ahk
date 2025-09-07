#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the various target modes.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmtargetmode
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class WcmTargetMode{

    /**
     * This value indicates that the only expansions that will be performed on environment variables are those defined in the target.
     * @type {Integer (Int32)}
     */
    static OfflineMode => 1

    /**
     * This value indicates that the expansions will preferentially expand from the target. If a matching expansion is not found, the expansions will fall through to the current environment of the process.
     * @type {Integer (Int32)}
     */
    static OnlineMode => 2
}
