#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct FILE_OPENMODE {
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
    static OPENMODE_FAIL_IF_NOT_EXIST => 0

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_FAIL_IF_EXIST => 1

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_RESET_IF_EXIST => 2

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_APPEND_IF_EXIST => 3

    /**
     * @type {Integer (Int32)}
     */
    static OPENMODE_DELETE_IF_EXIST => 4
}
