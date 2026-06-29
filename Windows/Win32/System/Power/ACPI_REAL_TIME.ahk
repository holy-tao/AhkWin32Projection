#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct ACPI_REAL_TIME {
    #StructPack 2

    Year : UInt16

    Month : Int8

    Day : Int8

    Hour : Int8

    Minute : Int8

    Second : Int8

    Valid : Int8

    Milliseconds : UInt16

    TimeZone : Int16

    DayLight : Int8

    Reserved1 : Int8[3]

}
