#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ONEX_VARIABLE_BLOB.ahk

/**
 * Contains 802.1X authentication parameters used for 802.1X authentication.
 * @remarks
 * The <b>ONEX_AUTH_PARAMS</b> structure is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
  * 
  * If the <b>fOneXAuthParams</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure is set, then the  <b>authParams</b> member of the <b>ONEX_RESULT_UPDATE_DATA</b> structure contains an <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> structure with an <b>ONEX_AUTH_PARAMS</b> structure embedded starting at the <b>dwOffset</b> member of the  <b>ONEX_VARIABLE_BLOB</b>.
  * 
  * For security reasons, the <b>hUserToken</b> and <b>OneXUserProfile</b> members of the <b>ONEX_AUTH_PARAMS</b> structure returned in the <b>authParams</b> member are always set to <b>NULL</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ns-dot1x-onex_auth_params
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_AUTH_PARAMS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Indicates if a status update is pending for 802.X authentication.
     * @type {Integer}
     */
    fUpdatePending {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The 802.1X authentication connection profile. This member contains an embedded <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/onex-connection-profile">ONEX_CONNECTION_PROFILE</a> structure starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a>.
     * @type {ONEX_VARIABLE_BLOB}
     */
    oneXConnProfile{
        get {
            if(!this.HasProp("__oneXConnProfile"))
                this.__oneXConnProfile := ONEX_VARIABLE_BLOB(this.ptr + 8)
            return this.__oneXConnProfile
        }
    }

    /**
     * The identity used for 802.1X authentication status. This member is a value from the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_auth_identity">ONEX_AUTH_IDENTITY</a> enumeration.
     * @type {Integer}
     */
    authIdentity {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The quarantine isolation state value of the local computer. The isolation state determines its network connectivity. This member corresponds to a value from the EAPHost <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-isolation_state">ISOLATION_STATE</a> enumeration.
     * @type {Integer}
     */
    dwQuarantineState {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The session ID of the user currently logged on to the console. This member corresponds to the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-wtsgetactiveconsolesessionid">WTSGetActiveConsoleSessionId</a> function. This member contains a session ID if the <b>fSessionId</b> bitfield member is set.
     * @type {Integer}
     */
    dwSessionId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The user token handle  used for 802.1X authentication. This member contains a user token handle if the <b>fhUserToken</b> bitfield member is set.
     * 
     * For security reasons, the <b>hUserToken</b> member of the <b>ONEX_AUTH_PARAMS</b> structure returned in the <b>authParams</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure is always set to <b>NULL</b>.
     * @type {Pointer<HANDLE>}
     */
    hUserToken {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The 802.1X user profile used for 802.1X authentication. This member contains an embedded user profile starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fOneXUserProfile</b> bitfield member is set. 
     * 
     * For security reasons, the <b>OneXUserProfile</b> member of the <b>ONEX_AUTH_PARAMS</b> structure returned in the <b>authParams</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure is always set to <b>NULL</b>.
     * @type {ONEX_VARIABLE_BLOB}
     */
    OneXUserProfile{
        get {
            if(!this.HasProp("__OneXUserProfile"))
                this.__OneXUserProfile := ONEX_VARIABLE_BLOB(this.ptr + 40)
            return this.__OneXUserProfile
        }
    }

    /**
     * The 802.1X identity used for 802.1X authentication. This member contains a NULL-terminated Unicode string with the identity starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fIdentity</b> bitfield member is set.
     * @type {ONEX_VARIABLE_BLOB}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := ONEX_VARIABLE_BLOB(this.ptr + 48)
            return this.__Identity
        }
    }

    /**
     * The user name used for 802.1X authentication. This member contains a NULL-terminated Unicode string with the user name starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fUserName</b> bitfield member is set.
     * @type {ONEX_VARIABLE_BLOB}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := ONEX_VARIABLE_BLOB(this.ptr + 56)
            return this.__UserName
        }
    }

    /**
     * The domain used for 802.1X authentication. This member contains a NULL-terminated Unicode string with the domain starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fDomain</b> bitfield member is set.
     * @type {ONEX_VARIABLE_BLOB}
     */
    Domain{
        get {
            if(!this.HasProp("__Domain"))
                this.__Domain := ONEX_VARIABLE_BLOB(this.ptr + 64)
            return this.__Domain
        }
    }
}
