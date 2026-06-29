#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Mmc
 */
export default struct CCM_INSERTIONALLOWED {
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
    static CCM_INSERTIONALLOWED_TOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONALLOWED_NEW => 2

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONALLOWED_TASK => 4

    /**
     * @type {Integer (Int32)}
     */
    static CCM_INSERTIONALLOWED_VIEW => 8
}
