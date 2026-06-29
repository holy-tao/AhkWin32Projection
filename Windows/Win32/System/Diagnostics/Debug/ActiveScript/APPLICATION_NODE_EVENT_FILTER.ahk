#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct APPLICATION_NODE_EVENT_FILTER {
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
    static FILTER_EXCLUDE_NOTHING => 0

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_EXCLUDE_ANONYMOUS_CODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static FILTER_EXCLUDE_EVAL_CODE => 2
}
