#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTSSBX_SESSION_STATE.ahk" { WTSSBX_SESSION_STATE }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about sessions that are available to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://learn.microsoft.com/windows/win32/api/tssbx/ns-tssbx-wtssbx_session_info
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTSSBX_SESSION_INFO {
    #StructPack 4

    /**
     * The user name that is associated with the session. The name cannot exceed 104 characters.
     */
    wszUserName : WCHAR[105]

    /**
     * The domain name of the user. The name cannot exceed 256 characters.
     */
    wszDomainName : WCHAR[257]

    /**
     * The name of the program that should be run after the session is created. The name cannot exceed 256 characters.
     */
    ApplicationType : WCHAR[257]

    /**
     * The session identifier.
     */
    dwSessionId : UInt32

    /**
     * The time that the session was initiated.
     */
    CreateTime : FILETIME

    /**
     * The time that the user disconnected from the session.
     */
    DisconnectTime : FILETIME

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_session_state">WTSSBX_SESSION_STATE</a> enumeration type that indicates the state of the session.
     */
    SessionState : WTSSBX_SESSION_STATE

}
