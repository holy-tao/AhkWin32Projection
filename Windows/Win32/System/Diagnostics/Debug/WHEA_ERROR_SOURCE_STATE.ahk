#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_STATE {
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
    static WheaErrSrcStateStopped => 1

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateStarted => 2

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateRemoved => 3

    /**
     * @type {Integer (Int32)}
     */
    static WheaErrSrcStateRemovePending => 4
}
