#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIAKEYS_REQUIREMENT {
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
    static MF_MEDIAKEYS_REQUIREMENT_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYS_REQUIREMENT_OPTIONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MF_MEDIAKEYS_REQUIREMENT_NOT_ALLOWED => 3
}
