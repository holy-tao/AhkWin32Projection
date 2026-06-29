#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains a GUID that uniquely identifies a session.
 * @remarks
 * This structure is used in the following methods:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-authenticateclienttosession">AuthenticateClientToSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-logonnotify">LogonNotify</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-notifysessionid">NotifySessionId</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_session_id
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_SESSION_ID {
    #StructPack 4

    /**
     * A GUID that specifies the client connection.
     */
    SessionUniqueGuid : Guid

    /**
     * An integer that specifies the session associated with the client connection.
     */
    SessionId : UInt32

}
