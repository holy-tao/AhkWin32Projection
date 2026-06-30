#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WRDS_SETTING.ahk
#Include .\WRDS_SETTINGS_1.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\WRDS_SETTING_TYPE.ahk
#Include .\WRDS_SETTING_STATUS.ahk
#Include .\WRDS_SETTING_LEVEL.ahk

/**
 * Contains policy-related setting information for a remote session.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WRDS_SETTINGS extends Win32Struct {
    static sizeof => 132

    static packingSize => 4

    /**
     * The category of settings contained (machine group policy, user group policy, or user security accounts manager).
     * @type {WRDS_SETTING_TYPE}
     */
    WRdsSettingType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The setting level.
     * @type {WRDS_SETTING_LEVEL}
     */
    WRdsSettingLevel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A structure that contains the policy setting states and values.
     * 
     * A structure that contains the policy setting states and values.
     * @type {WRDS_SETTING}
     */
    WRdsSetting {
        get {
            if(!this.HasProp("__WRdsSetting"))
                this.__WRdsSetting := WRDS_SETTING(8, this)
            return this.__WRdsSetting
        }
    }
}
