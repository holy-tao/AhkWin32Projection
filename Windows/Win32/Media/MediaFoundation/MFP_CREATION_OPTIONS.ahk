#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFP_CREATION_OPTIONS {
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
    static MFP_OPTION_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_FREE_THREADED_CALLBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_NO_MMCSS => 2

    /**
     * @type {Integer (Int32)}
     */
    static MFP_OPTION_NO_REMOTE_DESKTOP_OPTIMIZATION => 4
}
