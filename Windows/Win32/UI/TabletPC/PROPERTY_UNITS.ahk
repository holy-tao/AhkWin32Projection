#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constant values for the unit of measurement of a property.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ne-tpcshrd-property_units
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct PROPERTY_UNITS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Units are unknown.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_DEFAULT => 0

    /**
     * The property value is in inches.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_INCHES => 1

    /**
     * The property value is in centimeters.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_CENTIMETERS => 2

    /**
     * The property value is in degrees.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_DEGREES => 3

    /**
     * The property value is in radians.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_RADIANS => 4

    /**
     * The property value is in seconds.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_SECONDS => 5

    /**
     * The property value is in pounds.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_POUNDS => 6

    /**
     * The property value is in grams.
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_GRAMS => 7

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_SILINEAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_SIROTATION => 9

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_ENGLINEAR => 10

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_ENGROTATION => 11

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_SLUGS => 12

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_KELVIN => 13

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_FAHRENHEIT => 14

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_AMPERE => 15

    /**
     * @type {Integer (Int32)}
     */
    static PROPERTY_UNITS_CANDELA => 16
}
