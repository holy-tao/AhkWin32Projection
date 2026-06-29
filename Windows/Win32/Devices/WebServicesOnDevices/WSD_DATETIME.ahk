#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a timestamp.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxml/ns-wsdxml-wsd_datetime
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_DATETIME {
    #StructPack 4

    /**
     * <b>TRUE</b> if <i>year</i> value is positive.
     */
    isPositive : BOOL

    /**
     * Year value (for example, 2005). This number is a value between 0 and max(ULONG).
     */
    year : UInt32

    /**
     * One-based month value (1 = January, through 12 = December).
     */
    month : Int8

    /**
     * One-based day of the month value (1-31).
     */
    day : Int8

    /**
     * Zero-based hour value (0 through 23). <i>hour</i>=24 is only allowed if both <i>minute</i> and <i>second</i> are 0.
     */
    hour : Int8

    /**
     * Zero-based minute value (0 through 59).
     */
    minute : Int8

    /**
     * Zero-based second value (0 through 59).
     */
    second : Int8

    /**
     * Millisecond value (0-999). When this structure is converted to XML, the millisecond value is expressed as a fraction of a second in decimal form. For example, if <b>millisecond</b> has a value of 9, then the XML output will be 0.009.
     */
    millisecond : UInt32

    /**
     * <b>TRUE</b> if date and time are based on the local time zone, <b>FALSE</b> if UTC + offset.
     */
    TZIsLocal : BOOL

    /**
     * <b>TRUE</b> if time zone offset specified by  <i>TZHour</i> and <i>TZMinute</i> is positive relative to UTC, <b>FALSE</b> if offset is negative. Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     */
    TZIsPositive : BOOL

    /**
     * Time zone offset relative to UTC (0-13). <i>TZhour</i>=14 is allowed if <i>TZMinute</i> is 0. Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     */
    TZHour : Int8

    /**
     * Time zone offset relative to UTC (0-59). Not valid if <i>TZIsLocal</i> is <b>TRUE</b>.
     */
    TZMinute : Int8

}
