#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of structure contained in the WRdsSetting member of the WRDS_SETTINGS structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wrds_setting_level
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_SETTING_LEVEL{

    /**
     * The type of structure is not defined.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_LEVEL_INVALID => 0

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings_1">WRDS_SETTINGS_1</a> structure.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_LEVEL_1 => 1
}
