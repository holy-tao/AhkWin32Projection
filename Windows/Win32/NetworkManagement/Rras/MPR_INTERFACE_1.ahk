#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * The MPR_INTERFACE_1 structure contains configuration and status information for a particular router interface.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_interface_1
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_INTERFACE_1 extends Win32Struct
{
    static sizeof => 560

    static packingSize => 8

    /**
     * Pointer to a Unicode string that contains the name of the interface.
     * @type {String}
     */
    wszInterfaceName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * Handle to the interface.
     * @type {HANDLE}
     */
    hInterface{
        get {
            if(!this.HasProp("__hInterface"))
                this.__hInterface := HANDLE(520, this)
            return this.__hInterface
        }
    }

    /**
     * Specifies whether the interface is enabled. This value is <b>TRUE</b> if the interface is enabled, <b>FALSE</b> if the interface is administratively disabled.
     * @type {BOOL}
     */
    fEnabled {
        get => NumGet(this, 528, "int")
        set => NumPut("int", value, this, 528)
    }

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_interface_type">type of interface</a>.
     * @type {Integer}
     */
    dwIfType {
        get => NumGet(this, 532, "int")
        set => NumPut("int", value, this, 532)
    }

    /**
     * Specifies the current state of the interface, for example connected, disconnected, or unreachable. For a list of possible states, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ne-mprapi-router_connection_state">ROUTER_CONNECTION_STATE</a>.
     * @type {Integer}
     */
    dwConnectionState {
        get => NumGet(this, 536, "int")
        set => NumPut("int", value, this, 536)
    }

    /**
     * Specifies a value that represents a reason why the interface was unreachable. See 
     * <a href="https://docs.microsoft.com/windows/desktop/RRAS/unreachability-reasons">Unreachability Reasons</a> for a list of possible values.
     * @type {Integer}
     */
    fUnReachabilityReasons {
        get => NumGet(this, 540, "uint")
        set => NumPut("uint", value, this, 540)
    }

    /**
     * Specifies a nonzero value if the interface fails to connect.
     * @type {Integer}
     */
    dwLastError {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * Pointer to a Unicode string that specifies the times during which dial-out is restricted. The format for this string is: 
     * 
     * 
     * 
     * 
     * <pre class="syntax" xml:space="preserve"><code>&lt;day&gt;&lt;space&gt;&lt;time range&gt;&lt;space&gt;&lt;time range&gt; . . . &lt;NULL&gt;&lt;day&gt;. . . &lt;NULL&gt;&lt;NULL&gt;
     * </code></pre>
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
     * <pre class="syntax" xml:space="preserve"><code>2 09:00-12:00 13:00-17:30&lt;NULL&gt;4 09:00-12:00 13:00-17:30&lt;NULL&gt;&lt;NULL&gt;
     * </code></pre>
     * The preceding string restricts dial-out to Tuesdays and Thursdays from 9:00 AM to 12:00 PM and from 1:00 PM to 5:30 PM.
     * @type {PWSTR}
     */
    lpwsDialoutHoursRestriction {
        get => NumGet(this, 552, "ptr")
        set => NumPut("ptr", value, this, 552)
    }
}
