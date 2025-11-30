#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the user's credentials will be used.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mfnetauthenticationflags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFNetAuthenticationFlags extends Win32Enum{

    /**
     * The credentials will be used to authenticate with a proxy.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_PROXY => 1

    /**
     * The credentials will be sent over the network unencrypted.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_CLEAR_TEXT => 2

    /**
     * The credentials must be from a user who is currently logged on.
     * @type {Integer (Int32)}
     */
    static MFNET_AUTHENTICATION_LOGGED_ON_USER => 4
}
