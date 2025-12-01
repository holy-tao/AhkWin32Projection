#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SOCKADDR.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk
#Include .\WRDS_LISTENER_SETTINGS_1.ahk
#Include .\WRDS_LISTENER_SETTING.ahk
#Include .\WRDS_LISTENER_SETTINGS.ahk
#Include .\WRDS_CONNECTION_SETTINGS_1.ahk

/**
 * Contains different levels of settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_connection_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_CONNECTION_SETTING extends Win32Struct
{
    static sizeof => 3776

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings_1">WRDS_CONNECTION_SETTINGS_1</a> structure.
     * @type {WRDS_CONNECTION_SETTINGS_1}
     */
    WRdsConnectionSettings1{
        get {
            if(!this.HasProp("__WRdsConnectionSettings1"))
                this.__WRdsConnectionSettings1 := WRDS_CONNECTION_SETTINGS_1(0, this)
            return this.__WRdsConnectionSettings1
        }
    }
}
