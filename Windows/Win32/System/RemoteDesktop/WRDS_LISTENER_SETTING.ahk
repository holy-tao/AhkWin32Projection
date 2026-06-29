#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_LISTENER_SETTINGS_1.ahk" { WRDS_LISTENER_SETTINGS_1 }

/**
 * Contains different levels of listener settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_listener_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_LISTENER_SETTING {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings_1">WRDS_LISTENER_SETTINGS_1</a> structure.
     */
    WRdsListenerSettings1 : WRDS_LISTENER_SETTINGS_1

}
