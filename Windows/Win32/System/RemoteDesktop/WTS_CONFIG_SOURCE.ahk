#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the source of configuration information returned by the WTSQueryUserConfig function.
 * @see https://docs.microsoft.com/windows/win32/api//wtsapi32/ne-wtsapi32-wts_config_source
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CONFIG_SOURCE extends Win32Enum{

    /**
     * The configuration information came from the Security Accounts Manager (SAM) database.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigSourceSAM => 0
}
