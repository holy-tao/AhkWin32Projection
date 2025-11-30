#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of logon requested by a logon process.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-security_logon_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECURITY_LOGON_TYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static UndefinedLogonType => 0

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a> is logging on interactively.
     * @type {Integer (Int32)}
     */
    static Interactive => 2

    /**
     * The security principal is logging using a network.
     * @type {Integer (Int32)}
     */
    static Network => 3

    /**
     * The logon is for a batch process.
     * @type {Integer (Int32)}
     */
    static Batch => 4

    /**
     * The logon is for a service account.
     * @type {Integer (Int32)}
     */
    static Service => 5

    /**
     * Not supported.
     * @type {Integer (Int32)}
     */
    static Proxy => 6

    /**
     * The logon is an attempt to unlock a workstation.
     * @type {Integer (Int32)}
     */
    static Unlock => 7

    /**
     * The logon is a network logon with plaintext credentials.
     * @type {Integer (Int32)}
     */
    static NetworkCleartext => 8

    /**
     * Allows the caller to clone its current token and specify new credentials for outbound connections. The new logon session has the same local identity but uses different credentials for other network connections.
     * @type {Integer (Int32)}
     */
    static NewCredentials => 9

    /**
     * A terminal server session that is both remote and interactive.
     * @type {Integer (Int32)}
     */
    static RemoteInteractive => 10

    /**
     * Attempt to use the cached credentials without going out across the network.
     * @type {Integer (Int32)}
     */
    static CachedInteractive => 11

    /**
     * Same as <b>RemoteInteractive</b>, except used internally for auditing purposes.
     * @type {Integer (Int32)}
     */
    static CachedRemoteInteractive => 12

    /**
     * The logon is an attempt to unlock a workstation.
     * @type {Integer (Int32)}
     */
    static CachedUnlock => 13
}
