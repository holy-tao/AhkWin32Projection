#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_TRANSFORM_FLAG {
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
    static TATF_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static TATF_TARGETVALUES_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static TATF_HASINITIALVALUES => 2

    /**
     * @type {Integer (Int32)}
     */
    static TATF_HASORIGINVALUES => 4
}
