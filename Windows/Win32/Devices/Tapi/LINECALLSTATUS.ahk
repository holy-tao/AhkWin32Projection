#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The LINECALLSTATUS structure describes the current status of a call.
 * @remarks
 * Device-specific extensions should use the DevSpecific (<b>dwDevSpecificSize</b> and <b>dwDevSpecificOffset</b>) variably sized area of this data structure.
 * 
 * The application is sent a 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-callstate">LINE_CALLSTATE</a> message whenever the call state of a call changes. This message only provides the new call state of the call. Additional status about a call is available with 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linegetcallstatus">lineGetCallStatus</a>.
 * 
 * The members <b>dwCallFeatures2</b> and <b>tStateEntryTime</b> are available only to applications that open the line device with an API version of 2.0 or later.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linecallstatus
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINECALLSTATUS extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * Total size allocated to this data structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size for this data structure that is needed to hold all the returned information, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this data structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Current call state of the call using one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ constants</a>.
     * @type {Integer}
     */
    dwCallState {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Interpretation of the <b>dwCallStateMode</b> member is call-state-dependent. In many cases, the value will be zero. The following table shows <b>dwCallStateMode</b> types for a given <b>dwCallState</b> value. 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>dwCallState</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_BUSY"></a><a id="linecallstate_busy"></a><dl>
     * <dt><b>LINECALLSTATE_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linebusymode--constants">LINEBUSYMODE_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_CONNECTED"></a><a id="linecallstate_connected"></a><dl>
     * <dt><b>LINECALLSTATE_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineconnectedmode--constants">LINECONNECTEDMODE_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_DIALTONE"></a><a id="linecallstate_dialtone"></a><dl>
     * <dt><b>LINECALLSTATE_DIALTONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedialtonemode--constants">LINEDIALTONEMODE_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_DISCONNECTED"></a><a id="linecallstate_disconnected"></a><dl>
     * <dt><b>LINECALLSTATE_DISCONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedisconnectmode--constants">LINEDISCONNECTMODE_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_OFFERING"></a><a id="linecallstate_offering"></a><dl>
     * <dt><b>LINECALLSTATE_OFFERING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/lineofferingmode--constants">LINEOFFERINGMODE_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="LINECALLSTATE_SPECIALINFO"></a><a id="linecallstate_specialinfo"></a><dl>
     * <dt><b>LINECALLSTATE_SPECIALINFO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linespecialinfo--constants">LINESPECIALINFO_ Constants</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwCallStateMode {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Application's privilege for this call. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallprivilege--constants">LINECALLPRIVILEGE_ constants</a>.
     * @type {Integer}
     */
    dwCallPrivilege {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Flags that indicate the Telephony API functions that can be invoked on the call, given the availability of the feature in the device capabilities, the current call state, and call ownership of the invoking application. A zero indicates the corresponding feature cannot be invoked by the application on the call in its current state; a one indicates the feature can be invoked. This member uses 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature--constants">LINECALLFEATURE_ Constants</a>.
     * @type {Integer}
     */
    dwCallFeatures {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of the device-specific field, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Offset from the beginning of the structure to the variably sized device-specific field. The size of the field is specified by <b>dwDevSpecificOffset</b>.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Indicates additional functions can be invoked on the call, given the availability of the feature in the device capabilities, the current call state, and call ownership of the invoking application. An extension of the <b>dwCallFeatures</b> member. This member uses 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallfeature2--constants">LINECALLFEATURE2_ Constants</a>.
     * @type {Integer}
     */
    dwCallFeatures2 {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Coordinated Universal Time at which the current call state was entered.
     * @type {SYSTEMTIME}
     */
    tStateEntryTime{
        get {
            if(!this.HasProp("__tStateEntryTime"))
                this.__tStateEntryTime := SYSTEMTIME(40, this)
            return this.__tStateEntryTime
        }
    }
}
