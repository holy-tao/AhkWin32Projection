#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumeration values used by PowerEnumerate and PowerSettingAccessCheck.
 * @see https://learn.microsoft.com/windows/win32/api/powrprof/ne-powrprof-power_data_accessor
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class POWER_DATA_ACCESSOR{

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powersettingaccesscheck">PowerSettingAccessCheck</a> to 
 *       check for group policy overrides for AC power settings.
     * @type {Integer (Int32)}
     */
    static ACCESS_AC_POWER_SETTING_INDEX => 0

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powersettingaccesscheck">PowerSettingAccessCheck</a> to 
 *       check for group policy overrides for DC power settings.
     * @type {Integer (Int32)}
     */
    static ACCESS_DC_POWER_SETTING_INDEX => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_FRIENDLY_NAME => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DESCRIPTION => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_POWER_SETTING => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_POWER_SETTING_FRIENDLY_NAME => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_POWER_SETTING_DESCRIPTION => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DEFAULT_AC_POWER_SETTING => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DEFAULT_DC_POWER_SETTING => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_VALUE_MIN => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_VALUE_MAX => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_VALUE_INCREMENT => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_POSSIBLE_VALUE_UNITS => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_ICON_RESOURCE => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DEFAULT_SECURITY_DESCRIPTOR => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_ATTRIBUTES => 15

    /**
     * Used to enumerate power schemes with 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powerenumerate">PowerEnumerate</a> and with 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powersettingaccesscheck">PowerSettingAccessCheck</a> to check for 
 *       restricted access to specific power schemes.
     * @type {Integer (Int32)}
     */
    static ACCESS_SCHEME => 16

    /**
     * Used to enumerate subgroups with 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powerenumerate">PowerEnumerate</a>.
     * @type {Integer (Int32)}
     */
    static ACCESS_SUBGROUP => 17

    /**
     * Used to enumerate individual power settings with 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powerenumerate">PowerEnumerate</a>.
     * @type {Integer (Int32)}
     */
    static ACCESS_INDIVIDUAL_SETTING => 18

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powersettingaccesscheck">PowerSettingAccessCheck</a> to 
 *       check for group policy overrides for active power schemes.
     * @type {Integer (Int32)}
     */
    static ACCESS_ACTIVE_SCHEME => 19

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/powrprof/nf-powrprof-powersettingaccesscheck">PowerSettingAccessCheck</a> to 
 *       check for restricted access for creating power schemes.
     * @type {Integer (Int32)}
     */
    static ACCESS_CREATE_SCHEME => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_AC_POWER_SETTING_MAX => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DC_POWER_SETTING_MAX => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_AC_POWER_SETTING_MIN => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_DC_POWER_SETTING_MIN => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_PROFILE => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_OVERLAY_SCHEME => 26

    /**
     * @type {Integer (Int32)}
     */
    static ACCESS_POWER_MODE => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACCESS_ACTIVE_OVERLAY_SCHEME => 27
}
