#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MIB_IF_TABLE_LEVEL enumeration type defines the level of interface information to retrieve.
 * @remarks
 * The MIB_IF_TABLE_LEVEL enumeration type is used with the 
  *     <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff552528(v=vs.85)">GetIfTable2Ex</a> function to specify the level
  *     of interface information to retrieve.
 * @see https://learn.microsoft.com/windows/win32/api/netioapi/ne-netioapi-mib_if_table_level
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_IF_TABLE_LEVEL{

    /**
     * The values of statistics and state that are returned in members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559214(v=vs.85)">MIB_IF_ROW2</a> structure in the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559224(v=vs.85)">MIB_IF_TABLE2</a> structure that the 
 *      <i>Table</i> parameter points to in the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff552528(v=vs.85)">GetIfTable2Ex</a> function are returned from
 *      the top of the filter stack.
     * @type {Integer (Int32)}
     */
    static MibIfTableNormal => 0

    /**
     * The values of statistics and state that are returned in members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559214(v=vs.85)">MIB_IF_ROW2</a> structure in the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff559224(v=vs.85)">MIB_IF_TABLE2</a> structure that the 
 *      <i>Table</i> parameter points to in the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff552528(v=vs.85)">GetIfTable2Ex</a> function are returned
 *      directly for the interface that is being queried.
     * @type {Integer (Int32)}
     */
    static MibIfTableRaw => 1

    /**
     * <div class="alert"><b>Note</b>  This value is available starting with Windows 10, version 1703.</div>
 * <div> </div>
 * The values returned are the same as for the <b>MibIfTableNormal </b> value, but without the statistics.
     * @type {Integer (Int32)}
     */
    static MibIfTableNormalWithoutStatistics => 2
}
