#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PlayerState enumeration type provides some basic states of Windows Media Player.
 * @remarks
 * This enumeration is used by the <b>TimedLevel</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/effects/ne-effects-playerstate
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct PlayerState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static stop_state => 0

    /**
     * @type {Integer (Int32)}
     */
    static pause_state => 1

    /**
     * @type {Integer (Int32)}
     */
    static play_state => 2
}
