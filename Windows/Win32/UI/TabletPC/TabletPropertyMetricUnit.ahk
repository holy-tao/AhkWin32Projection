#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the unit of measurement of a property.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-tabletpropertymetricunit
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class TabletPropertyMetricUnit{

    /**
     * The units are unknown.
     * @type {Integer (Int32)}
     */
    static TPMU_Default => 0

    /**
     * The property value is in inches (distance units).
     * @type {Integer (Int32)}
     */
    static TPMU_Inches => 1

    /**
     * The property value is in centimeters (distance units).
     * @type {Integer (Int32)}
     */
    static TPMU_Centimeters => 2

    /**
     * The property value is in degrees (angle units).
     * @type {Integer (Int32)}
     */
    static TPMU_Degrees => 3

    /**
     * The property value is in radians (angle units).
     * @type {Integer (Int32)}
     */
    static TPMU_Radians => 4

    /**
     * The property value is in seconds (angle units).
     * @type {Integer (Int32)}
     */
    static TPMU_Seconds => 5

    /**
     * The property value is in pounds (force, or mass, units).
     * @type {Integer (Int32)}
     */
    static TPMU_Pounds => 6

    /**
     * The property value is in grams (force, or mass, units).
     * @type {Integer (Int32)}
     */
    static TPMU_Grams => 7
}
