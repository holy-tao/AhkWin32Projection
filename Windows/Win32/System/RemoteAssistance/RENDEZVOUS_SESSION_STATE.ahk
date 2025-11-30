#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the list of possible state codes of the session invitation.
 * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/ne-rendezvoussession-rendezvous_session_state
 * @namespace Windows.Win32.System.RemoteAssistance
 * @version v4.0.30319
 */
class RENDEZVOUS_SESSION_STATE extends Win32Enum{

    /**
     * Unknown response.
     * @type {Integer (Int32)}
     */
    static RSS_UNKNOWN => 0

    /**
     * The session is ready.
     * @type {Integer (Int32)}
     */
    static RSS_READY => 1

    /**
     * The session is an invitation.
     * @type {Integer (Int32)}
     */
    static RSS_INVITATION => 2

    /**
     * The session is accepted.
     * @type {Integer (Int32)}
     */
    static RSS_ACCEPTED => 3

    /**
     * The session is not ready.
     * @type {Integer (Int32)}
     */
    static RSS_CONNECTED => 4

    /**
     * The local session canceled.
     * @type {Integer (Int32)}
     */
    static RSS_CANCELLED => 5

    /**
     * The session is remotely cancelled.
     * @type {Integer (Int32)}
     */
    static RSS_DECLINED => 6

    /**
     * Protocol error.
     * @type {Integer (Int32)}
     */
    static RSS_TERMINATED => 7
}
