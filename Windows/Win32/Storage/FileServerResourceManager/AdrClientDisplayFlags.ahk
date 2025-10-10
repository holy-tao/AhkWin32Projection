#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the possible types of access denied remediation (ADR) client display flags.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-adrclientdisplayflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class AdrClientDisplayFlags{

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
