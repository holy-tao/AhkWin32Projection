#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Reserved for Microsoft use. (XBL_IDP_AUTH_TOKEN_STATUS)
 * @see https://learn.microsoft.com/windows/win32/api/xblidpauthmanager/ne-xblidpauthmanager-xbl_idp_auth_token_status
 * @namespace Windows.Win32.Gaming
 */
class XBL_IDP_AUTH_TOKEN_STATUS extends Win32Enum {

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS
     * @type {Integer (Int32)}
     */
    static SUCCESS => 0

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS
     * @type {Integer (Int32)}
     */
    static OFFLINE_SUCCESS => 1

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET
     * @type {Integer (Int32)}
     */
    static NO_ACCOUNT_SET => 2

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED
     * @type {Integer (Int32)}
     */
    static LOAD_MSA_ACCOUNT_FAILED => 3

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO
     * @type {Integer (Int32)}
     */
    static XBOX_VETO => 4

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT
     * @type {Integer (Int32)}
     */
    static MSA_INTERRUPT => 5

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT
     * @type {Integer (Int32)}
     */
    static OFFLINE_NO_CONSENT => 6

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET
     * @type {Integer (Int32)}
     */
    static VIEW_NOT_SET => 7

    /**
     * Reserved for Microsoft use.
     * Native name: XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => -1
}
