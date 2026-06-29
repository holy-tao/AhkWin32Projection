#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TAPE_POSITION_TYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_ABSOLUTE_POSITION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LOGICAL_POSITION => 1
}
