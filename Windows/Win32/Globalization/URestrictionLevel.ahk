#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class URestrictionLevel{

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_ASCII => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_SINGLE_SCRIPT_RESTRICTIVE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_HIGHLY_RESTRICTIVE => 805306368

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MODERATELY_RESTRICTIVE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_MINIMALLY_RESTRICTIVE => 1342177280

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_UNRESTRICTIVE => 1610612736

    /**
     * @type {Integer (Int32)}
     */
    static USPOOF_RESTRICTION_LEVEL_MASK => 2130706432
}
