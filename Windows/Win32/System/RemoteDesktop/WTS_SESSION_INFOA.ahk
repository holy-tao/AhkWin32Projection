#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_CONNECTSTATE_CLASS.ahk" { WTS_CONNECTSTATE_CLASS }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a client session on a Remote Desktop Session Host (RD Session Host) server. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wtsapi32.h header defines WTS_SESSION_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_session_infoa
 * @namespace Windows.Win32.System.RemoteDesktop
 * @charset ANSI
 */
export default struct WTS_SESSION_INFOA {
    #StructPack 8

    /**
     * Session identifier of the session.
     */
    SessionId : UInt32

    /**
     * Pointer to a null-terminated string that contains the WinStation name of this session. The WinStation name is a name that Windows associates with the session, for example, "services", "console", or "RDP-Tcp#0".
     */
    pWinStationName : PSTR

    /**
     * A value from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ne-wtsapi32-wts_connectstate_class">WTS_CONNECTSTATE_CLASS</a> enumeration type 
     *       that indicates the session's current connection state.
     */
    State : WTS_CONNECTSTATE_CLASS

}
