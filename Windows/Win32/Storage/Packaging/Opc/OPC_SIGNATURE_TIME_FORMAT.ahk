#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how to interpret the signingTime parameter, which is a record of when a signature was created, of the IOpcDigitalSignature::GetSigningTime method.
 * @remarks
 * The following table provides descriptions of  placeholder values.
  * 
  * <table>
  * <tr>
  * <th>Placeholder </th>
  * <th>Description </th>
  * <th>Example</th>
  * </tr>
  * <tr>
  * <td>
  * <i>YYYY</i>
  * 
  * </td>
  * <td>
  * Four-digit year.
  * 
  * </td>
  * <td>
  * 2010
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>MM</i>
  * 
  * </td>
  * <td>
  * Two-digit month with a leading zero. Possible values: 01–12.
  * 
  * </td>
  * <td>
  * 03
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>DD</i>
  * 
  * </td>
  * <td>
  * Two-digit day of month with a leading zero. Possible values: 01–31.
  * 
  * </td>
  * <td>
  * 09
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>hh</i>
  * 
  * </td>
  * <td>
  * Two-digit hour, 24-hour time with a leading zero. Possible values: 00–23.
  * 
  * </td>
  * <td>
  * 18
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>mm</i>
  * 
  * </td>
  * <td>
  * Two-digit minute with a leading zero. Possible values: 00–59.
  * 
  * </td>
  * <td>
  * 45
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>ss</i>
  * 
  * </td>
  * <td>
  * Two-digit second with a leading zero. Possible values: 00–59.
  * 
  * </td>
  * <td>
  * 32
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>s</i>
  * 
  * </td>
  * <td>
  * One digit representing the decimal fraction of a second.
  * 
  * </td>
  * <td>
  * 3
  * 
  * </td>
  * </tr>
  * <tr>
  * <td>
  * <i>TZD</i>
  * 
  * </td>
  * <td>
  * Time zone designator with a leading zero. Possible values:  Z, +<i>hh</i>:<i>mm</i>, -<i>hh</i>:<i>mm</i>.
  * 
  * </td>
  * <td>
  * -08:00
  * 
  * </td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/msopc/ne-msopc-opc_signature_time_format
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class OPC_SIGNATURE_TIME_FORMAT{

    /**
     * The format is the complete date with hours, minutes, and seconds expressed as a decimal fraction.
 * 
 * Syntax: <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>.<i>s</i><i>TZD</i>
 * 
 * A value of "2010-03-09T18:45:32.3-08:00" would represent 6:45:32.3 P.M. on March 9, 2010 Pacific Time.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_MILLISECONDS => 0

    /**
     * The format is the complete date with hours, minutes, and seconds.
 * 
 * Syntax: <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>hh</i>:<i>mm</i>:<i>ss</i><i>TZD</i>
 * 
 * A value of "2010-03-09T18:45:32-08:00" would represent 6:45:32 P.M. on March 9, 2010  Pacific Time.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_SECONDS => 1

    /**
     * The format is the complete date with hours and  minutes.
 * 
 * Syntax: <i>YYYY</i>-<i>MM</i>-<i>DD</i>T<i>hh</i>:<i>mm</i><i>TZD</i>
 * 
 * A value of "2010-03-09T18:45-08:00" would represent 6:45 P.M. on March 9, 2010 Pacific Time.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_MINUTES => 2

    /**
     * The format is the complete date.
 * 
 * Syntax: <i>YYYY</i>-<i>MM</i>-<i>DD</i>
 * 
 * A value of "2010-03-09" would represent March 9, 2010.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_DAYS => 3

    /**
     * The format is the year and month.
 * 
 * Syntax: <i>YYYY</i>-<i>MM</i>
 * 
 * A value of "2010-03" would represent March, 2010.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_MONTHS => 4

    /**
     * The format is the year.
 * 
 * Syntax:  <i>YYYY</i>
 * 
 * A value of "2010" would represent 2010.
     * @type {Integer (Int32)}
     */
    static OPC_SIGNATURE_TIME_FORMAT_YEARS => 5
}
