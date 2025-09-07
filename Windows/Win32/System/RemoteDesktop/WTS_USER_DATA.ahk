#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WTS_SYSTEMTIME.ahk
#Include .\WTS_TIME_ZONE_INFORMATION.ahk

/**
 * Contains select client property values.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata">GetUserData</a> method and is both sent to and returned by the protocol. This structure is initialized with client data by the Remote Desktop Services service. If a value does not exist for a member, the protocol should not provide one.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_user_data
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_USER_DATA extends Win32Struct
{
    static sizeof => 1216

    static packingSize => 8

    /**
     * A string value that specifies the directory where the client startup program resides. This value corresponds to the <b>WorkDirectory</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     * @type {String}
     */
    WorkDirectory {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * A string value that specifies the name of  the initial program. This value corresponds to the <b>InitialProgram</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     * @type {String}
     */
    InitialProgram {
        get => StrGet(this.ptr + 514, 256, "UTF-16")
        set => StrPut(value, this.ptr + 514, 256, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WTS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information. This value corresponds to the <b>ClientTimeZone</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     * @type {WTS_TIME_ZONE_INFORMATION}
     */
    UserTimeZone{
        get {
            if(!this.HasProp("__UserTimeZone"))
                this.__UserTimeZone := WTS_TIME_ZONE_INFORMATION(this.ptr + 1032)
            return this.__UserTimeZone
        }
    }
}
