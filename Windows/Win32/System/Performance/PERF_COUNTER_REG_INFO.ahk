#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides registration information about a performance counter.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i>parameter set to <b>PERF_REG_COUNTERSET_STRUCT</b> gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_reg_info">PERF_COUNTERSET_REG_INFO</a> block that
  * contains one or more <b>PERF_COUNTER_REG_INFO</b> structures.
  * 
  * 
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i>parameter set to 
  * <b>PERF_REG_COUNTER_STRUCT</b> gets a <b>PERF_COUNTER_REG_INFO</b> structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//perflib/ns-perflib-perf_counter_reg_info
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_REG_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A unique identifier for the performance counter within the counter set. A counter set can contain a maximum of 64,000 performance counters.
     * @type {Integer}
     */
    CounterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of the performance counter. For information about the predefined counter types, see the Counter Types section of the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Windows Server 2003 Deployment Kit</a>. Consumers use the counter type to determine how to calculate and display the counter value. Providers should limit their choice of counter types to the predefined list. 
     * 					
     * 
     * 
     * The possible values are:
     * 
     * 
     * 
     * <a id="PERF_100NSEC_MULTI_TIMER"></a>
     * <a id="perf_100nsec_multi_timer"></a>
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * One or more attributes that indicate how to display this counter.
     * 
     * 
     * The possible values are:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ATTRIB_BY_REFERENCE"></a><a id="perf_attrib_by_reference"></a><dl>
     * <dt><b>PERF_ATTRIB_BY_REFERENCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieve the value of the counter by reference as opposed to by value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ATTRIB_NO_DISPLAYABLE"></a><a id="perf_attrib_no_displayable"></a><dl>
     * <dt><b>PERF_ATTRIB_NO_DISPLAYABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not display the counter value. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ATTRIB_NO_GROUP_SEPARATOR"></a><a id="perf_attrib_no_group_separator"></a><dl>
     * <dt><b>PERF_ATTRIB_NO_GROUP_SEPARATOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not use digit separators when displaying counter value. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ATTRIB_DISPLAY_AS_REAL"></a><a id="perf_attrib_display_as_real"></a><dl>
     * <dt><b>PERF_ATTRIB_DISPLAY_AS_REAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the counter value as a real value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_ATTRIB_DISPLAY_AS_HEX"></a><a id="perf_attrib_display_as_hex"></a><dl>
     * <dt><b>PERF_ATTRIB_DISPLAY_AS_HEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the counter value as a hexadecimal number. 
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The attributes <b>PERF_ATTRIB_NO_GROUP_SEPARATOR</b>, <b>PERF_ATTRIB_DISPLAY_AS_REAL</b>, and <b>PERF_ATTRIB_DISPLAY_AS_HEX</b> are not mutually exclusive. If you specify all three attributes, precedence is given to the attributes in the order given.
     * @type {Integer}
     */
    Attrib {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The target audience for the counter. 
     * 
     * 
     * The possible values are:
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_DETAIL_NOVICE"></a><a id="perf_detail_novice"></a><dl>
     * <dt><b>PERF_DETAIL_NOVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You can display the counter to any level of user.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PERF_DETAIL_ADVANCED"></a><a id="perf_detail_advanced"></a><dl>
     * <dt><b>PERF_DETAIL_ADVANCED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The counter is complicated and should be displayed only to advanced users.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The scaling factor to apply to the raw performance counter value. Valid values range from –10 through 10. Zero if no scale is applied. If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on. The scaled value of the performance counter is equal to the raw value of the performance counter multiplied by  10 raised to the power that the <b>DefaultScale</b> member specifies.
     * @type {Integer}
     */
    DefaultScale {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The counter identifier of the base counter. 0xFFFFFFFF indicates that there is no base counter.
     * @type {Integer}
     */
    BaseCounterId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The counter identifier of the performance counter. 0xFFFFFFFF indicates that there is no performance counter.
     * @type {Integer}
     */
    PerfTimeId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The counter identifier of the frequency counter. 0xFFFFFFFF indicates that there is no frequency counter.
     * @type {Integer}
     */
    PerfFreqId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The counter identifier of the multi-counter. 0xFFFFFFFF indicates that there is no multi-counter.
     * @type {Integer}
     */
    MultiId {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The aggregation function the client should apply to the counter if the  
     * 
     * counter set to which the counter belongs is of type Global Aggregate, Multiple  
     * 
     * Instance Aggregate, or Global Aggregate History. The client specifies the  counter instances across which the aggregation is performed if the counter set type  
     * 
     * is Multiple Instance Aggregate; otherwise, the client must aggregate values
     * @type {Integer}
     */
    AggregateFunc {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
