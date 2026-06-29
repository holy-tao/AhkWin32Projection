#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the possible types of access denied remediation (ADR) client display flags.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclientdisplayflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct AdrClientDisplayFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates whether to send the user an email after an ADR event.
     * @type {Integer (Int32)}
     */
    static AdrClientDisplayFlags_AllowEmailRequests => 1

    /**
     * Indicates whether to show the user the offending device claims.
     * @type {Integer (Int32)}
     */
    static AdrClientDisplayFlags_ShowDeviceTroubleshooting => 2
}
