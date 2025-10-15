#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\USE_INFO_2.ahk

/**
 * The USE_INFO_3 structure contains information about a connection between a local computer and a shared resource, including connection type, connection status, user name, domain name, and specific flags that describe connection behavior.
 * @see https://docs.microsoft.com/windows/win32/api//lmuse/ns-lmuse-use_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class USE_INFO_3 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/ns-lmuse-use_info_2">USE_INFO_2</a> structure that contains
     * @type {USE_INFO_2}
     */
    ui3_ui2{
        get {
            if(!this.HasProp("__ui3_ui2"))
                this.__ui3_ui2 := USE_INFO_2(this.ptr + 0)
            return this.__ui3_ui2
        }
    }

    /**
     * A set of bit flags that describe connection behavior and credential handling.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_NO_CONNECT"></a><a id="create_no_connect"></a><dl>
     * <dt><b>CREATE_NO_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not connect to the server.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_BYPASS_CSC"></a><a id="create_bypass_csc"></a><dl>
     * <dt><b>CREATE_BYPASS_CSC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Force a connection to the server, bypassing the CSC.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USE_DEFAULT_CREDENTIALS"></a><a id="use_default_credentials"></a><dl>
     * <dt><b>USE_DEFAULT_CREDENTIALS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No explicit credentials are supplied in the call to <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/nf-lmuse-netuseadd">NetUseAdd</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ui3_flags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }
}
