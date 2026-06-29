#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDMDATETIME structure contains a date and time of day.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmdatetime
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDMDATETIME {
    #StructPack 2

    /**
     * Word containing the four-digit year.
     */
    wYear : UInt16

    /**
     * Word containing the month (1-12).
     */
    wMonth : UInt16

    /**
     * Word containing the day of the month (1-31).
     */
    wDay : UInt16

    /**
     * Word containing the hour (0-23).
     */
    wHour : UInt16

    /**
     * Word containing the minute (0-59).
     */
    wMinute : UInt16

    /**
     * Word containing the second (0-59).
     */
    wSecond : UInt16

}
