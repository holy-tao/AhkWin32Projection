#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct FILE_ACCESSMODE {
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
    static ACCESSMODE_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_READWRITE => 3

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSMODE_WRITE_EXCLUSIVE => 4
}
