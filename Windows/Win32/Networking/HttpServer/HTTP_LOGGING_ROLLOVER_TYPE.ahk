#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the log file rollover types.
 * @remarks
 * 
 * The log files are named based on the rollover type and logging format as shown in  the following table.
 * 
 * 
 * <table>
 * <tr>
 * <th>Format</th>
 * <th>Rollover  Type </th>
 * <th>Filename Pattern</th>
 * </tr>
 * <tr>
 * <td>Microsoft IIS Log Format</td>
 * <td>Size</td>
 * <td>inetsvnn.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Hourly</td>
 * <td>inyymmddhh.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Daily</td>
 * <td>inyymmdd.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Weekly</td>
 * <td>inymmww.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Monthly</td>
 * <td>inyymm.log</td>
 * </tr>
 * <tr>
 * <td>NCSA Common Log File Format</td>
 * <td>Size</td>
 * <td>ncsann.log
 * </td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Hourly</td>
 * <td>ncyymmddhh.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Daily</td>
 * <td>ncyymmdd.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Weekly</td>
 * <td>ncyymmww.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Monthly</td>
 * <td>ncyymm.log</td>
 * </tr>
 * <tr>
 * <td>W3C Extended Log File Format</td>
 * <td>Size</td>
 * <td>extendnn.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Hourly</td>
 * <td>exyymmddhh.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Daily</td>
 * <td>exyymmdd.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Weekly</td>
 * <td>exyymmww.log</td>
 * </tr>
 * <tr>
 * <td></td>
 * <td>Monthly</td>
 * <td>exyymm.log</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The following table lists time element characters and what they represent. <table>
 * <tr>
 * <th>Item</th>
 * <th>Description </th>
 * </tr>
 * <tr>
 * <td>yy</td>
 * <td>The two digit representation of the year.</td>
 * </tr>
 * <tr>
 * <td>mm</td>
 * <td>The two digit representation of the month.</td>
 * </tr>
 * <tr>
 * <td>ww</td>
 * <td>The two digit representation of the week.</td>
 * </tr>
 * <tr>
 * <td>dd</td>
 * <td>The two digit representation of the day.</td>
 * </tr>
 * <tr>
 * <td>hh</td>
 * <td>The two digit representation of the hour in 24 hour notation.</td>
 * </tr>
 * <tr>
 * <td>nn</td>
 * <td>The two digit representation of the numerical sequence.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ne-http-http_logging_rollover_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LOGGING_ROLLOVER_TYPE{

    /**
     * The log files are rolled over when they reach a specified size.
     * @type {Integer (Int32)}
     */
    static HttpLoggingRolloverSize => 0

    /**
     * The log files are rolled over every day.
     * @type {Integer (Int32)}
     */
    static HttpLoggingRolloverDaily => 1

    /**
     * The log files are rolled over every week.
     * @type {Integer (Int32)}
     */
    static HttpLoggingRolloverWeekly => 2

    /**
     * The log files are rolled over every month.
     * @type {Integer (Int32)}
     */
    static HttpLoggingRolloverMonthly => 3

    /**
     * The log files are rolled over every hour, based on GMT.
     * @type {Integer (Int32)}
     */
    static HttpLoggingRolloverHourly => 4
}
