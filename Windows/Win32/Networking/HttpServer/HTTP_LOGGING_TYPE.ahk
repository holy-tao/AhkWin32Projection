#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the type of logging that is performed.
 * @remarks
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
  * 
  * 
  * For more information about the log file formats, see <a href="https://docs.microsoft.com/previous-versions/iis/6.0-sdk/ms525807(v=vs.90)">IIS Log File Formats</a>.
 * @see https://learn.microsoft.com/windows/win32/api/http/ne-http-http_logging_type
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LOGGING_TYPE{

    /**
     * The log format is W3C style extended logging. Applications choose the fields that are logged in the  <b>Fields</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_logging_info">HTTP_LOGGING_INFO</a> structure.
 * 
 *  When this type of logging is set on a URL Group, logging is similar to the IIS6 site logging. When set on a server session this format functions as a centralized logging for all of the URL Groups.
     * @type {Integer (Int32)}
     */
    static HttpLoggingTypeW3C => 0

    /**
     * The log format is IIS5/6 style logging. This format has a fixed field definition; applications cannot choose which fields are logged. This format cannot be chosen when setting the logging property on a server session.
     * @type {Integer (Int32)}
     */
    static HttpLoggingTypeIIS => 1

    /**
     * The log format is NCSA style logging. This format has a fixed field definition; applications cannot choose which fields are logged. This format cannot be chosen when setting the logging property on a server session.
     * @type {Integer (Int32)}
     */
    static HttpLoggingTypeNCSA => 2

    /**
     * The log format is centralized binary logging. This format has a fixed field definition; applications cannot choose which fields are logged. This format cannot be chosen when setting the logging property on a URL Group.
     * @type {Integer (Int32)}
     */
    static HttpLoggingTypeRaw => 3
}
