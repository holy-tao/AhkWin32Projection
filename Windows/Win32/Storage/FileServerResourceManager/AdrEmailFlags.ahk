#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the options for access denied remediation (ADR) email.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adremailflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class AdrEmailFlags extends Win32Enum {

    /**
     * The ADR email will include the owner on the To: line.
     * Native name: AdrEmailFlags_PutDataOwnerOnToLine
     * @type {Integer (Int32)}
     */
    static PutDataOwnerOnToLine => 1

    /**
     * The ADR email will include the administrator on the To: line.
     * Native name: AdrEmailFlags_PutAdminOnToLine
     * @type {Integer (Int32)}
     */
    static PutAdminOnToLine => 2

    /**
     * The ADR email will include the device claims.
     * Native name: AdrEmailFlags_IncludeDeviceClaims
     * @type {Integer (Int32)}
     */
    static IncludeDeviceClaims => 4

    /**
     * The ADR email will include the user information.
     * Native name: AdrEmailFlags_IncludeUserInfo
     * @type {Integer (Int32)}
     */
    static IncludeUserInfo => 8

    /**
     * When the ADR email is sent, an entry will be added to the event log.
     * Native name: AdrEmailFlags_GenerateEventLog
     * @type {Integer (Int32)}
     */
    static GenerateEventLog => 16
}
