#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WRDS_LISTENER_SETTINGS_1.ahk
#Include .\WRDS_LISTENER_SETTING.ahk

/**
 * Contains listener setting information for a remote session.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wrds_listener_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_LISTENER_SETTINGS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_listener_setting_level">WRDS_LISTENER_SETTING_LEVEL</a> enumeration that specifies the type of structure that is contained in the <b>WRdsListenerSetting</b> member.
     * @type {Integer}
     */
    WRdsListenerSettingLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_setting">WRDS_LISTENER_SETTING</a> structure that specifies the listener settings.
     * @type {WRDS_LISTENER_SETTING}
     */
    WRdsListenerSetting{
        get {
            if(!this.HasProp("__WRdsListenerSetting"))
                this.__WRdsListenerSetting := WRDS_LISTENER_SETTING(this.ptr + 8)
            return this.__WRdsListenerSetting
        }
    }
}
