#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates one of several stock environment types.
 * @see https://learn.microsoft.com/windows/win32/api/hrtfapoapi/ne-hrtfapoapi-hrtfenvironment
 * @namespace Windows.Win32.Media.Audio.XAudio2
 */
export default struct HrtfEnvironment {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A small room.
     * @type {Integer (Int32)}
     */
    static Small => 0

    /**
     * A medium-sized room.
     * @type {Integer (Int32)}
     */
    static Medium => 1

    /**
     * A large, enclosed space.
     * @type {Integer (Int32)}
     */
    static Large => 2

    /**
     * An outdoor space.
     * @type {Integer (Int32)}
     */
    static Outdoors => 3
}
