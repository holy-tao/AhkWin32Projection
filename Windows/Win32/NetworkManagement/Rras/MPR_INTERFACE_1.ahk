#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ROUTER_INTERFACE_TYPE.ahk" { ROUTER_INTERFACE_TYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ROUTER_CONNECTION_STATE.ahk" { ROUTER_CONNECTION_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MPR_INTERFACE_1 structure contains configuration and status information for a particular router interface.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_interface_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_INTERFACE_1 {
    #StructPack 8

    /**
     * Pointer to a Unicode string that contains the name of the interface.
     */
    wszInterfaceName : WCHAR[257]

    /**
     * Handle to the interface.
     */
    hInterface : HANDLE

    /**
     * Specifies whether the interface is enabled. This value is <b>TRUE</b> if the interface is enabled, <b>FALSE</b> if the interface is administratively disabled.
     */
    fEnabled : BOOL

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">type of interface</a>.
     */
    dwIfType : ROUTER_INTERFACE_TYPE

    /**
     * Specifies the current state of the interface, for example connected, disconnected, or unreachable. For a list of possible states, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     */
    dwConnectionState : ROUTER_CONNECTION_STATE

    /**
     * Specifies a value that represents a reason why the interface was unreachable. See 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a> for a list of possible values.
     */
    fUnReachabilityReasons : UInt32

    /**
     * Specifies a nonzero value if the interface fails to connect.
     */
    dwLastError : UInt32

    /**
     * Pointer to a Unicode string that specifies the times during which dial-out is restricted. The format for this string is: 
     * 
     * 
     * 
     * 
     * 
     * ``` syntax
     * &lt;day&gt;&lt;space&gt;&lt;time range&gt;&lt;space&gt;&lt;time range&gt; . . . &lt;NULL&gt;&lt;day&gt;. . . &lt;NULL&gt;&lt;NULL&gt;
     * 
     * ```
     * 
     * Where day is a numeral that corresponds to a day of the week.
     * 
     * <table>
     * <tr>
     * <th>Numeral</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Sunday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Monday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Tuesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Wednesday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>4</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Thursday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>5</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Friday
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>6</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Saturday
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Time range is of the form HH:MM-HH:MM, using 24-hour notation.
     * 
     * The string &lt;space&gt; in the preceding syntax denotes a space character. The string &lt;NULL&gt; denotes a null character.
     * 
     * The restriction string is terminated by two consecutive null characters.
     * 
     * Example:
     * 
     * 
     * ``` syntax
     * 2 09:00-12:00 13:00-17:30&lt;NULL&gt;4 09:00-12:00 13:00-17:30&lt;NULL&gt;&lt;NULL&gt;
     * 
     * ```
     * 
     * The preceding string restricts dial-out to Tuesdays and Thursdays from 9:00 AM to 12:00 PM and from 1:00 PM to 5:30 PM.
     */
    lpwsDialoutHoursRestriction : PWSTR

}
