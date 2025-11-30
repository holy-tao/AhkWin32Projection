#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_PRESHARED_KEY_AUTHENTICATION_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_PSK_FLAG_LOCAL_AUTH_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IKEEXT_PSK_FLAG_REMOTE_AUTH_ONLY => 2
}
