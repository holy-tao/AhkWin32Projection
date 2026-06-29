#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COPYPROGRESSROUTINE_PROGRESS {
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
    static PROGRESS_CONTINUE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_CANCEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_STOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROGRESS_QUIET => 3
}
