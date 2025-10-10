#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the custom callback function to specify why the callback function is being called.
 * @remarks
 * 
  * The callback function can use this message, together with the <i>hr</i> parameter, to determine the status of a request to a server.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msdrmdefs/ne-msdrmdefs-drm_status_msg
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRM_STATUS_MSG{

    /**
     * AD RMS is attempting to activate the machine. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-activate-machine">DRM_MSG_ACTIVATE_MACHINE</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACTIVATE_MACHINE => 0

    /**
     * AD RMS is attempting to activate a user. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-activate-groupidentity">DRM_MSG_ACTIVATE_GROUPIDENTITY</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACTIVATE_GROUPIDENTITY => 1

    /**
     * AD RMS is attempting to acquire a license. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-license">DRM_MSG_ACQUIRE_LICENSE</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACQUIRE_LICENSE => 2

    /**
     * AD RMS is attempting to acquire a revocation list. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-advisory">DRM_MSG_ACQUIRE_ADVISORY</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACQUIRE_ADVISORY => 3

    /**
     * AD RMS is attempting to acquire a signed issuance license. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-sign-issuance-license">DRM_MSG_SIGN_ISSUANCE_LICENSE</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_SIGN_ISSUANCE_LICENSE => 4

    /**
     * AD RMS is attempting to acquire a client licensor certificate. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-clientlicensor">DRM_MSG_ACQUIRE_CLIENTLICENSOR</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACQUIRE_CLIENTLICENSOR => 5

    /**
     * AD RMS is attempting to acquire a template collection. For more information, see the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/adrms_sdk/drm-msg-acquire-issuance-license-template">DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE</a> message.
     * @type {Integer (Int32)}
     */
    static DRM_MSG_ACQUIRE_ISSUANCE_LICENSE_TEMPLATE => 6
}
