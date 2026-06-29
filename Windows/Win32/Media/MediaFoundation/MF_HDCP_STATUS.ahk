#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_HDCP_STATUS {
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
    static MF_HDCP_STATUS_ON => 0

    /**
     * @type {Integer (Int32)}
     */
    static MF_HDCP_STATUS_OFF => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_HDCP_STATUS_ON_WITH_TYPE_ENFORCEMENT => 2
}
