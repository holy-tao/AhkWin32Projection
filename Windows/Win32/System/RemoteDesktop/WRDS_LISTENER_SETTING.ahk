#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WRDS_LISTENER_SETTINGS_1.ahk

/**
 * Contains different levels of listener settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_listener_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_LISTENER_SETTING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings_1">WRDS_LISTENER_SETTINGS_1</a> structure.
     * @type {WRDS_LISTENER_SETTINGS_1}
     */
    WRdsListenerSettings1{
        get {
            if(!this.HasProp("__WRdsListenerSettings1"))
                this.__WRdsListenerSettings1 := WRDS_LISTENER_SETTINGS_1(this.ptr + 0)
            return this.__WRdsListenerSettings1
        }
    }
}
