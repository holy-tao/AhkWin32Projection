#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * Contains information about sessions that are available to Remote Desktop Connection Broker (RD Connection Broker).
 * @see https://docs.microsoft.com/windows/win32/api//tssbx/ns-tssbx-wtssbx_session_info
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTSSBX_SESSION_INFO extends Win32Struct
{
    static sizeof => 1272

    static packingSize => 8

    /**
     * The user name that is associated with the session. The name cannot exceed 104 characters.
     * @type {String}
     */
    wszUserName {
        get => StrGet(this.ptr + 0, 104, "UTF-16")
        set => StrPut(value, this.ptr + 0, 104, "UTF-16")
    }

    /**
     * The domain name of the user. The name cannot exceed 256 characters.
     * @type {String}
     */
    wszDomainName {
        get => StrGet(this.ptr + 210, 256, "UTF-16")
        set => StrPut(value, this.ptr + 210, 256, "UTF-16")
    }

    /**
     * The name of the program that should be run after the session is created. The name cannot exceed 256 characters.
     * @type {String}
     */
    ApplicationType {
        get => StrGet(this.ptr + 724, 256, "UTF-16")
        set => StrPut(value, this.ptr + 724, 256, "UTF-16")
    }

    /**
     * The session identifier.
     * @type {Integer}
     */
    dwSessionId {
        get => NumGet(this, 1240, "uint")
        set => NumPut("uint", value, this, 1240)
    }

    /**
     * The time that the session was initiated.
     * @type {FILETIME}
     */
    CreateTime{
        get {
            if(!this.HasProp("__CreateTime"))
                this.__CreateTime := FILETIME(1248, this)
            return this.__CreateTime
        }
    }

    /**
     * The time that the user disconnected from the session.
     * @type {FILETIME}
     */
    DisconnectTime{
        get {
            if(!this.HasProp("__DisconnectTime"))
                this.__DisconnectTime := FILETIME(1256, this)
            return this.__DisconnectTime
        }
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tssbx/ne-tssbx-wtssbx_session_state">WTSSBX_SESSION_STATE</a> enumeration type that indicates the state of the session.
     * @type {Integer}
     */
    SessionState {
        get => NumGet(this, 1264, "int")
        set => NumPut("int", value, this, 1264)
    }
}
