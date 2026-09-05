#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates flags for indicating why an access denied remediation (ADR) client operation could not be performed.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclientflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class AdrClientFlags extends Win32Enum {

    /**
     * No ADR client flags are specified.
     * Native name: AdrClientFlags_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * ADR client operations should fail when local paths are specified.
     * Native name: AdrClientFlags_FailForLocalPaths
     * @type {Integer (Int32)}
     */
    static FailForLocalPaths => 1

    /**
     * ADR client operations should fail if the operation is not supported by the server.
     * Native name: AdrClientFlags_FailIfNotSupportedByServer
     * @type {Integer (Int32)}
     */
    static FailIfNotSupportedByServer => 2

    /**
     * ADR client operations should fail if the computer is not joined to a domain.
     * Native name: AdrClientFlags_FailIfNotDomainJoined
     * @type {Integer (Int32)}
     */
    static FailIfNotDomainJoined => 4
}
