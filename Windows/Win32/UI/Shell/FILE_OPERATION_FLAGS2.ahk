#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FILE_OPERATION_FLAGS2 {
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
    static FOF2_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FOF2_MERGEFOLDERSONCOLLISION => 1
}
