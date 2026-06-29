#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_CONNECTION_SETTINGS_1.ahk" { WRDS_CONNECTION_SETTINGS_1 }
#Import ".\WRDS_CONNECTION_SETTING_LEVEL.ahk" { WRDS_CONNECTION_SETTING_LEVEL }
#Import ".\WRDS_LISTENER_SETTING_LEVEL.ahk" { WRDS_LISTENER_SETTING_LEVEL }
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_LISTENER_SETTINGS_1.ahk" { WRDS_LISTENER_SETTINGS_1 }
#Import ".\WRDS_LISTENER_SETTING.ahk" { WRDS_LISTENER_SETTING }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_SOCKADDR.ahk" { WTS_SOCKADDR }
#Import ".\WRDS_CONNECTION_SETTING.ahk" { WRDS_CONNECTION_SETTING }
#Import ".\WRDS_LISTENER_SETTINGS.ahk" { WRDS_LISTENER_SETTINGS }
#Import ".\WTS_TIME_ZONE_INFORMATION.ahk" { WTS_TIME_ZONE_INFORMATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains connection setting information for a remote session. (WRDS_CONNECTION_SETTINGS)
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_connection_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_CONNECTION_SETTINGS {
    #StructPack 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_connection_setting_level">WRDS_CONNECTION_SETTING_LEVEL</a> enumeration that specifies the type of structure that is contained in the <b>WRdsConnectionSetting</b> member.
     */
    WRdsConnectionSettingLevel : WRDS_CONNECTION_SETTING_LEVEL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_setting">WRDS_CONNECTION_SETTING</a> structure that specifies the connection settings.
     */
    WRdsConnectionSetting : WRDS_CONNECTION_SETTING

}
