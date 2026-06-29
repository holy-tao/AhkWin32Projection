#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_SETTING_STATUS.ahk" { WRDS_SETTING_STATUS }
#Import ".\WRDS_SETTINGS_1.ahk" { WRDS_SETTINGS_1 }

/**
 * Contains different levels of policy-related settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_SETTING {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings_1">WRDS_SETTINGS_1</a> structure.
     */
    WRdsSettings1 : WRDS_SETTINGS_1

}
