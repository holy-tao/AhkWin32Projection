#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WRDS_SETTING_TYPE.ahk" { WRDS_SETTING_TYPE }
#Import ".\WRDS_SETTING.ahk" { WRDS_SETTING }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WRDS_SETTING_STATUS.ahk" { WRDS_SETTING_STATUS }
#Import ".\WRDS_SETTINGS_1.ahk" { WRDS_SETTINGS_1 }
#Import ".\WRDS_SETTING_LEVEL.ahk" { WRDS_SETTING_LEVEL }

/**
 * Contains policy-related setting information for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WRDS_SETTINGS {
    #StructPack 4

    /**
     * The category of settings contained (machine group policy, user group policy, or user security accounts manager).
     */
    WRdsSettingType : WRDS_SETTING_TYPE

    /**
     * The setting level.
     */
    WRdsSettingLevel : WRDS_SETTING_LEVEL

    /**
     * A structure that contains the policy setting states and values.
     * 
     * A structure that contains the policy setting states and values.
     */
    WRdsSetting : WRDS_SETTING

}
