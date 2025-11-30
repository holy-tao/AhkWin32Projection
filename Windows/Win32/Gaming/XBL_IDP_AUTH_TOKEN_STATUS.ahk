#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Reserved for Microsoft use.
 * @see https://docs.microsoft.com/windows/win32/api//xblidpauthmanager/ne-xblidpauthmanager-xbl_idp_auth_token_status
 * @namespace Windows.Win32.Gaming
 * @version v4.0.30319
 */
class XBL_IDP_AUTH_TOKEN_STATUS extends Win32Enum{

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
