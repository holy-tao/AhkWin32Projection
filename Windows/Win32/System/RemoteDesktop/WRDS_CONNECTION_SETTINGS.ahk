#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SOCKADDR.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk
#Include .\WRDS_LISTENER_SETTINGS_1.ahk
#Include .\WRDS_LISTENER_SETTING.ahk
#Include .\WRDS_LISTENER_SETTINGS.ahk
#Include .\WRDS_CONNECTION_SETTINGS_1.ahk
#Include .\WRDS_CONNECTION_SETTING.ahk

/**
 * Contains connection setting information for a remote session.
 * @see https://docs.microsoft.com/windows/win32/api//wtsdefs/ns-wtsdefs-wrds_connection_settings
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_CONNECTION_SETTINGS extends Win32Struct
{
    static sizeof => 3784

    static packingSize => 8

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_connection_setting_level">WRDS_CONNECTION_SETTING_LEVEL</a> enumeration that specifies the type of structure that is contained in the <b>WRdsConnectionSetting</b> member.
     * @type {Integer}
     */
    WRdsConnectionSettingLevel {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_setting">WRDS_CONNECTION_SETTING</a> structure that specifies the connection settings.
     * @type {WRDS_CONNECTION_SETTING}
     */
    WRdsConnectionSetting{
        get {
            if(!this.HasProp("__WRdsConnectionSetting"))
                this.__WRdsConnectionSetting := WRDS_CONNECTION_SETTING(8, this)
            return this.__WRdsConnectionSetting
        }
    }
}
