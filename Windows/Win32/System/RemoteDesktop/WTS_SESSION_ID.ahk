#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class WTS_SESSION_ID extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A GUID that specifies the client connection.
     * @type {Pointer<Guid>}
     */
    SessionUniqueGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An integer that specifies the session associated with the client connection.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
