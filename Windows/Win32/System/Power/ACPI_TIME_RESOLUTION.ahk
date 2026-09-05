#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 */
class ACPI_TIME_RESOLUTION extends Win32Enum {

    /**
     * Native name: AcpiTimeResolutionMilliseconds
     * @type {Integer (Int32)}
     */
    static Milliseconds => 0

    /**
     * Native name: AcpiTimeResolutionSeconds
     * @type {Integer (Int32)}
     */
    static Seconds => 1

    /**
     * Native name: AcpiTimeResolutionMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
