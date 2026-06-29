#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Reserved for Microsoft use. (XBL_IDP_AUTH_TOKEN_STATUS)
 * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/ne-xblidpauthmanager-xbl_idp_auth_token_status
 * @namespace Windows.Win32.Gaming
 */
export default struct XBL_IDP_AUTH_TOKEN_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS => 0

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS => 1

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET => 2

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED => 3

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO => 4

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT => 5

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT => 6

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET => 7

    /**
     * Reserved for Microsoft use.
     * @type {Integer (Int32)}
     */
    static XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN => -1
}
