#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct IMAGE_LIST_COPY_FLAGS {
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
    static ILCF_MOVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ILCF_SWAP => 1
}
