#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DATE_TIME structure defines a 64-bit integer value that contains a date/time, expressed as the number of ticks (100-nanosecond increments) since 12:00 midnight, January 1, 1 C.E. in the Gregorian calendar.
 * @see https://learn.microsoft.com/windows/win32/api/dhcpsapi/ns-dhcpsapi-date_time
 * @namespace Windows.Win32.NetworkManagement.Dhcp
 */
export default struct DATE_TIME {
    #StructPack 4

    /**
     * Specifies the lower 32 bits of the time value.
     */
    dwLowDateTime : UInt32

    /**
     * Specifies the upper 32 bits of the time value.
     */
    dwHighDateTime : UInt32

}
