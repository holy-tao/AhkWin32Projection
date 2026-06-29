#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_CONNECTION_SETTINGS_1.ahk" { WRDS_CONNECTION_SETTINGS_1 }
#Import ".\WRDS_LISTENER_SETTING_LEVEL.ahk" { WRDS_LISTENER_SETTING_LEVEL }
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_LISTENER_SETTINGS_1.ahk" { WRDS_LISTENER_SETTINGS_1 }
#Import ".\WRDS_LISTENER_SETTING.ahk" { WRDS_LISTENER_SETTING }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_SOCKADDR.ahk" { WTS_SOCKADDR }
#Import ".\WRDS_LISTENER_SETTINGS.ahk" { WRDS_LISTENER_SETTINGS }
#Import ".\WTS_TIME_ZONE_INFORMATION.ahk" { WTS_TIME_ZONE_INFORMATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains different levels of settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_connection_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_CONNECTION_SETTING {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings_1">WRDS_CONNECTION_SETTINGS_1</a> structure.
     */
    WRdsConnectionSettings1 : WRDS_CONNECTION_SETTINGS_1

}
