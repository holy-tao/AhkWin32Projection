#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\USE_INFO_ASG_TYPE.ahk" { USE_INFO_ASG_TYPE }
#Import ".\USE_INFO_2.ahk" { USE_INFO_2 }

/**
 * The USE_INFO_3 structure contains information about a connection between a local computer and a shared resource, including connection type, connection status, user name, domain name, and specific flags that describe connection behavior.
 * @see https://learn.microsoft.com/windows/win32/api/lmuse/ns-lmuse-use_info_3
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_INFO_3 {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmuse/ns-lmuse-use_info_2">USE_INFO_2</a> structure that contains
     */
    ui3_ui2 : USE_INFO_2

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
     */
    ui3_flags : UInt32

}
