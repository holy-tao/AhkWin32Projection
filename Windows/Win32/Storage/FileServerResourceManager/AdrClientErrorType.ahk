#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the possible access denied remediation (ADR) client error types.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclienterrortype
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class AdrClientErrorType extends Win32Enum {

    /**
     * The ADR client error type is unknown.
     * Native name: AdrClientErrorType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The ADR client error type is access denied.
     * Native name: AdrClientErrorType_AccessDenied
     * @type {Integer (Int32)}
     */
    static AccessDenied => 1

    /**
     * Native name: AdrClientErrorType_FileNotFound
     * @type {Integer (Int32)}
     */
    static FileNotFound => 2
}
