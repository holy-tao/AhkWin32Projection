#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class ACPI_TIME_RESOLUTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AcpiTimeResolutionMilliseconds => 0

    /**
     * @type {Integer (Int32)}
     */
    static AcpiTimeResolutionSeconds => 1

    /**
     * @type {Integer (Int32)}
     */
    static AcpiTimeResolutionMax => 2
}
