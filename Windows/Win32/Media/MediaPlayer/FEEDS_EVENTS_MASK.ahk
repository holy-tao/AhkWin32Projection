#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct FEEDS_EVENTS_MASK {
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
    static FEM_FOLDEREVENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static FEM_FEEDEVENTS => 2
}
