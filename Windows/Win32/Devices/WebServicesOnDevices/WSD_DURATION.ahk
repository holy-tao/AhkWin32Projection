#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a length of time.
 * @remarks
 * If any numeric member has a value of 0, then the member and its value is not included in the XML output when the structure is converted to XML.
 * @see https://learn.microsoft.com/windows/win32/api/wsdxml/ns-wsdxml-wsd_duration
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_DURATION {
    #StructPack 4

    /**
     * This parameter is <b>TRUE</b> if the entire duration is positive.
     */
    isPositive : BOOL

    /**
     * The year value. This number is a value between 0 and max(ULONG).
     */
    year : UInt32

    /**
     * The month value. This number is a value between 0 and max(ULONG).
     */
    month : UInt32

    /**
     * The day value. This number is a value between 0 and max(ULONG).
     */
    day : UInt32

    /**
     * The hour value. This number is a value between 0 and max(ULONG).
     */
    hour : UInt32

    /**
     * The minute value. This number is a value between 0 and max(ULONG).
     */
    minute : UInt32

    /**
     * The second value. This number is a value between 0 and max(ULONG).
     */
    second : UInt32

    /**
     * The millisecond value (0-999).
     */
    millisecond : UInt32

}
