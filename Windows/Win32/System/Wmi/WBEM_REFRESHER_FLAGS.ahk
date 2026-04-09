#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags that modify the behavior of refresher methods.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_refresher_flags
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_REFRESHER_FLAGS extends Win32Enum {

    /**
     * If the connection is broken, the refresher attempts to reconnect to the provider automatically.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_REFRESH_AUTO_RECONNECT => 0

    /**
     * If the connection is broken, the refresher does not attempt to reconnect to the provider automatically.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_REFRESH_NO_AUTO_RECONNECT => 1
}
