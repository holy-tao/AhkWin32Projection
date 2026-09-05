#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used to specify the type of structure that is contained in the WRdsListenerSetting member of the WRDS_LISTENER_SETTINGS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wrds_listener_setting_level
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class WRDS_LISTENER_SETTING_LEVEL extends Win32Enum {

    /**
     * The type of structure is not defined.
     * Native name: WRDS_LISTENER_SETTING_LEVEL_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 0

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_listener_settings_1">WRDS_LISTENER_SETTINGS_1</a> structure.
     * Native name: WRDS_LISTENER_SETTING_LEVEL_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
