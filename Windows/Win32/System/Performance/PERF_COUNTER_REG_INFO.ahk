#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PERF_COUNTER_AGGREGATE_FUNC.ahk" { PERF_COUNTER_AGGREGATE_FUNC }

/**
 * Provides registration information about a performance counter.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i> parameter set to <b>PERF_REG_COUNTERSET_STRUCT</b> gets a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_reg_info">PERF_COUNTERSET_REG_INFO</a> block that
 * contains one or more <b>PERF_COUNTER_REG_INFO</b> structures.
 * 
 * 
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/perflib/nf-perflib-perfquerycountersetregistrationinfo">PerfQueryCounterSetRegistrationInfo</a> function called with the <i>requestCode</i> parameter set to 
 * <b>PERF_REG_COUNTER_STRUCT</b> gets a <b>PERF_COUNTER_REG_INFO</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_reg_info
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_REG_INFO {
    #StructPack 8

    /**
     * A unique identifier for the performance counter within the counter set. A counter set can contain a maximum of 64,000 performance counters.
     */
    CounterId : UInt32

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
     */
    Type : UInt32

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
     */
    Attrib : Int64

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
     */
    DetailLevel : UInt32

    /**
     * The scaling factor to apply to the raw performance counter value. Valid values range from –10 through 10. Zero if no scale is applied. If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on. The scaled value of the performance counter is equal to the raw value of the performance counter multiplied by  10 raised to the power that the <b>DefaultScale</b> member specifies.
     */
    DefaultScale : Int32

    /**
     * The counter identifier of the base counter. 0xFFFFFFFF indicates that there is no base counter.
     */
    BaseCounterId : UInt32

    /**
     * The counter identifier of the performance counter. 0xFFFFFFFF indicates that there is no performance counter.
     */
    PerfTimeId : UInt32

    /**
     * The counter identifier of the frequency counter. 0xFFFFFFFF indicates that there is no frequency counter.
     */
    PerfFreqId : UInt32

    /**
     * The counter identifier of the multi-counter. 0xFFFFFFFF indicates that there is no multi-counter.
     */
    MultiId : UInt32

    /**
     * The aggregation function the client should apply to the counter if the  
     * 
     * counter set to which the counter belongs is of type Global Aggregate, Multiple  
     * 
     * Instance Aggregate, or Global Aggregate History. The client specifies the  counter instances across which the aggregation is performed if the counter set type  
     * 
     * is Multiple Instance Aggregate; otherwise, the client must aggregate values
     */
    AggregateFunc : PERF_COUNTER_AGGREGATE_FUNC

    /**
     * Reserved.
     */
    Reserved : UInt32

}
