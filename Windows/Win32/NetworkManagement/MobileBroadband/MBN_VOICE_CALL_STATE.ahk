#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_VOICE_CALL_STATE enumerated type specifies the current voice call state of the device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_voice_call_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class MBN_VOICE_CALL_STATE extends Win32Enum {

    /**
     * Voice call state is unknown.
     * Native name: MBN_VOICE_CALL_STATE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * An active voice call is in progress.
     * Native name: MBN_VOICE_CALL_STATE_IN_PROGRESS
     * @type {Integer (Int32)}
     */
    static IN_PROGRESS => 1

    /**
     * No voice call is in progress.
     * Native name: MBN_VOICE_CALL_STATE_HANGUP
     * @type {Integer (Int32)}
     */
    static HANGUP => 2
}
