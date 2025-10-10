#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags that modify the behavior of refresher methods.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_refresher_flags
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_REFRESHER_FLAGS{

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
