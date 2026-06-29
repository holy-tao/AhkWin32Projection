#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSMETHOD_BDA_CHANGE_SYNC {
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
    static KSMETHOD_BDA_START_CHANGES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_CHECK_CHANGES => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_COMMIT_CHANGES => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_GET_CHANGE_STATE => 3
}
