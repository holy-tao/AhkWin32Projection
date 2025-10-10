#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the possible access denied remediation (ADR) client error types.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-adrclienterrortype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class AdrClientErrorType{

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
     * 
     * @type {Integer (Int32)}
     */
    static AdrClientErrorType_FileNotFound => 2
}
