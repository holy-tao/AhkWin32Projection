#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the possible access denied remediation (ADR) client error types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclienterrortype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct AdrClientErrorType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The ADR client error type is unknown.
     * @type {Integer (Int32)}
     */
    static AdrClientErrorType_Unknown => 0

    /**
     * The ADR client error type is access denied.
     * @type {Integer (Int32)}
     */
    static AdrClientErrorType_AccessDenied => 1

    /**
     * @type {Integer (Int32)}
     */
    static AdrClientErrorType_FileNotFound => 2
}
