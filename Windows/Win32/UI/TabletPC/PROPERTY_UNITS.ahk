#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constant values for the unit of measurement of a property.
 * @see https://learn.microsoft.com/windows/win32/api/tpcshrd/ne-tpcshrd-property_units
 * @namespace Windows.Win32.UI.TabletPC
 */
class PROPERTY_UNITS extends Win32Enum {

    /**
     * Units are unknown.
     * Native name: PROPERTY_UNITS_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * The property value is in inches.
     * Native name: PROPERTY_UNITS_INCHES
     * @type {Integer (Int32)}
     */
    static INCHES => 1

    /**
     * The property value is in centimeters.
     * Native name: PROPERTY_UNITS_CENTIMETERS
     * @type {Integer (Int32)}
     */
    static CENTIMETERS => 2

    /**
     * The property value is in degrees.
     * Native name: PROPERTY_UNITS_DEGREES
     * @type {Integer (Int32)}
     */
    static DEGREES => 3

    /**
     * The property value is in radians.
     * Native name: PROPERTY_UNITS_RADIANS
     * @type {Integer (Int32)}
     */
    static RADIANS => 4

    /**
     * The property value is in seconds.
     * Native name: PROPERTY_UNITS_SECONDS
     * @type {Integer (Int32)}
     */
    static SECONDS => 5

    /**
     * The property value is in pounds.
     * Native name: PROPERTY_UNITS_POUNDS
     * @type {Integer (Int32)}
     */
    static POUNDS => 6

    /**
     * The property value is in grams.
     * Native name: PROPERTY_UNITS_GRAMS
     * @type {Integer (Int32)}
     */
    static GRAMS => 7

    /**
     * Native name: PROPERTY_UNITS_SILINEAR
     * @type {Integer (Int32)}
     */
    static SILINEAR => 8

    /**
     * Native name: PROPERTY_UNITS_SIROTATION
     * @type {Integer (Int32)}
     */
    static SIROTATION => 9

    /**
     * Native name: PROPERTY_UNITS_ENGLINEAR
     * @type {Integer (Int32)}
     */
    static ENGLINEAR => 10

    /**
     * Native name: PROPERTY_UNITS_ENGROTATION
     * @type {Integer (Int32)}
     */
    static ENGROTATION => 11

    /**
     * Native name: PROPERTY_UNITS_SLUGS
     * @type {Integer (Int32)}
     */
    static SLUGS => 12

    /**
     * Native name: PROPERTY_UNITS_KELVIN
     * @type {Integer (Int32)}
     */
    static KELVIN => 13

    /**
     * Native name: PROPERTY_UNITS_FAHRENHEIT
     * @type {Integer (Int32)}
     */
    static FAHRENHEIT => 14

    /**
     * Native name: PROPERTY_UNITS_AMPERE
     * @type {Integer (Int32)}
     */
    static AMPERE => 15

    /**
     * Native name: PROPERTY_UNITS_CANDELA
     * @type {Integer (Int32)}
     */
    static CANDELA => 16
}
