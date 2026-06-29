#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_CONTEXT_EDIT_CONTEXT_FLAGS {
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
    static TF_ES_ASYNCDONTCARE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_SYNC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_READ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_READWRITE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static TF_ES_ASYNC => 8
}
