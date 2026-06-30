#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

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
class WTS_SESSION_ID extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * A GUID that specifies the client connection.
     * @type {Guid}
     */
    SessionUniqueGuid {
        get {
            if(!this.HasProp("__SessionUniqueGuid"))
                this.__SessionUniqueGuid := Guid(0, this)
            return this.__SessionUniqueGuid
        }
    }

    /**
     * An integer that specifies the session associated with the client connection.
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
