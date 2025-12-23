#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the possible values that indicate the reason that 802.1X authentication failed.
 * @remarks
 * The <b>ONEX_REASON_CODE</b> enumerated type is used by the 802.1X module, a new wireless configuration component supported on Windows Vista and  later.  
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> contains information on a status change to 802.1X authentication. The <b>ONEX_RESULT_UPDATE_DATA</b> structure is returned  when  the <b>NotificationSource</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>  and the <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure for received notification  is <b>OneXNotificationTypeResultUpdate</b>. For this notification, the <b>pData</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure points to an  <b>ONEX_RESULT_UPDATE_DATA</b> structure that contains information on the 802.1X authentication status change. 
 * 
 * The <b>oneXStatus</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_result_update_data">ONEX_RESULT_UPDATE_DATA</a> structure contains an <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_status">ONEX_STATUS</a> structure. If an error occurred during 802.1X authentication, the dwReason member of this <b>ONEX_STATUS</b> structure contains the reason for the error specified as a value from the <b>ONEX_REASON_CODE</b> enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/dot1x/ne-dot1x-onex_reason_code
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class ONEX_REASON_CODE extends Win32Enum{

    /**
     * Indicates the 802.1X authentication was a success.
     * @type {Integer (Int32)}
     */
    static ONEX_REASON_CODE_SUCCESS => 0

    /**
     * Indicates the start of the range that specifies the possible values for 802.1X reason code.
     * @type {Integer (Int32)}
     */
    static ONEX_REASON_START => 327680

    /**
     * The 802.1X module was unable to identify a set of credentials to be used. An example is when the authentication mode is set to user, but no user is logged on.
     * @type {Integer (Int32)}
     */
    static ONEX_UNABLE_TO_IDENTIFY_USER => 327681

    /**
     * The EAP module was unable to acquire an identity for the user. Thus value is not currently used. All EAP-specific errors are returned as <b>ONEX_EAP_FAILURE_RECEIVED</b>.
     * @type {Integer (Int32)}
     */
    static ONEX_IDENTITY_NOT_FOUND => 327682

    /**
     * To proceed with 802.1X authentication, the system needs to request user input, but the user interface is disabled. On Windows Vista and on Windows Server 2008, this value can be returned if an EAP method requested user input for a profile for Guest or local machine authentication. On Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed, this value should not be returned.
     * @type {Integer (Int32)}
     */
    static ONEX_UI_DISABLED => 327683

    /**
     * The 802.1X authentication module was unable to return the requested user input. On Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed, this value can be returned if an EAP method requested user input, but the UI could not be displayed (the network icon was configured to not show in the taskbar, for example).
     * @type {Integer (Int32)}
     */
    static ONEX_UI_FAILURE => 327684

    /**
     * The EAP module returned an error code.  The <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ns-dot1x-onex_eap_error">ONEX_EAP_ERROR</a> structure may contain additional information about the specific EAP error (a certificate not found, for example).
     * @type {Integer (Int32)}
     */
    static ONEX_EAP_FAILURE_RECEIVED => 327685

    /**
     * The peer with which the 802.1X module was negotiating is no longer present or is not responding (a laptop client moved out of range of the wireless access point, for example).
     * @type {Integer (Int32)}
     */
    static ONEX_AUTHENTICATOR_NO_LONGER_PRESENT => 327686

    /**
     * No response was received to an EAP identity response packet. This value indicates a problem with the infrastructure (a link between the wireless access point and the authentication server is not functioning, for example).
     * @type {Integer (Int32)}
     */
    static ONEX_NO_RESPONSE_TO_IDENTITY => 327687

    /**
     * The 802.1X module does not support this version of the profile.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_VERSION_NOT_SUPPORTED => 327688

    /**
     * The length member specified in the 802.1X profile is invalid.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_LENGTH => 327689

    /**
     * The EAP type specified in the 802.1X profile is not allowed for this media. An example is when the keyed MD5 algorithm is used for wireless transmission.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_DISALLOWED_EAP_TYPE => 327690

    /**
     * The EAP type or EAP flags specified in the 802.1X profile are not valid. An example is when EAP type is not installed on the system.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_EAP_TYPE_OR_FLAG => 327691

    /**
     * The 802.1X flags specified in the 802.1X profile are not valid.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_ONEX_FLAGS => 327692

    /**
     * One or more timer values specified in the 802.1X profile is out of its valid range.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_TIMER_VALUE => 327693

    /**
     * The supplicant mode specified in the 802.1X profile is not valid.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_SUPPLICANT_MODE => 327694

    /**
     * The authentication mode specified in the 802.1X profile is not valid.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_AUTH_MODE => 327695

    /**
     * The EAP connection properties specified in the 802.1X profile are not valid.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_EAP_CONNECTION_PROPERTIES => 327696

    /**
     * User input was canceled. This value can be returned if an EAP method requested user input, but the user hit the Cancel button or dismissed the user input dialog.
     * 
     * This value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static ONEX_UI_CANCELLED => 327697

    /**
     * The saved user credentials are not valid.  This value can be returned if a profile was saved with bad credentials (an incorrect password, for example), since the credentials are not tested until the profile is actually used to establish a connection.  
     * 
     * This value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_INVALID_EXPLICIT_CREDENTIALS => 327698

    /**
     * The saved user credentials have expired. This value can be returned if a profile was saved with credentials and the credentials subsequently expired (password expiration after some period of time, for example).
     * 
     * This value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static ONEX_PROFILE_EXPIRED_EXPLICIT_CREDENTIALS => 327699

    /**
     * User interface is not permitted. On Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed, this value can be returned if an EAP method requested user input and the profile is configured with user credentials saved by another user and not the currently logged in user.
     * 
     * This value is supported on Windows 7 and on Windows Server 2008 R2 with the Wireless LAN Service installed.
     * @type {Integer (Int32)}
     */
    static ONEX_UI_NOT_PERMITTED => 327700
}
