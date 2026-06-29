#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _PDMODE {
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
    static PDM_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static PDM_RUN => 1

    /**
     * @type {Integer (Int32)}
     */
    static PDM_PREFLIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PDM_UNDOING => 4

    /**
     * @type {Integer (Int32)}
     */
    static PDM_ERRORSBLOCKING => 8

    /**
     * @type {Integer (Int32)}
     */
    static PDM_INDETERMINATE => 16
}
