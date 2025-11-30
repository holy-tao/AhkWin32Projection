#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Provides the list of possible flags for the session invitation.
 * @see https://docs.microsoft.com/windows/win32/api//rendezvoussession/ne-rendezvoussession-rendezvous_session_flags
 * @namespace Windows.Win32.System.RemoteAssistance
 * @version v4.0.30319
 */
class RENDEZVOUS_SESSION_FLAGS extends Win32Enum{

    /**
     * No such value.
     * @type {Integer (Int32)}
     */
    static RSF_NONE => 0

    /**
     * The party that sets the session object is the inviter.
     * @type {Integer (Int32)}
     */
    static RSF_INVITER => 1

    /**
     * The party that sets the session object is the recipient.
     * @type {Integer (Int32)}
     */
    static RSF_INVITEE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RSF_ORIGINAL_INVITER => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RSF_REMOTE_LEGACYSESSION => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static RSF_REMOTE_WIN7SESSION => 16
}
