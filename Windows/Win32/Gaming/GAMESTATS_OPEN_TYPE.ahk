#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Gaming
 */
export default struct GAMESTATS_OPEN_TYPE {
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
    static GAMESTATS_OPEN_OPENORCREATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static GAMESTATS_OPEN_OPENONLY => 1
}
