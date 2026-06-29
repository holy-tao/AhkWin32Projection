#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines information about a counter that a provider uses. The CTRPP tool automatically generates this structure based on the schema you specify.
 * @remarks
 * This structure is contained within a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_info">PERF_COUNTERSET_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_info
 * @namespace Windows.Win32.System.Performance
 */
export default struct PERF_COUNTER_INFO {
    #StructPack 8

    /**
     * Identifier that uniquely identifies the counter within the counter set.
     */
    CounterId : UInt32

    /**
     * Specifies the type of counter. For possible counter types, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Counter Types</a> in the Windows 2003 Deployment Guide.
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
     * The attributes PERF_ATTRIB_NO_GROUP_SEPARATOR, PERF_ATTRIB_DISPLAY_AS_REAL, and PERF_ATTRIB_DISPLAY_AS_HEX are not mutually exclusive. If you specify all three attributes, precedence is given to the attributes in the order given.
     */
    Attrib : Int64

    /**
     * Size, in bytes, of this structure.
     */
    Size : UInt32

    /**
     * Specify the target audience for the counter. 
     * 
     * 
     * Possible values are:
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
     * Scale factor to apply to the counter value. Valid values range from –10 through 10. Zero if no scale is applied. If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on.
     */
    Scale : Int32

    /**
     * Byte offset from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> block to the counter value.
     */
    Offset : UInt32

}
