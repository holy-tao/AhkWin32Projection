#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the various target modes.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmtargetmode
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct WcmTargetMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This value indicates that the only expansions that will be performed on environment variables are those defined in the target.
     * @type {Integer (Int32)}
     */
    static OfflineMode => 1

    /**
     * This value indicates that the expansions will preferentially expand from the target. If a matching expansion is not found, the expansions will fall through to the current environment of the process.
     * @type {Integer (Int32)}
     */
    static OnlineMode => 2
}
