#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AGENT_SESSION_EVENT enumeration (tapi3cc.h) describes agent session events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3cc/ne-tapi3cc-agent_session_event
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class AGENT_SESSION_EVENT extends Win32Enum{

    /**
     * A new agent session has been created.
     * @type {Integer (Int32)}
     */
    static ASE_NEW_SESSION => 0

    /**
     * The agent is unable to handle calls for this session.
     * @type {Integer (Int32)}
     */
    static ASE_NOT_READY => 1

    /**
     * The agent is able to handle calls for this session.
     * @type {Integer (Int32)}
     */
    static ASE_READY => 2

    /**
     * The agent is active in this session handling an ACD call.
     * @type {Integer (Int32)}
     */
    static ASE_BUSY => 3

    /**
     * The agent is active in this session handling the wrap-up of an ACD call.
     * @type {Integer (Int32)}
     */
    static ASE_WRAPUP => 4

    /**
     * The session has completed.
     * @type {Integer (Int32)}
     */
    static ASE_END => 5
}
