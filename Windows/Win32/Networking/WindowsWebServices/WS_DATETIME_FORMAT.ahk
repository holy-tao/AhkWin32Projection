#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the textual format of a WS_DATETIME.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_datetime_format
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DATETIME_FORMAT extends Win32Enum{

    /**
     * This format displays a time in the GMT timezone.  It is formatted with a "Z" following the time.
     *           For example, September 25, 2007 at 1:30AM in the GMT timezone would be represented as "2007-09-25T01:30:00Z".
     * @type {Integer (Int32)}
     */
    static WS_DATETIME_FORMAT_UTC => 0

    /**
     * This format displays a time with a specific timezone.  The time is followed by "[+\|-]hh:mm" indicating the
     *           relative difference between the local time and UTC in hours and minutes.
     *           For example, September 27, 2007 at 10:30AM in the Pacific timezone would be represented as
     *           "2007-09-27T10:30:00-07:00".
     *         
     * 
     * If the system is unable to convert the time to a local format because timezone information for the time
     *           specified it not available, then it will format the time as <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_datetime_format">WS_DATETIME_FORMAT_UTC</a>.
     * @type {Integer (Int32)}
     */
    static WS_DATETIME_FORMAT_LOCAL => 1

    /**
     * This format displays a time with no timezone.  The time is formatted with no additional information and no
     *           timezone is implied.  For example, September 27, 2007 at 10:30AM would be represented as "2007-09-27T10:30:00".
     * @type {Integer (Int32)}
     */
    static WS_DATETIME_FORMAT_NONE => 2
}
