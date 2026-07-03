#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WTS_SYSTEMTIME.ahk" { WTS_SYSTEMTIME }
#Import ".\WTS_TIME_ZONE_INFORMATION.ahk" { WTS_TIME_ZONE_INFORMATION }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains select client property values.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsprotocol/nf-wtsprotocol-iwtsprotocolconnection-getuserdata">GetUserData</a> method and is both sent to and returned by the protocol. This structure is initialized with client data by the Remote Desktop Services service. If a value does not exist for a member, the protocol should not provide one.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_user_data
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_USER_DATA {
    #StructPack 4

    /**
     * A string value that specifies the directory where the client startup program resides. This value corresponds to the <b>WorkDirectory</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     */
    WorkDirectory : WCHAR[257]

    /**
     * A string value that specifies the name of  the initial program. This value corresponds to the <b>InitialProgram</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     */
    InitialProgram : WCHAR[257]

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_time_zone_information">WTS_TIME_ZONE_INFORMATION</a> structure that contains client time zone information. This value corresponds to the <b>ClientTimeZone</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_client_data">WTS_CLIENT_DATA</a> structure.
     */
    UserTimeZone : WTS_TIME_ZONE_INFORMATION

}
