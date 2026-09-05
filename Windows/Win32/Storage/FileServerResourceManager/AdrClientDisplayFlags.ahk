#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the possible types of access denied remediation (ADR) client display flags.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-adrclientdisplayflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
class AdrClientDisplayFlags extends Win32Enum {

    /**
     * Indicates whether to send the user an email after an ADR event.
     * Native name: AdrClientDisplayFlags_AllowEmailRequests
     * @type {Integer (Int32)}
     */
    static AllowEmailRequests => 1

    /**
     * Indicates whether to show the user the offending device claims.
     * Native name: AdrClientDisplayFlags_ShowDeviceTroubleshooting
     * @type {Integer (Int32)}
     */
    static ShowDeviceTroubleshooting => 2
}
