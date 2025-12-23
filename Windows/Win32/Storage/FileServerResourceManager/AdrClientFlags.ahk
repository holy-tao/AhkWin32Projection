#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates flags for indicating why an access denied remediation (ADR) client operation could not be performed.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclientflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class AdrClientFlags extends Win32Enum{

    /**
     * No ADR client flags are specified.
     * @type {Integer (Int32)}
     */
    static AdrClientFlags_None => 0

    /**
     * ADR client operations should fail when local paths are specified.
     * @type {Integer (Int32)}
     */
    static AdrClientFlags_FailForLocalPaths => 1

    /**
     * ADR client operations should fail if the operation is not supported by the server.
     * @type {Integer (Int32)}
     */
    static AdrClientFlags_FailIfNotSupportedByServer => 2

    /**
     * ADR client operations should fail if the computer is not joined to a domain.
     * @type {Integer (Int32)}
     */
    static AdrClientFlags_FailIfNotDomainJoined => 4
}
