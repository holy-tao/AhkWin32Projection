#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WRDS_SETTINGS_1.ahk

/**
 * Contains different levels of policy-related settings for a remote desktop connection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wrds_setting
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_SETTING extends Win32Struct
{
    static sizeof => 124

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings_1">WRDS_SETTINGS_1</a> structure.
     * @type {WRDS_SETTINGS_1}
     */
    WRdsSettings1{
        get {
            if(!this.HasProp("__WRdsSettings1"))
                this.__WRdsSettings1 := WRDS_SETTINGS_1(0, this)
            return this.__WRdsSettings1
        }
    }
}
