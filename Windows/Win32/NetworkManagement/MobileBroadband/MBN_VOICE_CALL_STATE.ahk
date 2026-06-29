#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MBN_VOICE_CALL_STATE enumerated type specifies the current voice call state of the device.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_voice_call_state
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_VOICE_CALL_STATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
