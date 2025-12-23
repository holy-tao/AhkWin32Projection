#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the status of a policy setting for various members of the WRDS_SETTINGS_1 structure.
 * @remarks
 * The three primary values (disabled, enabled, and not configured) correspond to the states that are available when defining rules in the group policy editor. When the setting status is enabled, the value of the setting can be changed by the corresponding value member within the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings_1">WRDS_SETTINGS_1</a> structure. For example, if that structure's <b>WRdsColorDepthStatus</b> member has a value of <b>WRDS_SETTING_STATUS_ENABLED</b>, the <b>WRdsColorDepthValue</b> member will go into effect. Otherwise, the value member is not used in processing.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wrds_setting_status
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WRDS_SETTING_STATUS extends Win32Enum{

    /**
     * The setting status has not been defined.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_STATUS_NOTAPPLICABLE => -1

    /**
     * The setting is disabled.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_STATUS_DISABLED => 0

    /**
     * The setting is enabled.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_STATUS_ENABLED => 1

    /**
     * The setting is not configured.
     * @type {Integer (Int32)}
     */
    static WRDS_SETTING_STATUS_NOTCONFIGURED => 2
}
