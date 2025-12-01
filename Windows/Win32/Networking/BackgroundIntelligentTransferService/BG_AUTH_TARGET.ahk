#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the credentials are used for proxy or server user authentication requests.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ne-bits1_5-bg_auth_target
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_AUTH_TARGET extends Win32Enum{

    /**
     * Use credentials for server requests.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_TARGET_SERVER => 1

    /**
     * Use credentials for proxy requests.
     * @type {Integer (Int32)}
     */
    static BG_AUTH_TARGET_PROXY => 2
}
