#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * MI_Timestamp specifies a timestamp or a specific point in time.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_timestamp
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Timestamp {
    #StructPack 4

    /**
     * A four digit number representing the year in the form yyyy.
     */
    year : UInt32

    /**
     * A two digit number representing the month in the form mm. (01-12)
     */
    month : UInt32

    /**
     * A two digit number representing the day of the month in the form dd. (01-31)
     */
    day : UInt32

    /**
     * A two digit number representing the hour on a 24-hour clock in the form hh. (00-23)
     */
    hour : UInt32

    /**
     * A two digit number representing minutes in the form mm. (00-59)
     */
    minute : UInt32

    /**
     * A two digit number representing seconds in the form ss. (00-59)
     */
    second : UInt32

    /**
     * A six digit number in the form mmmmmm representing the microseconds. (000000-999999)
     */
    microseconds : UInt32

    /**
     * The offset from Coordinated Universal Time in minutes. Timezones west of Greenwich use negative numbers while timezones east of Greenwich use positive numbers.
     */
    utc : Int32

}
