#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the date of manufacture of a battery.
 * @remarks
 * The date is encoded in the Gregorian or western calendar format.
 * @see https://learn.microsoft.com/windows/win32/Power/battery-manufacture-date-str
 * @namespace Windows.Win32.System.Power
 */
export default struct BATTERY_MANUFACTURE_DATE {
    #StructPack 2

    /**
     * The day of the month of manufacture, in the range 1 to 31. In spite of the data type, this is not an ASCII encoded value. It is an unsigned byte.
     */
    Day : Int8

    /**
     * The month of manufacture, in the range 1 (January) to 12 (December). In spite of the data type, this is not an ASCII encoded value. It is an unsigned byte.
     */
    Month : Int8

    /**
     * The year of manufacture. This will typically be in the range 1900-2100.
     */
    Year : UInt16

}
