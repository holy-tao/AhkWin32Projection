#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ONEX_VARIABLE_BLOB.ahk" { ONEX_VARIABLE_BLOB }
#Import ".\ONEX_STATUS.ahk" { ONEX_STATUS }
#Import ".\ONEX_AUTH_STATUS.ahk" { ONEX_AUTH_STATUS }
#Import ".\ONEX_EAP_METHOD_BACKEND_SUPPORT.ahk" { ONEX_EAP_METHOD_BACKEND_SUPPORT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information on a status change to 802.1X authentication.
 * @remarks
 * The <b>ONEX_RESULT_UPDATE_DATA</b> structure is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <b>ONEX_RESULT_UPDATE_DATA</b> contains information on a status change to 802.1X authentication.This structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ns-dot1x-onex_result_update_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct ONEX_RESULT_UPDATE_DATA {
    #StructPack 4

    /**
     * Specifies the current 802.1X authentication status. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_status">ONEX_STATUS</a> structure.
     */
    oneXStatus : ONEX_STATUS

    /**
     * Indicates if the configured EAP method on the supplicant is supported on the 802.1X authentication server.
     * 
     * EAP permits the use of a backend
     *    authentication server, which may implement some or all authentication
     *    methods, with the authenticator acting as a pass-through for some or
     *    all methods and peers. For more information, see RFC 3748 published by the IETF and the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_eap_method_backend_support">ONEX_EAP_METHOD_BACKEND_SUPPORT</a> enumeration.
     */
    BackendSupport : ONEX_EAP_METHOD_BACKEND_SUPPORT

    /**
     * Indicates if a response was received from the 802.1X authentication server.
     */
    fBackendEngaged : BOOL

    /**
     * This bitfield backs the following members:
     * - fOneXAuthParams
     * - fEapError
     */
    _bitfield : Int32


    /**
     * @type {Integer}
     */
    fOneXAuthParams {
        get => (this._bitfield >> 0) & 0x1
        set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
    }

    /**
     * @type {Integer}
     */
    fEapError {
        get => (this._bitfield >> 1) & 0x1
        set => this._bitfield := ((value & 0x1) << 1) | (this._bitfield & ~(0x1 << 1))
    }
    /**
     * The 802.1X authentication parameters. This member contains an embedded <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_auth_params">ONEX_AUTH_PARAMS</a> structure starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fOneXAuthParams</b> bitfield member is set.
     */
    authParams : ONEX_VARIABLE_BLOB

    /**
     * An EAP error value. This member contains an embedded <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_eap_error">ONEX_EAP_ERROR</a> structure starting at the <b>dwOffset</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_variable_blob">ONEX_VARIABLE_BLOB</a> if the <b>fEapError</b> bitfield member is set.
     */
    eapError : ONEX_VARIABLE_BLOB

}
