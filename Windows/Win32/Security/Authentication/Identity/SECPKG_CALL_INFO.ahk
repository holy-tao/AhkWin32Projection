#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a currently executing call.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_call_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CALL_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The process identifier of the call.
     * @type {Integer}
     */
    ProcessId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The thread identifier of the call.
     * @type {Integer}
     */
    ThreadId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The set of attribute flags that describe the call. The following table lists the valid attribute flag values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_KERNEL_MODE"></a><a id="secpkg_call_kernel_mode"></a><dl>
     * <dt><b>SECPKG_CALL_KERNEL_MODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call originated in kernel mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_ANSI"></a><a id="secpkg_call_ansi"></a><dl>
     * <dt><b>SECPKG_CALL_ANSI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call came from ANSI stub.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_URGENT"></a><a id="secpkg_call_urgent"></a><dl>
     * <dt><b>SECPKG_CALL_URGENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call designated urgent.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_RECURSIVE"></a><a id="secpkg_call_recursive"></a><dl>
     * <dt><b>SECPKG_CALL_RECURSIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is recursive.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_IN_PROC"></a><a id="secpkg_call_in_proc"></a><dl>
     * <dt><b>SECPKG_CALL_IN_PROC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call originated in process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_CLEANUP"></a><a id="secpkg_call_cleanup"></a><dl>
     * <dt><b>SECPKG_CALL_CLEANUP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is cleanup from a client.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_WOWCLIENT"></a><a id="secpkg_call_wowclient"></a><dl>
     * <dt><b>SECPKG_CALL_WOWCLIENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from a WOW client process.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_THREAD_TERM"></a><a id="secpkg_call_thread_term"></a><dl>
     * <dt><b>SECPKG_CALL_THREAD_TERM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from a terminated thread. 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_PROCESS_TERM"></a><a id="secpkg_call_process_term"></a><dl>
     * <dt><b>SECPKG_CALL_PROCESS_TERM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from a terminated process.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_IS_TCB"></a><a id="secpkg_call_is_tcb"></a><dl>
     * <dt><b>SECPKG_CALL_IS_TCB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from TCB.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_NETWORK_ONLY"></a><a id="secpkg_call_network_only"></a><dl>
     * <dt><b>SECPKG_CALL_NETWORK_ONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call asks for network logon only and not any cached logons.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_WINLOGON"></a><a id="secpkg_call_winlogon"></a><dl>
     * <dt><b>SECPKG_CALL_WINLOGON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call of <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsalogonuser">LsaLogonUser</a> is from Winlogon.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_ASYNC_UPDATE"></a><a id="secpkg_call_async_update"></a><dl>
     * <dt><b>SECPKG_CALL_ASYNC_UPDATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Asynchronous update for unlock.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_SYSTEM_PROC"></a><a id="secpkg_call_system_proc"></a><dl>
     * <dt><b>SECPKG_CALL_SYSTEM_PROC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call originated from the System process.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_NEGO"></a><a id="secpkg_call_nego"></a><dl>
     * <dt><b>SECPKG_CALL_NEGO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from SPNego.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_NEGO_EXTENDER"></a><a id="secpkg_call_nego_extender"></a><dl>
     * <dt><b>SECPKG_CALL_NEGO_EXTENDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Call is from NEGO extender.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SECPKG_CALL_BUFFER_MARSHALL"></a><a id="secpkg_call_buffer_marshall"></a><dl>
     * <dt><b>SECPKG_CALL_BUFFER_MARSHALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer passed is marshaled by RPC.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The call count.
     * @type {Integer}
     */
    CallCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    MechOid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
