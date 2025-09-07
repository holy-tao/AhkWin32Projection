#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines information about a counter that a provider uses. The CTRPP tool automatically generates this structure based on the schema you specify.
 * @remarks
 * This structure is contained within a <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_info">PERF_COUNTERSET_INFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> block.
 * @see https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_info
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_COUNTER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Identifier that uniquely identifies the counter within the counter set.
     * @type {Integer}
     */
    CounterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of counter. For possible counter types, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2003/cc776490(v=ws.10)">Counter Types</a> in the Windows 2003 Deployment Guide.
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
     * The attributes PERF_ATTRIB_NO_GROUP_SEPARATOR, PERF_ATTRIB_DISPLAY_AS_REAL, and PERF_ATTRIB_DISPLAY_AS_HEX are not mutually exclusive. If you specify all three attributes, precedence is given to the attributes in the order given.
     * @type {Integer}
     */
    Attrib {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

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
     * @type {Integer}
     */
    DetailLevel {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Scale factor to apply to the counter value. Valid values range from –10 through 10. Zero if no scale is applied. If this value is zero, the scale value is 1; if this value is 1, the scale value is 10; if this value is –1, the scale value is .10; and so on.
     * @type {Integer}
     */
    Scale {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Byte offset from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/perflib/ns-perflib-perf_counterset_instance">PERF_COUNTERSET_INSTANCE</a> block to the counter value.
     * @type {Integer}
     */
    Offset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
