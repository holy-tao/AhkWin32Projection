#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_LISTENER_SETTING_LEVEL.ahk" { WRDS_LISTENER_SETTING_LEVEL }
#Import ".\WRDS_LISTENER_SETTINGS_1.ahk" { WRDS_LISTENER_SETTINGS_1 }
#Import ".\WRDS_LISTENER_SETTING.ahk" { WRDS_LISTENER_SETTING }

/**
 * Contains listener setting information for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_listener_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_LISTENER_SETTINGS {
    #StructPack 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_listener_setting_level">WRDS_LISTENER_SETTING_LEVEL</a> enumeration that specifies the type of structure that is contained in the <b>WRdsListenerSetting</b> member.
     */
    WRdsListenerSettingLevel : WRDS_LISTENER_SETTING_LEVEL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_setting">WRDS_LISTENER_SETTING</a> structure that specifies the listener settings.
     */
    WRdsListenerSetting : WRDS_LISTENER_SETTING

}
