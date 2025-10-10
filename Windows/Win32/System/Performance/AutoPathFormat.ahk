#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines how to decorate the file name or subdirectory name.
 * @remarks
 * 
  * Patterns apply to files and subdirectories in the same way.
  * 
  * For details on patterns, see the Remarks section of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformatpattern">FileNameFormatPattern</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//pla/ne-pla-autopathformat
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class AutoPathFormat{

    /**
     * Do not decorate the name.
     * @type {Integer (Int32)}
     */
    static plaNone => 0

    /**
     * Add a pattern to the name. The pattern is specified in  the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollector-get_filenameformatpattern">IDataCollector::FileNameFormatPattern</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_subdirectoryformatpattern">IDataCollectorSet::SubdirectoryFormatPattern</a> property.
     * @type {Integer (Int32)}
     */
    static plaPattern => 1

    /**
     * Prefix the name with the computer name.
     * @type {Integer (Int32)}
     */
    static plaComputer => 2

    /**
     * Append the month, day, and hour to the name, in the form MMddHH.
     * @type {Integer (Int32)}
     */
    static plaMonthDayHour => 256

    /**
     * Append the serial number specified in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/pla/nf-pla-idatacollectorset-get_serialnumber">IDataCollectorSet::SerialNumber</a> property to the subdirectory name in the form NNNNNN.
     * @type {Integer (Int32)}
     */
    static plaSerialNumber => 512

    /**
     * Append the year and day of the year to the name, in the form yyyyDDD.
     * @type {Integer (Int32)}
     */
    static plaYearDayOfYear => 1024

    /**
     * Append the year and month to the name, in the form yyyyMM.
     * @type {Integer (Int32)}
     */
    static plaYearMonth => 2048

    /**
     * Append the year, month, and day to the name, in the form yyyyMMdd.
     * @type {Integer (Int32)}
     */
    static plaYearMonthDay => 4096

    /**
     * Append the year, month, day, and hour to the name, in the form yyyyMMddHH.
     * @type {Integer (Int32)}
     */
    static plaYearMonthDayHour => 8192

    /**
     * Append the month, day, hour, and minute to the name, in the form MMddHHmm.
     * @type {Integer (Int32)}
     */
    static plaMonthDayHourMinute => 16384
}
