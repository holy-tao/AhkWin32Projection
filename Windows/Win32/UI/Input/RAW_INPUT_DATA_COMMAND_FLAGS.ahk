#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input
 */
export default struct RAW_INPUT_DATA_COMMAND_FLAGS {
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
    static RID_HEADER => 268435461

    /**
     * @type {Integer (UInt32)}
     */
    static RID_INPUT => 268435459
}
