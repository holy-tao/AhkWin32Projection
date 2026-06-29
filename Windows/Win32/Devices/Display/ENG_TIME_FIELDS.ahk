#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ENG_TIME_FIELDS structure is used by the EngQueryLocalTime function to return the local time.
 * @remarks
 * The driver is responsible for allocating the ENG_TIME_FIELDS structure and passing its pointer to <b>EngQueryLocalTime</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-eng_time_fields
 * @namespace Windows.Win32.Devices.Display
 */
export default struct ENG_TIME_FIELDS {
    #StructPack 2

    /**
     * Specifies the current calendar year. The range is [1601,...].
     */
    usYear : UInt16

    /**
     * Specifies the current calendar month. The range is [1,12].
     */
    usMonth : UInt16

    /**
     * Specifies the current calendar day. The range is [1,31].
     */
    usDay : UInt16

    /**
     * Specifies the current hour. The range is [0,23].
     */
    usHour : UInt16

    /**
     * Specifies the current minute. The range is [0,59].
     */
    usMinute : UInt16

    /**
     * Specifies the current second. The range is [0,59].
     */
    usSecond : UInt16

    /**
     * Specifies the current millisecond. The range is [0,999].
     */
    usMilliseconds : UInt16

    /**
     * Specifies the current day. The range is [0,6], where 0 is Sunday and 6 is Saturday.
     */
    usWeekday : UInt16

}
