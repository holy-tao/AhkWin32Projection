#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINGER (winsock.h) structure maintains information about a specific socket that specifies how that socket should behave when data is queued to be sent.
 * @remarks
 * The <b>l_onoff</b> member of the <b>linger</b> structure determines whether a socket should remain open for a specified amount of time after a 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-closesocket">closesocket</a> function call to enable queued data to be sent. Somewhat confusing is that this member can be modified in two ways: <ul>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function with the <i>optname</i> parameter set to <b>SO_DONTLINGER</b>. The <i>optval</i> parameter determines how the <b>l_onoff</b> member is modified. </li>
 * <li>Call the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function with the <i>optname</i> parameter set to <b>SO_LINGER</b>. The <i>optval</i> parameter specifies how both the <b>l_onoff</b> and <b>l_linger</b> members are modified. </li>
 * </ul>
 * 
 * 
 * The <b>l_linger</b> member of the <b>linger</b> structure determines the amount of time, in seconds, a socket should remain open. This member is only applicable if the <b>l_onoff</b> member of the <b>linger</b> structure is nonzero.
 * 
 * To enable a socket to remain open, an application should set the <b>l_onoff</b> member to a nonzero value and set the <b>l_linger</b> member  to the desired time-out in seconds. To disable a socket from remaining open, an application only needs to set the  <b>l_onoff</b> member of the <b>linger</b> structure to zero.
 * 
 *  If an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function with the <i>optname</i> parameter set to <b>SO_DONTLINGER</b> to set the <b>l_onoff</b> member to a nonzero value, the value for the <b>l_linger</b> member is not specified. In this case, the time-out used is implementation dependent. If a previous time-out has been established for a socket (by enabling SO_LINGER), this time-out value should be reinstated by the service provider.
 * 
 * Note that enabling a nonzero timeout on a nonblocking socket is not recommended.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-getsockopt">getsockopt</a> function can be called with the <i>optname</i> parameter set to <b>SO_LINGER</b> to retrieve the current value of the <b>linger</b> structure associated with a socket.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-linger
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LINGER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Type: <b>u_short</b>
     * 
     * Specifies whether a socket should remain open for a specified amount of time after a
     * @type {Integer}
     */
    l_onoff {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b>u_short</b>
     * 
     * The linger time in seconds. This member specifies how long to remain open after a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-closesocket">closesocket</a> function call to enable queued data to be sent.  This member is only applicable if the <b>l_onoff</b> member of the <b>linger</b> structure is set to a nonzero value.
     * 
     * This value is set if the <a href="https://docs.microsoft.com/windows/desktop/api/winsock/nf-winsock-setsockopt">setsockopt</a> function is called with the <i>optname</i> parameter set to <b>SO_LINGER</b>. The <i>optval</i> parameter passed to the <b>setsockopt</b> function must contain a <b>linger</b> structure that is copied to the internal <b>linger</b> structure maintained for the socket.
     * @type {Integer}
     */
    l_linger {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
