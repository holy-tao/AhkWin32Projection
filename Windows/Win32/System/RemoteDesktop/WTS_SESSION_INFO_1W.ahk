#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains extended information about a client session on a Remote Desktop Session Host (RD Session Host) server or Remote Desktop Virtualization Host (RD Virtualization Host) server. (Unicode)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsexa">WTSEnumerateSessionsEx</a> function returns this structure if you call the function and specify a handle to an RD Virtualization Host server  that you obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsopenserverexa">WTSOpenServerEx</a> function. In this case, the <b>WTSEnumerateSessionsEx</b> function aggregates all the sessions running on the host itself as well as sessions running on individual virtual machines.  The <i>ExecEnvId</i> parameter uniquely identifies each session in the aggregated list. This identifier may be different from the actual session identifier defined in the server or virtual machine that hosts the session, which is specified by the <b>SessionId</b> member.
  * 
  * The session represented by this structure could be a session running directly on the server or a session running within a virtual machine. If the session is running within a virtual machine, the <b>pHostName</b> member contains the name of the virtual machine. The <b>pFarmName</b> member is applicable to sessions that are hosted on virtual machines that are joined to a RD Session Host farm.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The wtsapi32.h header defines WTS_SESSION_INFO_1 as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_session_info_1w
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class WTS_SESSION_INFO_1W extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * An identifier that uniquely identifies the session within the list of sessions returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsenumeratesessionsexa">WTSEnumerateSessionsEx</a> function. For more information, see Remarks.
     * @type {Integer}
     */
    ExecEnvId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type that specifies the connection state of a Remote Desktop Services session.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A session identifier assigned by the RD Session Host server, RD Virtualization Host server, or virtual machine.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a null-terminated string that contains the name of this session. For example, "services", "console", or "RDP-Tcp#0".
     * @type {Pointer<PWSTR>}
     */
    pSessionName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the computer that the session is running on. If the session is running directly on an RD Session Host server or RD Virtualization Host server, the string contains <b>NULL</b>. If the session is running on a virtual machine, the string contains the name of the virtual machine.
     * @type {Pointer<PWSTR>}
     */
    pHostName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the user who is logged on to the session. If no user is logged on to the session, the string contains <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    pUserName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to a null-terminated string that contains the domain name of the user who is logged on to the session. If no user is logged on to the session, the string contains <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    pDomainName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to a null-terminated string that contains the name of the farm that the virtual machine is joined to.  If the session is not running on a virtual machine that is joined to a farm, the string contains <b>NULL</b>.
     * @type {Pointer<PWSTR>}
     */
    pFarmName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
