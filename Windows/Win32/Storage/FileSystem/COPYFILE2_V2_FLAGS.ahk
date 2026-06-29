#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct COPYFILE2_V2_FLAGS {
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
    static COPY_FILE2_V2_DONT_COPY_JUNCTIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE2_V2_DISABLE_BLOCK_CLONING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static COPY_FILE2_V2_VALID_FLAGS => 3
}
