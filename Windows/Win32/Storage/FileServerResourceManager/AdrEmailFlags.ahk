#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the options for access denied remediation (ADR) email.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adremailflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct AdrEmailFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The ADR email will include the owner on the To: line.
     * @type {Integer (Int32)}
     */
    static AdrEmailFlags_PutDataOwnerOnToLine => 1

    /**
     * The ADR email will include the administrator on the To: line.
     * @type {Integer (Int32)}
     */
    static AdrEmailFlags_PutAdminOnToLine => 2

    /**
     * The ADR email will include the device claims.
     * @type {Integer (Int32)}
     */
    static AdrEmailFlags_IncludeDeviceClaims => 4

    /**
     * The ADR email will include the user information.
     * @type {Integer (Int32)}
     */
    static AdrEmailFlags_IncludeUserInfo => 8

    /**
     * When the ADR email is sent, an entry will be added to the event log.
     * @type {Integer (Int32)}
     */
    static AdrEmailFlags_GenerateEventLog => 16
}
