#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_VOICE_CALL_STATE enumerated type specifies the current voice call state of the device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_voice_call_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_VOICE_CALL_STATE extends Win32Enum{

    /**
     * Voice call state is unknown.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CALL_STATE_NONE => 0

    /**
     * An active voice call is in progress.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CALL_STATE_IN_PROGRESS => 1

    /**
     * No voice call is in progress.
     * @type {Integer (Int32)}
     */
    static MBN_VOICE_CALL_STATE_HANGUP => 2
}
