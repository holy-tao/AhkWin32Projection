#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct FLT_SET_CONTEXT_OPERATION {
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
    static FLT_SET_CONTEXT_REPLACE_IF_EXISTS => 0

    /**
     * @type {Integer (Int32)}
     */
    static FLT_SET_CONTEXT_KEEP_IF_EXISTS => 1
}
