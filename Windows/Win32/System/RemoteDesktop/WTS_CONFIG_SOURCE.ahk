#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the source of configuration information returned by the WTSQueryUserConfig function.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_config_source
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CONFIG_SOURCE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The configuration information came from the Security Accounts Manager (SAM) database.
     * @type {Integer (Int32)}
     */
    static WTSUserConfigSourceSAM => 0
}
