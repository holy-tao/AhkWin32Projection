#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that modify the behavior of refresher methods.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_refresher_flags
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_REFRESHER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
